(* pretty-printer generated by the BNF converter *)

open AbsPetit
open Printf

(* We use string buffers for efficient string concatenation.
   A document takes a buffer and an indentation, has side effects on the buffer
   and returns a new indentation. The indentation argument indicates the level
   of indentation to be used if a new line has to be started (because of what is
   already in the buffer) *)
type doc = Buffer.t -> int -> int

let rec printTree (printer : int -> 'a -> doc) (tree : 'a) : string = 
    let buffer_init_size = 16 (* you may want to change this *)
    in let buffer = Buffer.create buffer_init_size
    in 
        let _ = printer 0 tree buffer 0 in (* discard return value *)
        Buffer.contents buffer

let indent_width = 4

let indent (i: int) : string = 
    let s = String.make (i+1) ' ' in
    String.set s 0 '\n';
    s

(* this render function is written for C-style languages, you may want to change it *)
let render (s : string) : doc = fun buf i -> 
    (* invariant: last char of the buffer is never whitespace *)
    let n = Buffer.length buf in
    let last = if n = 0 then None else Some (Buffer.nth buf (n-1)) in
    let whitespace = match last with
        None -> "" 
      | Some '{' -> indent i
      | Some '}' -> (match s with
            ";" -> ""
          | _ -> indent i)
      | Some ';' -> indent i
      | (Some '[') |  (Some '(') -> ""
      | Some _ -> (match s with
            "," | ")" | "]" -> ""
           | _ -> " ") in
    let newindent = match s with
        "{" -> i + indent_width
      | "}" -> i - indent_width
      | _ -> i in
    Buffer.add_string buf whitespace;
    Buffer.add_string buf s;
    newindent

let emptyDoc : doc = fun buf i -> i

let concatD (ds : doc list) : doc = fun buf i -> 
    List.fold_left (fun accIndent elemDoc -> elemDoc buf accIndent) (emptyDoc buf i) ds

let parenth (d:doc) : doc = concatD [render "("; d; render ")"]

let prPrec (i:int) (j:int) (d:doc) : doc = if j<i then parenth d else d


let rec prtChar (_:int) (c:char) : doc = render ("'" ^ Char.escaped c ^ "'")



let rec prtInt (_:int) (i:int) : doc = render (string_of_int i)



let rec prtFloat (_:int) (f:float) : doc = render (sprintf "%f" f)



let rec prtString (_:int) (s:string) : doc = render ("\"" ^ String.escaped s ^ "\"")



let rec prtIdent _ (Ident i) : doc = render i



let rec prtStm (i:int) (e:stm) : doc = match e with
       Ass (ident, exp) -> prPrec i 0 (concatD [prtIdent 0 ident ; render ":=" ; prtExp 0 exp])
  |    Con (stm1, stm2) -> prPrec i 0 (concatD [prtStm 0 stm1 ; render ";" ; prtStm 0 stm2])
  |    For (exp, stm) -> prPrec i 0 (concatD [render "for" ; prtExp 0 exp ; render "times" ; render "do" ; prtStm 0 stm ; render "end"])


and prtExp (i:int) (e:exp) : doc = match e with
       Zer  -> prPrec i 0 (concatD [render "0"])
  |    Var ident -> prPrec i 0 (concatD [prtIdent 0 ident])
  |    Suc exp -> prPrec i 0 (concatD [render "suc" ; prtExp 0 exp])


