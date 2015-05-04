open Ast

(* Identifiant *)
(* let parser ident = i:''[a-zA-Z][a-zA-Z0-9]*'' -> {name=i} *)
let parser ident = i:''[^^]*'' -> {name=i}

(* Atom *)
let parser atom = 
	|  '"' - s:''[^"]*'' - '"'  -> String s
	|  id: ident   -> Variable(id)
	|  integer: ''[0-9]+'' -> Integer(int_of_string(integer))
	(* |  float: ''[-+]?[0-9]*\.?[0-9]*'' -> Float(float) *)

(* Expression *)		
let parser expression =
	
	| a:atom -> Atom(a)
	(* | "'" e:expression -> Quote(e) *)
	| "(" es:expression* ")" -> Liste(es)

	| "(" e1:expression
	  e2:expression  ")"
	  -> App(e1,e2)
	  
	| "("id:ident 
	  e:expression ")"
	  -> Lambda(id,e)

(* Instruction *)
let parser instruction =
	| ls:expression -> Top_ls(ls)
	| id:ident
	  exp:expression  
	  -> Def(id,exp)
(* 	| "(" "defun"
    	  name: ident 
   		  "(" params:ident* ")"
   		  body: expression 
   	   ")"
		-> Def({name;params;body}) *)

(* Top level *)
let parser program	 = 
	| inst:instruction*


(* Testing the parser *)
(* caractères blancs : espaces etc ... et # jusqu'à la fin de ligne *)
let blank = Decap.blank_regexp ''\([ \t\n\r]*\|#[^\n]*\n\)*''
let _ = Decap.handle_exception (fun () ->
  let p = Decap.parse_channel program blank stdin in
  (* Printf.printf p *)
  Printf.printf "YOSH\n") ()

























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