(* OCaml module generated by the BNF converter *)


type ident = Ident of string
and stm =
   Ass of ident * exp
 | Con of stm * stm
 | For of exp * stm

and exp =
   Zer
 | Var of ident
 | Suc of exp
