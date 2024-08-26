//	The notes we'll play
string notes[100];

TriOsc osc => dac;
440 => osc.freq;
0.3 => osc.gain;

//	Root C
60 => int root;

//	Dur
1::second => dur beat;

fun void play_note (string n, dur len)
{
	//	lookup note
	n.upper() => string note;
	
	0 => int idx;
	
	if ("C" == note) 0 => idx;
	
		if ("C#" == note) 1 => idx;
		if ("DB" == note) 1 => idx;
	
	if ("D" == note) 2 => idx;
	
		if ("D#" == note) 3 => idx;
		if ("EB" == note) 3 => idx;
	
	if ("E" == note) 4 => idx;
	
	if ("F" == note) 5 => idx;
	
		if ("F#" == note) 6 => idx;
		if ("GB" == note) 6 => idx;
	
	if ("G" == note) 7 => idx;
	
		if ("G#" == note) 8 => idx;
		if ("AB" == note) 8 => idx;
	
	if ("A" == note) 9 => idx;
	
		if ("A#" == note) 10 => idx;
		if ("BB" == note) 10 => idx;
	
	if ("B" == note) 11 => idx;

	Std.mtof(root + idx) => float freq;

	string out;
	"Note: " + note => out;
	out + ", IDX " + idx => out;
	out + ", PITCH: " + (root + idx) => out;
	out + ", Freq. " + freq => out;
	
	<<< out >>>;
	
	freq => osc.freq;
	
	//	Chuck to Now
	len => now;
}

fun void pause (dur len)
{
	0 => osc. freq;
	len => now;
}

fun void up_octave()
{
	if (root + 12 < 128)
		root + 12 => root;
}

fun void down_octave()
{
	if (root - 12 > 0)
		root - 12 => root;
	
}

//	MIDI => frequency

fun void score_to_music (string score)
{
	StringTokenizer strtok;

	// set the string
	strtok.set( score );

	// check how many tokens there are
	<<< "tokens found:", strtok.size() >>>;

	//	Allocate size of notes
	strtok.size() => notes.size;

	//	Reset Index
	0 => int idx;

	// iterate through the tokens
	while( strtok.more() )
	{
		// print current token
		strtok.next() => string token;

		//	Save this token to array
		token => notes[idx];

		//	<<< "Note " + idx + ": " + notes[idx] >>>;

		idx + 1 => idx;
	}

	// reset the tokenizer
	strtok.reset();
}

fun void play_music()
{
	for (string note : notes)
	{
		<<< note >>>;
		play_note(note, 1::second / 2);
		pause(0.3::ms);
	}
}

 "E F# G# E B B B E E C#
F# G# E B B E E E C#
F# F# F# F# F# G#
B B E G# F#
B F# F# F# F# F# G#
B B E G# F#

F# G# E B B E E E C#
F# G# E B B E E E C#
F# F# F# F# F# G#
B B E G# F#
B F# F# F# F# F# G#
B B E G# F# E" => string verse1;

"G# G# F# E F# F# G# F# E
F# F# F# F# A E F# F# E
G# G# F# E F# F# G# F# E
F# F# F# F# A E F# F# E C#

G# G# G# C# F# F# F# B F# F# B
F# F# F# F# A E F# F# E C#
G# G# G# C# F# F# F# B F# F# B
F# F# F# F# A E F# F# E" => string chorus;

//	load C major
score_to_music ("C D E F G A B C");

score_to_music(chorus);

//score_to_music (verse1);
//score_to_music (chorus);

play_music ();

