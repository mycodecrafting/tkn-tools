(* Mineable tokens through PoW *)

#include "../utils/bytes.ligo"

(* Define types *)
type trusted is address
type amt is nat

(* contract storage *)
type storage is
  record [
    totalMineable   : amt;
    totalMined      : amt;
    challenge       : bytes;
    target          : int;
    lastAdjustment  : timestamp;
    blocksMined     : int;
    rewardEra       : int;
    rewardEraSupply : amt;
    tokenContract   : trusted;
    solutions       : big_map (bytes, bytes); // big_map( challenge, solution )
    lastReward      : record [
      miner           : address;
      reward          : amt;
      blockTime       : timestamp
    ];

    (* Define some mining params *)
    params          : record [
      blocksPerAdjustment   : int;
      secPerBlock           : int;
      minTarget             : int;
      maxTarget             : int;
    ]
  ]

(* Define some constants for mining params *)
// Oversized operation (size: 16465, max: 16384)
//const c__blocks_per_readjustment : int  = 1024;      // adjust difficulty every 1024 blocks
//const c__sec_per_block : int            = 10 * 60;   // 10 minutes per block
//const c__min_target : int               = 65536;     // 2**16
//const c__max_target : int               = 6901746346790563787434755862277025452451108972170386555162524223799296; // 2**232

(* define return for readability *)
type return is list (operation) * storage

(* define noop for readability *)
const noOperations : list (operation) = nil;

(* Inputs *)
type mintParams is michelson_pair(address, "to", amt, "value")
type mineParams is michelson_pair(bytes, "nonce", bytes, "solution")

(* Get current mining reward *)
function getMiningReward (const s : storage) : amt is
  50_00000000n / abs(int_pow(2, s.rewardEra));

(* Verify mining solution *)
function verifySolution (const nonce : bytes; const solution : bytes; const s : storage) : bool is
  Crypto.blake2b(Bytes.concat(s.challenge, nonce)) = solution and bytes_to_int(solution) <= s.target;

(* Adjust mining difficulty *)
function adjustDifficulty (var s : storage) : storage is
  block {

    (* Current Difficulty = Difficulty_1_target / Current Target *)
    const currentDiff : int = s.params.maxTarget * 1000000 / s.target;

    (* Next Difficulty = Current Difficulty * Target Time / Actual Time *)
    (* Target Time is Time in which blocksPerAdjustment should be found *)
    (* Actual Time is Time in which blocksPerAdjustment were last found *)
    const nextDiff : int = currentDiff * (s.params.blocksPerAdjustment * s.params.secPerBlock) / (Tezos.now - s.lastAdjustment);

    (* Next Target = Difficulty_1_target / Next Difficulty *)
    s.target := s.params.maxTarget * 1000000 / nextDiff;

    (* Enforce target limits *)
    if s.target > s.params.maxTarget then s.target := s.params.maxTarget else skip;
    if s.target < s.params.minTarget then s.target := s.params.minTarget else skip;

    (* Update last adjustment *)
    s.lastAdjustment := Tezos.now;

  } with s

(* Mine a new token block *)
function mine (const nonce : bytes; const solution : bytes; var s : storage) : return is
  block {

    (* Verify the solution *)
    if verifySolution(nonce, solution, s) = False then 
      failwith ("Invalid")
    else skip;

    (* challenge already has a solution. Not sure if this would ever happen? *)
    case s.solutions[s.challenge] of
        Some (solved) -> failwith ("Solved")
      | None -> skip
      end;

    (* Solution passed; mint the mining reward *)
    const reward : amt = getMiningReward(s);
    const mintEntrypoint : contract (address * amt) = get_entrypoint("%mint", s.tokenContract);
    const mintOperation : operation = transaction ((Tezos.sender, reward), 0tz, mintEntrypoint);
    const operations : list(operation) = list [mintOperation];

    (* Update storage *)
    s.totalMined := s.totalMined + reward;
    s.lastReward.miner := Tezos.sender;
    s.lastReward.reward := reward;
    s.lastReward.blockTime := Tezos.now;

    (* Add solution to set *)
    s.solutions[s.challenge] := solution;

    (* Initialize a new mining block *)

    (* Check if reward era has changed *)
    const nextMined : amt = s.totalMined + getMiningReward(s);
    if nextMined > s.rewardEraSupply and s.rewardEra < 39 then
      s.rewardEra := s.rewardEra + 1;
    else skip;

    (* Update supply for era *)
    s.rewardEraSupply := abs(s.totalMineable - (s.totalMineable / abs(int_pow(2, s.rewardEra + 1))));

    (* Update blocks mined counter *)
    s.blocksMined := s.blocksMined + 1;

    (* time for difficult adjustment *)
    const m : nat = s.blocksMined mod s.params.blocksPerAdjustment;
    if m = 0n then
      s := adjustDifficulty(s);
    else skip;

    (* Set new challenge as a hash of the accepted solution *)
    s.challenge := Crypto.blake2b(solution);

  } with (operations, s)

(* Main entrypoint *)
function main (const params : mineParams; var s : storage) : return is
  mine(params.0, params.1, s);
