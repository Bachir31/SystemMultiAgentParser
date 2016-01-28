// Agent hello2 in project sma

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : .my_name(yassine) & neighboors(Y) <- 
									.send(Y,tell,token(Y)).

+token(Y)[source(A)] <- !!dfs_tree_construction(A,Y).

+!dfs_tree_construction(A,Y): token(Y) & not processed <- 
							.send(A,achieve,delete_token);
							.send(A,achieve,add_child(Y));
 							.send(Y,achieve,add_parent(A));
 							.send(Y,achieve,iterate).

+!delete_token(Y) <- -token.

+!add_parent(A) <- .print("adding parent");
					+parent(A).

+!add_child(B): true  <- 
				.print("adding child");
				 +child(B).

+!iterate: token(C) & neighboors(Z) & not child(Z) <- 
								.send(Z,tell,token(Z)).
								
+!iterate: token(C) & neighboors(Z) & child(Z) & parent(D) <- 
								.send(D,tell,token(D)).

+!iterate: token(C) & neighboors(Z) & child(Z) & not parent(D) <- 
								.print("finish").


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
