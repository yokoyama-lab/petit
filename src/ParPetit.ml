type token =
  | TOK_do
  | TOK_end
  | TOK_for
  | TOK_suc
  | TOK_times
  | SYMB1
  | SYMB2
  | SYMB3
  | TOK_EOF
  | TOK_Ident of (string)
  | TOK_String of (string)
  | TOK_Integer of (int)
  | TOK_Double of (float)
  | TOK_Char of (char)

open Parsing;;
let _ = parse_error;;
# 3 "ParPetit.mly"
open AbsPetit
open Lexing


# 25 "ParPetit.ml"
let yytransl_const = [|
  257 (* TOK_do *);
  258 (* TOK_end *);
  259 (* TOK_for *);
  260 (* TOK_suc *);
  261 (* TOK_times *);
  262 (* SYMB1 *);
  263 (* SYMB2 *);
  264 (* SYMB3 *);
  265 (* TOK_EOF *);
    0|]

let yytransl_block = [|
  266 (* TOK_Ident *);
  267 (* TOK_String *);
  268 (* TOK_Integer *);
  269 (* TOK_Double *);
  270 (* TOK_Char *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\003\000\004\000\
\004\000\004\000\005\000\000\000\000\000"

let yylen = "\002\000\
\002\000\001\000\002\000\001\000\003\000\003\000\006\000\001\000\
\001\000\002\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\002\000\000\000\011\000\012\000\000\000\
\000\000\004\000\000\000\008\000\013\000\000\000\009\000\000\000\
\000\000\001\000\000\000\010\000\003\000\000\000\000\000\005\000\
\000\000\000\000\007\000"

let yydgoto = "\003\000\
\007\000\013\000\008\000\014\000\015\000"

let yysindex = "\002\000\
\008\255\002\255\000\000\000\000\019\255\000\000\000\000\021\255\
\003\255\000\000\019\255\000\000\000\000\016\255\000\000\026\255\
\011\255\000\000\019\255\000\000\000\000\031\255\013\255\000\000\
\011\255\015\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\017\255\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\244\255\252\255\255\255"

let yytablesize = 32
let yytable = "\009\000\
\016\000\010\000\001\000\002\000\023\000\011\000\020\000\004\000\
\019\000\012\000\005\000\006\000\026\000\005\000\024\000\009\000\
\027\000\006\000\006\000\017\000\006\000\017\000\011\000\009\000\
\021\000\006\000\012\000\017\000\006\000\018\000\022\000\025\000"

let yycheck = "\001\000\
\005\000\000\001\001\000\002\000\017\000\004\001\011\000\000\001\
\006\001\008\001\003\001\010\001\025\000\003\001\019\000\017\000\
\002\001\010\001\002\001\007\001\010\001\007\001\004\001\025\000\
\009\001\009\001\008\001\007\001\010\001\009\001\005\001\001\001"

let yynames_const = "\
  TOK_do\000\
  TOK_end\000\
  TOK_for\000\
  TOK_suc\000\
  TOK_times\000\
  SYMB1\000\
  SYMB2\000\
  SYMB3\000\
  TOK_EOF\000\
  "

let yynames_block = "\
  TOK_Ident\000\
  TOK_String\000\
  TOK_Integer\000\
  TOK_Double\000\
  TOK_Char\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    Obj.repr(
# 28 "ParPetit.mly"
                   ( _1 )
# 118 "ParPetit.ml"
               : AbsPetit.stm))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "ParPetit.mly"
          ( raise (BNFC_Util.Parse_error (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())) )
# 124 "ParPetit.ml"
               : AbsPetit.stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 31 "ParPetit.mly"
                   ( _1 )
# 131 "ParPetit.ml"
               : AbsPetit.exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 32 "ParPetit.mly"
          ( raise (BNFC_Util.Parse_error (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())) )
# 137 "ParPetit.ml"
               : AbsPetit.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 35 "ParPetit.mly"
                      ( Ass (_1, _3) )
# 145 "ParPetit.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stm) in
    Obj.repr(
# 36 "ParPetit.mly"
                  ( Con (_1, _3) )
# 153 "ParPetit.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'exp) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    Obj.repr(
# 37 "ParPetit.mly"
                                             ( For (_2, _5) )
# 161 "ParPetit.ml"
               : 'stm))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "ParPetit.mly"
            ( Zer  )
# 167 "ParPetit.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ident) in
    Obj.repr(
# 41 "ParPetit.mly"
          ( Var _1 )
# 174 "ParPetit.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 42 "ParPetit.mly"
                ( Suc _2 )
# 181 "ParPetit.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "ParPetit.mly"
                   ( Ident _1 )
# 188 "ParPetit.ml"
               : 'ident))
(* Entry pStm *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry pExp *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let pStm (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : AbsPetit.stm)
let pExp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : AbsPetit.exp)
