(* This ocamllex file was machine-generated by the BNF converter *)
{
open ParPetit
open Lexing

let symbol_table = Hashtbl.create 3
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add symbol_table kwd tok)
                  [(":=", SYMB1);(";", SYMB2);("0", SYMB3)]

let resword_table = Hashtbl.create 5
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add resword_table kwd tok)
                  [("do", TOK_do);("end", TOK_end);("for", TOK_for);("suc", TOK_suc);("times", TOK_times)]


let unescapeInitTail (s:string) : string =
  let rec unesc s = match s with
      '\\'::c::cs when List.mem c ['\"'; '\\'; '\''] -> c :: unesc cs
    | '\\'::'n'::cs  -> '\n' :: unesc cs
    | '\\'::'t'::cs  -> '\t' :: unesc cs
    | '\"'::[]    -> []
    | c::cs      -> c :: unesc cs
    | _         -> []
  (* explode/implode from caml FAQ *)
  in let explode (s : string) : char list =
      let rec exp i l =
        if i < 0 then l else exp (i - 1) (s.[i] :: l) in
      exp (String.length s - 1) []
  in let implode (l : char list) : string =
      let res = Buffer.create (List.length l) in
      List.iter (Buffer.add_char res) l;
      Buffer.contents res
  in implode (unesc (List.tl (explode s)))

let incr_lineno (lexbuf:Lexing.lexbuf) : unit =
    let pos = lexbuf.lex_curr_p in
        lexbuf.lex_curr_p <- { pos with
            pos_lnum = pos.pos_lnum + 1;
            pos_bol = pos.pos_cnum;
        }
}

let l = ['a'-'z' 'A'-'Z' '\192' - '\255'] # ['\215' '\247']    (*  isolatin1 letter FIXME *)
let c = ['A'-'Z' '\192'-'\221'] # ['\215']    (*  capital isolatin1 letter FIXME *)
let s = ['a'-'z' '\222'-'\255'] # ['\247']    (*  small isolatin1 letter FIXME *)
let d = ['0'-'9']                (*  digit *)
let i = l | d | ['_' '\'']          (*  identifier character *)
let u = ['\000'-'\255']           (* universal: any character *)
let rsyms =    (* reserved words consisting of special symbols *)
            ":=" | ";" | "0"

rule token =
  parse rsyms {let id = lexeme lexbuf in try Hashtbl.find symbol_table id with Not_found -> failwith ("internal lexer error: reserved symbol " ^ id ^ " not found in hashtable")}
      | l i* {let l = lexeme lexbuf in try Hashtbl.find resword_table l with Not_found -> TOK_Ident l}
      | d+ {let i = lexeme lexbuf in TOK_Integer (int_of_string i)}
      | d+ '.' d+ ('e' ('-')? d+)? {let f = lexeme lexbuf in TOK_Double (float_of_string f)}
      | '\"' ((u # ['\"' '\\' '\n']) | ('\\' ('\"' | '\\' | '\'' | 'n' | 't')))* '\"' {let s = lexeme lexbuf in TOK_String (unescapeInitTail s)}
      | '\'' ((u # ['\'' '\\']) | ('\\' ('\\' | '\'' | 'n' | 't'))) '\'' {let s = lexeme lexbuf in TOK_Char s.[1]}
      | [' ' '\t'] {token lexbuf}
      | '\n' {incr_lineno lexbuf; token lexbuf}
      | eof {TOK_EOF}