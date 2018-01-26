The true starting location is a room that varies.

The content advice lobby is a room with the printed name "Initial discussion of consent".

Rule for printing the name of the location when the location is the content advice lobby: do nothing instead.
Instead of looking when the location is the content advice lobby: do nothing.

Understand "ready" as exiting when the location is the content advice lobby.

Instead of exiting when the location is the content advice lobby:
	say "...";
	try finishing the consent discussion instead.

Rule for printing the banner text: 
	if the consent discussion state is unfinished:
		do nothing instead;
	otherwise:
		continue the action.

Section 11 - Recording initial consent to all situations

Recording initial consent to all situations is an action applying to nothing.

Carry out recording initial consent to all situations:
	repeat with N running from 1 to the number of rows in the table of situations requiring consent:
		now the player's consent in row N of the table of situations requiring consent is given.
