(* Helper function *)
function isMinter (const acct : address; const s : storage) : bool is
  s.roles.minter contains acct;

(* Mint new tokens *)
function mint (const to_ : address; const value : amt; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Only senders with the minter role can mint new tokens *)
    if isMinter(Tezos.sender, s) = False then
      failwith("OperationNotAllowed")
    else skip;

#if TOKEN__MINTABLE__CAPPED
    (* Check supply cap won't be exceeded *)
    if s.totalSupply + value > s.cap then
      failwith("MintCapExceeded")
    else skip;
#endif

    (* Update total supply *)
    s.totalSupply := s.totalSupply + value;

    (* Create or get destination account *)
    var destAccount : account := getAccount(to_, s);

    (* Update destination balance *)
    destAccount.balance := destAccount.balance + value;

    (* Update storage *)
    s.ledger[to_] := destAccount;

  } with (noOperations, s)

(* Add a minter *)
function addMinter (const acct : trusted; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Only current minters can add a new minter *)
    if isMinter(Tezos.sender, s) = False then
      failwith("OperationNotAllowed")
    else skip;

    (* Add minter *)
    s.roles.minter := Set.add (acct, s.roles.minter);
  } with (noOperations, s)

(* Remove yourself as a minter *)
function renounceMinter (var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    if isMinter(Tezos.sender, s) = False then
      failwith("OperationNotAllowed")
    else skip;

    (* Remove self as minter *)
    s.roles.minter := Set.remove (Tezos.sender, s.roles.minter);

  } with (noOperations, s)

(* Transfer minter role to another account *)
function transferMinterRole (const acct : trusted; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Only current minters can add a new minter *)
    if isMinter(Tezos.sender, s) = False then
      failwith("OperationNotAllowed")
    else skip;

    (* Add minter *)
    s.roles.minter := Set.add (acct, s.roles.minter);

    //renounceMinter(s);
  } with (noOperations, s)
