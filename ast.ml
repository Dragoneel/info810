type ident = { name : string }

type atom = 
	| String of string
	| Integer of int
	(* | Float of float *)
    | Variable of ident

type expression = 
	| Liste of expression list
	| Atom of atom
	| Quote of expression

type def = { name : ident;     
             params : ident list;
             body: expression
            }

type instruction = 
	| Top_ls of expression
	| Def of def

type program = instruction list


(* let sample = [
				expression(
						Liste(
							Atom("set"),Atom(i),Liste(1,2,3)
						)
					),		
				expression(
						Liste(
							Atom("print"),Atom(i)
						)
					),
				expression(
						Liste(
							Atom("set"),Atom(i),Atom(1)
						)
					),		
				expression(
						Liste(
							Atom("print"),Atom(i)
						)
					),
			]
 *)

