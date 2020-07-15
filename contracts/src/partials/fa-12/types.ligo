(* Define types *)
type trusted is address
type amt is nat

type account is
  record [
    balance         : amt;
    allowances      : map (trusted, amt);
#if TOKEN__PROOF_OF_BURN
    burned          : tez;
    rewarded        : amt;
    lastRewarded    : timestamp;
#endif
  ]

type permissions is
  record [
    owner           : trusted;
#if TOKEN__MINTABLE
    minter          : set (trusted);
#endif
  ]

(* contract storage *)
type storage is
  record [
    totalSupply     : amt;

#if TOKEN__MINTABLE__CAPPED
    cap             : amt;
#endif

#if TOKEN__PAUSABLE
    paused          : bool;
#endif

    name            : string; (* metadata *)
    symbol          : string; (* metadata *)
    decimals        : nat;    (* metadata *)
    ledger          : big_map (address, account);
    roles           : permissions;

#if TOKEN__PROOF_OF_BURN
    totalBurned     : tez;
    totalRewarded   : amt;
    reward          : amt;
    rewardInterval  : int;
#endif

  ]

(* define return for readability *)
type return is list (operation) * storage

(* define noop for readability *)
const noOperations : list (operation) = nil;

(* Inputs *)
type transferParams is michelson_pair(address, "from", michelson_pair(address, "to", amt, "value"), "")
type approveParams is michelson_pair(trusted, "spender", amt, "value")
type balanceParams is michelson_pair(address, "owner", contract(amt), "")
type allowanceParams is michelson_pair(michelson_pair(address, "owner", trusted, "spender"), "", contract(amt), "")
type totalSupplyParams is (unit * contract(amt))

#if TOKEN__MINTABLE
type mintParams is michelson_pair(address, "to", amt, "value")
type addMinterParams is trusted
type transferMinterRoleParams is trusted
#endif

#if TOKEN__BURNABLE
type burnParams is michelson_pair(address, "from", amt, "value")
#endif

(* Valid entry points *)
type entryAction is
  | Transfer of transferParams
  | Approve of approveParams
  | GetBalance of balanceParams
  | GetAllowance of allowanceParams

#if TOKEN__MINTABLE
  | Mint of mintParams
  | AddMinter of addMinterParams
  | TransferMinterRole of transferMinterRoleParams
  | RenounceMinter
#endif

#if TOKEN__BURNABLE
  | Burn of burnParams
#endif

#if TOKEN__PAUSABLE
  | Pause
  | Unpause
#endif

#if TOKEN__PROOF_OF_BURN
  | Stake
  | Claim
#endif

  | GetTotalSupply of totalSupplyParams
