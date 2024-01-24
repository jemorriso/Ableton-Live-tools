MIDIClient.init;

~midiOut = MIDIOut.newByName("IAC Driver", "Tidal1")

~dirt.soundLibrary.addMIDI(\tidal1, ~midiOut);
