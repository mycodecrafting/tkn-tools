(* Main entrypoint *)
function main (const action : entryAction; var s : storage) : return is
  block {
    skip
  } with case action of
    | Transfer(params) -> transfer(params.0, params.1.0, params.1.1, s)
    | Approve(params) -> approve(params.0, params.1, s)

#if TOKEN__MINTABLE
    | Mint(params) -> mint(params.0, params.1, s)
    | AddMinter(params) -> addMinter(params, s)
    | TransferMinterRole(params) -> transferMinterRole(params, s)
    | RenounceMinter -> renounceMinter(s)
#endif

#if TOKEN__BURNABLE
    | Burn(params) -> burn(params.0, params.1, s)
#endif

#if TOKEN__PAUSABLE
    | Pause -> pause(s)
    | Unpause -> unpause(s)
#endif

#if TOKEN__PROOF_OF_BURN
    | Stake -> stake(s)
    | Claim -> claim(s)
#endif

    | GetBalance(params) -> viewBalance(params.0, params.1, s)
    | GetAllowance(params) -> viewAllowance(params.0.0, params.0.1, params.1, s)
    | GetTotalSupply(params) -> viewTotalSupply(params.1, s)
  end;
