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
		
