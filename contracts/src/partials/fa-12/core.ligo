(* Transfer token to another account *)
function transfer (const from_ : address; const to_ : address; const value : amt; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Sending to yourself? *)
    if from_ = to_ then
      failwith("InvalidSelfToSelfTransfer")
    else skip;

    (* Retrieve sender account from storage *)
    const senderAccount : account = getAccount(from_, s);

    (* Balance check *)
    if senderAccount.balance < value then
      failwith("NotEnoughBalance")
    else skip;

    (* Check this address can spend the tokens *)
    if from_ =/= Tezos.sender then block {
      const spenderAllowance : amt = getAllowance(senderAccount, Tezos.sender, s);

      if spenderAllowance < value then
        failwith("NotEnoughAllowance")
      else skip;

      (* Decrease any allowances *)
      senderAccount.allowances[Tezos.sender] := abs(spenderAllowance - value);
    } else skip;

    (* Update sender balance *)
    senderAccount.balance := abs(senderAccount.balance - value);

    (* Update storage *)
    s.ledger[from_] := senderAccount;

    (* Create or get destination account *)
    var destAccount : account := getAccount(to_, s);

    (* Update destination balance *)
    destAccount.balance := destAccount.balance + value;

    (* Update storage *)
    s.ledger[to_] := destAccount;

  } with (noOperations, s)

(* Approve an amt to be spent by another address in the name of the sender *)
function approve (const spender : address; const value : amt; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    if spender = Tezos.sender then
      failwith("InvalidSelfToSelfApproval")
    else skip;

    (* Create or get sender account *)
    var senderAccount : account := getAccount(Tezos.sender, s);

    (* Get current spender allowance *)
    const spenderAllowance : amt = getAllowance(senderAccount, spender, s);

    (* Prevent a corresponding attack vector *)
    if spenderAllowance > 0n and value > 0n then
      failwith("UnsafeAllowanceChange")
    else skip;

    (* Set spender allowance *)
    senderAccount.allowances[spender] := value;

    (* Update storage *)
    s.ledger[Tezos.sender] := senderAccount;

  } with (noOperations, s)

(* View function that forwards the balance of source to a contract *)
function viewBalance (const owner : address; const contr : contract(amt); var s : storage) : return is
  block {
    const ownerAccount : account = getAccount(owner, s);
  } with (list [transaction(ownerAccount.balance, 0tz, contr)], s)

(* View function that forwards the allowance amt of spender in the name of tokenOwner to a contract *)
function viewAllowance (const owner : address; const spender : address; const contr : contract(amt); var s : storage) : return is
  block {
    const ownerAccount : account = getAccount(owner, s);
    const spenderAllowance : amt = getAllowance(ownerAccount, spender, s);
  } with (list [transaction(spenderAllowance, 0tz, contr)], s)

(* View function that forwards the totalSupply to a contract *)
function viewTotalSupply (const contr : contract(amt); var s : storage) : return is
  block {
    skip
  } with (list [transaction(s.totalSupply, 0tz, contr)], s)
