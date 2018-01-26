Section 12 - Querying consent

Querying consent is an action applying to nothing. Understand "show consent" or "list consent" as querying consent.

Querying consent in the scene is an action applying to nothing. Understand "show consent here" or "list consent here" as querying consent in the scene.

Carry out querying consent:
	say "[the consent status readout]".
	
Carry out querying consent in the scene:
	if the current scene does not require consent:
		say "There's nothing going on right now which we believe requires specific consent.";
	otherwise:
		say "Activities going on right now to which you are currently consenting:

[the scene situations of this scene in bullet list form]".
	
Section 13 - Giving and revoking consent

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	if "[the player's command in lower case]" matches the regular expression "^consent|revoke":
		let the possible intended situations be a list of consent situations;
		let the verb of the player's command be a text;
		now the verb of the player's command is "[the player's command in lower case]";
		replace the regular expression "\s+.*$" in the verb of the player's command with "";
		let the object of the player's command be a text;
		now the object of the player's command is "[the player's command in lower case]";
		replace the regular expression "^consent to\s+|revoke consent for\s+" in the object of the player's command with "";
		repeat with N running from 1 to the number of rows in the table of situations requiring consent:
			choose row N in the table of situations requiring consent;
			if "[consent situation entry in lower case][shorthand entry in lower case]" matches the regular expression "[the object of the player's command in lower case]":
				add the consent situation entry to the possible intended situations;
		if the number of entries in the possible intended situations is 1:
			let the assumed intent be entry 1 of the possible intended situations;
			if the verb of the player's command is "consent":
				try giving consent for the assumed intent instead;
			otherwise if the verb of the player's command is "revoke":				
				try revoking consent for the assumed intent instead;
			otherwise:
				say "The author failed to implement a handler for disambiguation of the command [the verb of the player's command]. We apologize on her behalf." instead;
		otherwise if the number of entries in the possible intended situations is not 0:
			say "I'm sorry, but that's not specific enough for me to know what you mean. Please clarify among:[line break][the possible intended situations in bullet list form]" instead;
		otherwise:
			say "I'm sorry, but I'm unfamiliar with that situation. Please SHOW CONSENT to see the situations with which I am familiar, and clarify which one you mean." instead;
	otherwise:
		continue the action.

Revoking consent incorrectly is an action applying to one thing. Understand "revoke consent for [something]" as revoking consent incorrectly.

Revoking consent for is an action applying to one consent situation. Understand "revoke consent for [consent situation]" as revoking consent for.

Carry out revoking consent for:
	let the new consent value be revoked;
	if the location is the content advice lobby:
		now the new consent value is denied;
	now the player's consent corresponding to a consent situation of the consent situation understood in the table of situations requiring consent is the new consent value;
	say "You no longer consent to [the consent situation understood in lower case]."

Giving consent incorrectly is an action applying to one thing. Understand "consent to [something]" as giving consent incorrectly.

Giving consent for is an action applying to one consent situation. Understand "consent to [consent situation]" as giving consent for.

Carry out giving consent for:
	now the player's consent corresponding to a consent situation of the consent situation understood in the table of situations requiring consent is given;
	say "You now consent to [the consent situation understood in lower case]."
	
