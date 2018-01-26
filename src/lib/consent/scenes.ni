This scene is a scene that varies.

Last when a scene (called the scene which began) begins:
	now this scene is the scene which began.

A scene has a list of consent situations called scene situations.

Consent Discussion is a scene. Consent Discussion begins when play begins. Consent Discussion ends when the consent discussion state is finished.

To decide whether (S - a scene) requires consent:
	if the number of entries in the scene situations of S is greater than 0:
		decide yes;
	otherwise:
		decide no.
		
To decide whether the current scene requires consent:
	if this scene requires consent: 
		decide yes;
	otherwise:
		decide no.

To decide whether the current scene does not require consent:
	if this scene requires consent: 
		decide no;
	otherwise:
		decide yes.

Every turn when the current scene requires consent:
	say "(This scene requires consent.)".
	
Section 8 - Checking consent during a scene

Checking consent is an action applying to nothing.
Carry out checking consent:
	say "(This is a consent check.)".

First when a scene (called the scene which began) begins:
	if the scene which began requires consent:
		say "(This would be the scene change consent check.)";
		continue the action.

The first rule for printing the name of a room:
	if the current scene requires consent:
		say "(This would be the room name consent check for [the printed name of the location].)";
		continue the action.

Before doing something when the current scene requires consent:
	say "(This would be the pre-action consent check.)".

The first every turn rule:
	If the current scene requires consent:
		say "(This would be the every-turn consent check.)".

