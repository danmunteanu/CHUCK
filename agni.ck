// SinOsc osc => dac;
// 440 => osc.freq;
// 0.3 => osc.gain;

TriOsc osc => ADSR env1 => dac;
0.45 => osc.gain;

1::second => dur beat;
(0::ms, beat / 2, 0, 1::ms) => env1.set;
//(, beat, 1, 50::ms) => env1.set;

//	Root C
//60 => int root;

Clape clape;

fun void pause (dur len)
{
	0 => osc. freq;
	len => now;
}

//	MIDI => frequency

fun void play_music()
{
	for (string note : clape.notes)
	{
		<<< note >>>;

		string out;
		"Note: " + note => out;
		// out + ", IDX " + idx => out;
		// out + ", PITCH: " + (root + idx) => out;
		// out + ", Freq. " + freq => out;		
		<<< out >>>;
		
		1::second / 2  => dur len;

		clape.note2freq(note) => osc.freq;
		
        1 => env1.keyOn;
        
		//	Chuck to Now
		len => now;

		pause(0.5::ms);
	}
}

"D D E F F G F E D F E D C C D F E D" => string agni;

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
//score_to_music ("C D E F G A B C");

6 => clape.octave;
clape.score_to_music(agni);
//clape.score_to_music("C D E F G A B C");

//score_to_music (verse1);
//score_to_music (chorus);

play_music ();

