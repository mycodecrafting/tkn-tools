(* Math helper functions *)

(* POW function *)
function int_pow (const a : int; const e : int) : int is
  block {    
    var res : int := 1;
    var i : int := 0;
    while i < e block {
      res := res * a;
      i := i + 1;
    }
  } with res

function nat_pow (const a : nat; const e : nat) : nat is
  block {    
    var res : nat := 1n;
    var i : nat := 0n;
    while i < e block {
      res := res * a;
      i := i + 1n;
    }
  } with res
