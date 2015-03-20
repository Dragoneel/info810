open ast

(* Atom *)
let parser atom = 
	|  '"' - s:''[^"]*'' - '"'  -> String s
	|  string: ''[a-zA-Z][a-zA-Z0-9]*''  -> Variable({name=string})
	|  integer: ''[0-9]+'' -> Integer(integer)
	|  float: ''[-+]?[0-9]*\.?[0-9]*'' -> Float(float)

(* Quote (Not eval) *)
let parser quote = 
	| expression: '"' ^ expression -> Quote(expression)

(* List *)
(* let parser cons = 
	| Empty 	
	-> []
	| Cons: "(" i:cons is:{ " " i':cons -> i'}* ")"
		-> i *)

(* Expression *)
let parser prog = 
    | "(" name:string 
   		  args: {"(" i:params is:{ "," i':params -> i'}* ")"     -> i::is}?[[]]
   		  body:expression 
   	   ")"
		-> Def(name,args,body)
























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