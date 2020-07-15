(* Tokens through Proof of Burn (POB) *)

(* Burn XTZ for token reward rights *)
(* @TODO rename to something better *)
function stake (var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Must burns some XTZ *)
    if Tezos.amount = 0mutez then
      failwith("InvalidBurnAmount")
    else skip;

    (* Retrieve sender account from storage *)
    const senderAccount : account = getAccount(Tezos.sender, s);

    (* Update sender account burned *)
    senderAccount.burned := senderAccount.burned + Tezos.amount;

    (* Update ledger *)
    s.ledger[Tezos.sender] := senderAccount;

    (* Update global totalBurned *)
    s.totalBurned := s.totalBurned + Tezos.amount;

  } with (noOperations, s)

(* Claim reward tokens *)
function claim (var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Retrieve sender account from storage *)
    const senderAccount : account = getAccount(Tezos.sender, s);

    (* Nothing burned *)
    if senderAccount.burned = 0mutez then
      failwith("InvalidClaim")
    else skip;

    (* Can only claim once per reward period *)
    if senderAccount.lastRewarded + s.rewardInterval > Tezos.now then
      failwith("ClaimingTooSoon")
    else skip;

    (* Issue reward that corresponds to stake in burn pool *)
    const reward : amt = (senderAccount.burned * s.reward) / s.totalBurned;

#if TOKEN__MINTABLE__CAPPED
    (* Check supply cap won't be exceeded *)
    if s.totalSupply + reward > s.cap then
      failwith("MintCapExceeded")
    else skip;
#endif

    (* Update account *)
    senderAccount.lastRewarded := Tezos.now;
    senderAccount.rewarded := senderAccount.rewarded + reward;
    senderAccount.balance := senderAccount.balance + reward;

    (* Update storage *)
    s.ledger[Tezos.sender] := senderAccount;
    s.totalRewarded := s.totalRewarded + reward;
    s.totalSupply := s.totalSupply + reward;

  } with (noOperations, s)
