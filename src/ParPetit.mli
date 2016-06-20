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

val pStm :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AbsPetit.stm
val pExp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AbsPetit.exp
