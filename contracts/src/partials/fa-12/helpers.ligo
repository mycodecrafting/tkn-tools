(* Collection of helper functions for the contract to use *)

(* Helper function to determine if caller is contract owner *)
function isOwner(const s : storage) : bool is
  s.roles.owner = Tezos.sender;

(* Helper function to get account *)
function getAccount (const addr : address; const s : storage) : account is
  case s.ledger[addr] of
    Some(instance) -> instance
  | None -> record [
      balance         = 0n;
      allowances      = (map [] : map (address, amt));

#if TOKEN__PROOF_OF_BURN
      burned          = 0mutez;
      rewarded        = 0n;
      lastRewarded    = ("2020-01-01T00:00:00Z" : timestamp) // just some fake date
#endif

    ]
  end;

(* Helper function to get allowance for an account *)
function getAllowance (const ownerAccount : account; const spender : address; const s : storage) : amt is
  case ownerAccount.allowances[spender] of
    Some (amt) -> amt
  | None -> 0n
  end;
