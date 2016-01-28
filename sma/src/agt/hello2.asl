// Agent hello2 in project sma

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : .my_name(yassine) & neighboors(Y) <- 
									.send(Y,tell,token(Y)).

+token(Y)[source(A)] <- !!dfs_tree_construction(A,Y).

+!dfs_tree_construction(A,Y): token(Y) & not processed <- 
							.send(A,achieve,add_child(Y));
 							.send(Y,achieve,add_parent(A));
 							!!iterate.

+!add_parent(A) <- .print("adding parent");
					+parent(A).

+!add_child(B): true  <- 
				.print("adding child");
				 +child(B).

+!iterate: token(A) & neighboors(Z) & not child(Z) <- 
								.send(Y,tell,token(Y)).
								
+!iterate: token(Y) & neighboors(Z) & child(Z) & parent(A) <- 
								.send(A,tell,token(Y)).

+!iterate: token(Y) & neighboors(Z) & child(Z) & not parent(A) <- 
								.print("finish").


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }
