open Ast

type valeur = 
	| MyString of string
	| MyInteger of int
	| MyFunction of valeur -> valeur
	| MyList of valeur list

type env = ( ident * valeur ) list

(* Predifined functions *)

(* Print a list *)
(* let rec print_list : MyList = function 
		| e::ls -> print_int e ; print_string " " ; print_list ls
		| _ -> () *)

(* Eval function *)
let rec eval (env:env) : expression -> valeur = function 

	| Atom (Integer i ) -> MyInteger i (Printf.printf i)

    | Atom (String s) -> MyString s (Printf.printf s)

	| Variable var
		 -> (try List.assoc var env with Not_found -> "Makaynach")

	| Liste ls -> MyList (List.map (eval env) ls)

    | Lambda(id, e) ->
    	MyFunction (fun a -> eval ((id,a)::env) e)

	| App(f,a) ->
	    let f = eval env f in
	    let a = eval env a in
	    (match f with MyFunction f -> f a | _ -> "Not a function")

	| Top_ls top_ls -> MyTop_ls ((eval env) top_ls)

	| Def(id,exp) ->
	  	MyFunction (fun a -> eval ((id,a)::env) e)



	| _ -> failwith "not implemented"

	(* | Def(name,params,body) ->
	  	let params = eval env params in
	  		eval env body

	| Expression exp -> 
		let exp = eval env
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
