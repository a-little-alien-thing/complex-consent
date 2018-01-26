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
	
