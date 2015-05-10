open Ast

type valeur = 
	| MyString of string
	| MyInteger of int
	| MyFunction of valeur -> valeur
	| MyList of valeur list
	| MyCons of valeur -> valeur
	| MyTop_ls of valeur -> valeur

type env = ( ident * valeur ) list

(* Predifined functions *)

(* Print a list *)
(* let rec print_list ls = function 
		| []-> ()
		| e::ls -> print_string "##" ; print_list ls
 *)


(* First element of the list *)
let car o =
  match o with
      App (f,a) -> f
    | _ -> invalid_arg "Argument to car must be a List!"

(* Rest of the list *)
let cdr o =
  match o with
      App (f,a) -> a
    | _ -> invalid_arg "Argument to cdr must be a List!"


(* Eval function *)
let rec eval (env:env) : expression -> valeur = function 

	| Atom (Integer i ) -> Printf.printf "%d\n" i; MyInteger i 

    | Atom (String s) -> Printf.printf "%s\n" s;  MyString s

	| Atom (Variable var) -> (try List.assoc var env with Not_found ->
	    Printf.eprintf "variable %s non définie\n" var.name; exit 1)

	| Liste ls -> MyList (List.map (eval env) ls)

    | Lambda(id, e) ->
    	MyFunction (fun a -> eval ((id,a)::env) e)

	| App(f,a) ->
	    let f = eval env f in
	    let a = eval env a in
	    (match f with MyFunction f -> f a | _ -> Printf.eprintf "Not a function\n"; exit 1)

	(* | Top_ls top_ls -> MyTop_ls ((eval env) top_ls) *)

	(* | Def(id,exp) ->
	  	MyFunction (fun a -> eval ((id,a)::env) exp) *)

	| _ -> failwith "not implemented"














	(* | Def(name,params,body) ->
	  	let params = eval env params in
	  		eval env body
	*)



(* 
	| App lst elt =
		  let rec boucle ptr =
		    | (cdr ptr) with
		        Liste _ -> boucle (cdr ptr)
		          | ptr with
		              Liste (c) ->
		                c.cdr = Liste elt Null
		  in
		    boucle lst *)

