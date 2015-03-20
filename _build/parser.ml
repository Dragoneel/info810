open Ast


let parser ident = i:''[a-zA-Z][a-zA-Z0-9]*'' -> {name=i}

(* Atom *)
let parser atom = 
	|  '"' - s:''[^"]*'' - '"'  -> String s
	|  id: ident   -> Variable(id)
	|  integer: ''[0-9]+'' -> Integer(int_of_string(integer))
	(* |  float: ''[-+]?[0-9]*\.?[0-9]*'' -> Float(float) *)

(* Expression *)
let parser expression =
	| a:atom -> Atom(a)
	| "'" e:expression -> Quote(e)
	| "(" es:expression* ")" -> Liste(es)

(* Instruction *)
let parser instruction =
	| ls:expression -> Top_ls(ls)
	| "(" "defun"
    	  name: ident 
   		  "(" params:ident* ")"
   		  body: expression 
   	   ")"
		-> Def({name;params;body})

(* Top level *)
let parser programm = 
	| inst:instruction*






























(* and expression_list =
  EMPTY -> []
| e:expression es:expression_list -> e::es *)

(* List *)
(* let parser cons = 
	| Empty 	
	-> []
	| Cons: "(" i:cons is:{ " " i':cons -> i'}* ")"
		-> i *)






(* 

let parser cons = 
	| ls:Liste
		 -> ls
	| Liste: 
		"(" ^ ls:list ^ ")"  
		-> ls


 *)


(* 	  match expression with
	  | Atom nom -> nom
	  | Liste (car,cdr) -> *)

(* 		let l = expression in
		"(" ^ (String.concat " " (List.map expression l)) ^ ")"
 *)














(* utils *)


(* 

	cons
	car
	cdr
	defun
	listp

 *)













(* ocamp -pp decap parser.ml *)
(* let blank = Decap.blany_regexp
	"[ \t\n]*" *)


(* 
Compilation
ocamlbuild -pp pa-ocaml -pkg decap main.byte
 *)