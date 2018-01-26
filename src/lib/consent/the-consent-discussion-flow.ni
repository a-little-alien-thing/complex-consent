Activating the consent system is an action applying to nothing.
Explaining the consent system is an action applying to nothing.
Asking to begin the consent discussion is an action applying to nothing.
Opting out of the consent discussion is an action applying to nothing.
Beginning the consent discussion is an action applying to nothing.
Finishing the consent discussion is an action applying to nothing.

Carry out activating the consent system:
  try talking about activating the consent system;
  now the consent discussion state is unstarted;
  now the true starting location is the location;
  now the player is in the content advice lobby;
  try explaining the consent system instead.

Carry out explaining the consent system:
  [try talking about explaining the consent system;]
  say "(blah blah)";
  try asking to begin the consent discussion instead.

Carry out asking to begin the consent discussion:
  say "(asking to begin the consent discussion)";
  if the player consents:
    try beginning the consent discussion instead;
  otherwise:
    try opting out of the consent discussion instead.

Carry out opting out of the consent discussion:
  say "(you sure?)";
  if the player consents:
    try finishing the consent discussion instead;
  otherwise:
    try beginning the consent discussion instead.

Carry out beginning the consent discussion:
  say "(beginning the consent discussion)";
  now the consent discussion state is unfinished;
  do nothing.

Carry out finishing the consent discussion:
  say "(finishing the consent discussion)";
  now the consent discussion state is finished;
  now the player is in the true starting location;
  do nothing.


