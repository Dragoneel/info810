open Ast
open Llvm

(* choix du type pour les nombres manipulés par la calculatrice,
   il suffit de changer ces deux lignes pour changer la taille des entiers *)
let lisp_type = Int 32 and type_format = "%ld"

let rec bin_to_llvm (env:env) (op:opBin) (e1:expr) (e2:expr) : value =
  let instr = match op with
    | Add -> "add" | Sub -> "sub" | Mul -> "mul" | div -> "sdiv" in
  let e1 = expr_to_llvm env e1 in
  let e2 = expr_to_llvm env e2 in
  emit_op_bin env instr e1 e2