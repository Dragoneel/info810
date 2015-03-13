type atom = 
	| String of string
	| Integer of integer

type expression = 
	| Liste of string * expression list
	| Atom of atom

let sample = [
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


