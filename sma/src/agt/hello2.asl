// Agent hello2 in project sma

/* Initial beliefs and rules */

/* Initial goals */

!dfs_construction.
/* Plans */

+!dfs_construction[source(A)]  : token & neighboors(Y) & not visited(Y)<-
				+iamvisited;
				+visited(Y);
				+child(Y);
				.send(Y,tell,token).
				
+!dfs_construction[source(A)] : 
				token & neighboors(Y) & visited(Y) & parent(X) <- 
					.send(X,tell,token).
					
+!dfs_constuction[source(A)] : 
				token & neighboors(Y) & visited(Y) & not parent(X) <- 
					.print("DFS Tree construction finished").
					
+!dfs_construction[source(A)] : 
				token & not neighboors(Y) & parent(X)  <- 
					.send(X,tell,token).
											 
+token[source(A)] <- !!add_parent(A).				 
			
+!add_parent(A) : 
				not child(A) & not iamvisited <- 	
					+parent(A);	
					.send(A,achieve,delete_token);
					!!dfs_construction.
									
+!add_parent(A) : 
				not child(A) & iamvisited <- 
					send(A,achieve,delete_token);
					!!dfs_construction.
+!add_parent(A) : 
				child(A) <-	
					send(A,achieve,delete_token);
					!!dfs_construction.

+!delete_token  <- -token.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
