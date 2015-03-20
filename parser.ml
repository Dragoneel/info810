open ast

(* Atom *)
let parser atom = 
	|  '"' - s:''[^"]*'' - '"'  -> String s
	|  string: ''[a-zA-Z][a-zA-Z0-9]*''  -> Variable({name=string})
	|  integer: ''[0-9]+'' -> Integer(integer)
	|  float: ''[-+]?[0-9]*\.?[0-9]*'' -> Float(float)

(* Expression *)
let parser expression =
	| a:atom -> Atom(a)
	| "'" e:expression -> Quote(expression)
	| "(" es:expression* ")" -> Liste(es)

(* Top level *)
let parser prog = 
    | "(" name:string 
   		  args: {"(" i:ident is:{ "," i':ident -> i'}* ")"     -> i::is}?[[]]
   		  body: expression 
   	   ")"
		-> Def(name,args,body)

















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