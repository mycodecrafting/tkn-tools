(* Implimentation of the FA1.2 specification in PascaLIGO *)

#define TOKEN__MINTABLE
#define TOKEN__MINTABLE__CAPPED
#define TOKEN__BURNABLE
#define TOKEN__PAUSABLE
//#define TOKEN__PROOF_OF_BURN

(* Include types *)
#include "../../partials/fa-12/types.ligo"

(* Include helper fuctions *)
#include "../../partials/fa-12/helpers.ligo"

#if TOKEN__PAUSABLE
#include "../../partials/fa-12/pausable.ligo"
#endif

(* Include core FA1.2 *)
#include "../../partials/fa-12/core.ligo"

#if TOKEN__MINTABLE
#include "../../partials/fa-12/mintable.ligo"
#endif

#if TOKEN__BURNABLE
#include "../../partials/fa-12/burnable.ligo"
#endif

#if TOKEN__PROOF_OF_BURN
#include "../../partials/fa-12/proof-of-burn.ligo"
#endif

(* Include main entrypoint *)
#include "../../partials/fa-12/main.ligo"
