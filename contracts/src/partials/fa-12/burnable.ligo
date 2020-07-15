(* Burn tokens *)
function burn (const from_ : address; const value : amt; var s : storage) : return is
  block {

#if TOKEN__PAUSABLE
    (* Contract is paused *)
    if isPaused(s) = True then
      failwith("ContractPaused")
    else skip;
#endif

    (* Retrieve sender account from storage *)
    const senderAccount : account = getAccount(from_, s);

    (* Balance check *)
    if senderAccount.balance < value then
      failwith("NotEnoughBalance")
    else skip;

    (* Check this address can burn the tokens *)
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

    (* Update ledger *)
    s.ledger[from_] := senderAccount;

    (* Update total supply *)
    s.totalSupply := abs(s.totalSupply - value);

  } with (noOperations, s)
