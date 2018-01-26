"Content advice and granular consent" by a little alien thing


[This is a little alien thing's granular consent system. Someday it hopes to be an extension.]


To decide what text is (S - a consent situation) as text:
	decide on "[S]".
	
To decide what text is (S - a consent situation) in lower case:
	decide on "[S as text in lower case]"

To decide what text is (S - a consent situation) in bullet list form:
	decide on "- [S][line break]".
	
To decide what text is (S - a consent situation) or (C - a text) in bullet list form:
	decide on "- [S] ([C])[line break]".
	
To decide what text is (L - a list of consent situations) in bullet list form:
	let the result be a text;
	repeat with N running from 1 to the number of entries in L:
		now the result is "[result]- [entry N of L][line break]";
	decide on the result.
	
To decide what text is the consent status readout:
	let the result be a text;
	repeat with N running from 1 to the number of rows in the table of situations requiring consent:
		choose row N in the table of situations requiring consent;
		now the result is "[result]You have [player's consent entry] consent for [consent situation entry in lower case] ([shorthand entry in lower case]).[line break]";
	decide on the result.
	

Consent situation is a kind of value. The consent situations are defined by the Table of Situations Requiring Consent.

Consent is a kind of value. The consents are given, denied, revoked, and not specified.

Consent state is a kind of value. The consent states are consenting and not consenting.

To decide what consent state is (C - a consent) as a consent state:
	if C is given:
		decide on consenting;
	otherwise:
		decide on not consenting.

The consent discussion completion state is a kind of value. The consent discussion completion states are unstarted, unfinished, and finished.
The consent discussion state is a consent discussion completion state that varies. The consent discussion state is usually unstarted.


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
	

Activating the consent system is an action applying to nothing.
Describing the nature of the consent system is an action applying to nothing.
Asking to show the content warning is an action applying to nothing.
Finishing the consent discussion is an action applying to nothing.

Carry out activating the consent system: 
	now the true starting location is the location;
	now the player is in the content advice lobby;
	try describing the nature of the consent system instead.
	
Carry out describing the nature of the consent system:
	say "Hello! This game implements a system of content advice.
	
Depending on your actions in this game, we may describe and ask you to participate in some situations and activities which you may find uncomfortable. If you like, we will advise you briefly before the game begins about what these situations and activities entail, and ask you which of them you require that we avoid.

We need not have this discussion now. Throughout the game, you will at all times have the option to see which situations may be of concern, and to tell us that you do or do not wish to hear about or participate in them. Here are the commands you can use:

SHOW CONSENT or LIST CONSENT[line break]
  See a list of situations which may be of concern at any time in the game, and whether you are currently consenting to each of them.

SHOW CONSENT NOW or LIST CONSENT NOW[line break]
  See a list of situations which may be of concern in your current circumstance, and to which you currently consent. (Situations which can happen elsewhere in the game, but which are not happening right now, won't show up here.)

CONSENT TO <a situation>[line break]
  Tell us that you wish to hear about or participate in the situation you name.

REVOKE CONSENT FOR <a situation>[line break]
  Tell us that you no longer wish to hear about or participate in the situation you name.

REVOKE CONSENT FOR THIS[line break]
  Tell us that you no longer wish to hear about or participate in any of the situations or activities which are currently going on.

You need not tell us the full name of the situation in commands which ask for one. All we need is enough to tell for certain which you mean. If we're unable to decide among two or more situations that all might be the one you mean, we will tell you which situations those are and ask that you clarify among them.

And, finally, an important note. We recognize a few different conditions with regard to consent; for example, you might have first given and later revoked consent, or have denied it from the start, or not yet have expressed a preference in either direction. In the list of situations provided by SHOW CONSENT, you may see these conditions mentioned.

However, we recognize only two conditions with regard to your current consent to a given situation. If, at a given instant, you have most recently given affirmative consent to a situation via the CONSENT TO command, we consider that you consent to that situation at that instant. In every other circumstance, we consider that you do not.

Should you find yourself in a situation which makes you too uncomfortable to bear, you can REVOKE CONSENT FOR THIS, and that situation will immediately end.";
	try asking to show the content warning instead.

Carry out asking to show the content warning:
	say "Shall we provide content advice before we begin?";
	if the player consents:
		try beginning the consent discussion instead;
	otherwise:
		say "Shall we then assume we may initially describe to you, or require you to participate in, any situation or activity we so choose? That is, are you certain you wish to proceed without content advice, and without the opportunity to tell us which situations we must avoid?";
		if the player consents:
			say "Very well, then. The consent commands remain available, should you change your mind at any time.";
			try finishing the consent discussion instead;
		otherwise:
			try beginning the consent discussion instead.

Carry out finishing the consent discussion:
	if the consent discussion state is not finished:
		now the consent discussion state is finished;
		say "[the banner text]";
		say "(This would be the start-of-game consent check.)";	
		now the player is in the true starting location.

Section 10 - The initial discussion of consent

The bullet list of consent situations is a text that varies.
When play begins:
	repeat with N running from 1 to the number of rows in the table of situations requiring consent:
		choose row N in the table of situations requiring consent;
		now the bullet list of consent situations is "[the bullet list of consent situations][consent situation entry or shorthand entry in bullet list form]";

Beginning the consent discussion is an action applying to nothing.

The true starting location is a room that varies.

Carry out beginning the consent discussion:
	now the consent discussion state is unfinished;
	say "Of the situations and activities in this game, here are those which we believe may be matters of special discomfort to some players.

[the bullet list of consent situations]

Right now, you haven't told us you consent to any of these situations, and so we consider that you consent to none of them. Please use the CONSENT TO and REVOKE CONSENT FOR commands to inform us of your requirements. If you find yourself unsure which preferences you have expressed, say SHOW CONSENT to see a recap. 

When you're satisfied with the preferences you have expressed, say READY to begin the game. (We'll list your choices at that time for you.) Or, if you don't wish to play a game that includes such situations at all, say QUIT."

The content advice lobby is a room with the printed name "Initial discussion of consent".

Rule for printing the name of the location when the location is the content advice lobby: do nothing instead.
Instead of looking when the location is the content advice lobby: do nothing.

Understand "ready" as exiting when the location is the content advice lobby.

Instead of exiting when the location is the content advice lobby:
	say "For your reference, here are the choices you've made thus far:

[the consent status readout]

Remember that you can change them at any time. And thank you! We hope your experiences here prove as pleasurable as were ours in preparing them for you.

[the authorial signoff][paragraph break]";
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
		


[I'm not sure yet where these should go.]

The authorial signoff is some text that varies.
When play begins: now the authorial signoff is "❤ - a little alien thing and company".

When play begins, try activating the consent system.



Section 1 - Conventions and definitions

Use American dialect and the serial comma.
Use verbose room descriptions.
Release along with an interpreter.

Table of Situations Requiring Consent
 Consent situation                                      	Player's consent	Shorthand 
 Sexual situations where apparent consent is in question	Not specified   	"dubcon"  
 Sexual situations where apparent consent is absent     	Not specified   	"noncon"  
 The description of death from the victim's perspective 	Not specified   	"dying"   
 Cake                                                   	Not specified   	"cake"    

Section 2 - The starting room

In-Game Test is a scene. In-Game Test begins when Consent Discussion ends.
The scene situations of In-Game Test are { Sexual situations where apparent consent is in question, Cake }.

Demonstration is a room. "There is nothing yet more to do."

