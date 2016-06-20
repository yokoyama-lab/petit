open AbsPetit
open PrintPetit
open List

type store = (ident * int) list

let failure x = failwith "Undefined case." (* x discarded *)

let rec prtStore (i : int) (s : (ident * int) list) : doc = match s with
  | [] -> concatD []
  | (x, vx) :: ys -> concatD [prtIdent 0 x; render ":"; prtInt 0 vx; render ","; prtStore 0 ys]


let rec update (x, vx) : store -> store = function
  | [] -> [(x, vx)]
  | (y, vy) :: ys -> if x = y
                     then (y, vx) :: ys
                     else (y, vy) :: update (x, vx) ys


let rec evalExp (s : store) : exp -> int = function
  | Zer  -> 0
  | Var id -> assoc id s
  | Suc e -> (evalExp s e) + 1


let rec evalStm (s : store) : stm -> store = function
  | Ass (id, e) -> update (id, evalExp s e) s
  | Con (st1, st2) -> let s1 = evalStm s st1 in
                      evalStm s1 st2
  | For (e, st) -> let n = evalExp s e in
                     iterate s st n

and iterate (s : store) (st : stm) : int -> store = function
  | 0 -> s
  | n -> iterate (evalStm s st) st (n-1)
