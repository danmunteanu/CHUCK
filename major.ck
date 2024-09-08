
//	Instrument
SinOsc osc
		=> ADSR env1 
		=> dac;
0.55 => osc.gain;

//	Duration
1::second / 3 => dur beat;

//	ADSR setup
(0::ms, beat / 2, 0.3, 1::ms) => env1.set;


Clape clape;
5 => clape.octave;
//clape.note2freq("G") => osc.freq;

[0, 0, 0] @=> int chord[];

// 1 => env1.keyOn;
// beat => now;

5 => int octave;
//clape.gen_minor_scale("F", octave);
//clape.gen_minor_scale("C4", octave);

//	I - IV - V - I	
//	most common chord progression because of the relationship between those chords

fun void play_chord(int pChord[])
{
	//	pChord contains MIDI notes

	Std.mtof(pChord[0]) => osc.freq;
	1 => env1.keyOn;
	beat * 0.8 => now;

	Std.mtof(pChord[1]) => osc.freq;
	1 => env1.keyOn;
	beat * 0.8 => now;

	Std.mtof(pChord[2]) => osc.freq;
	1 => env1.keyOn;
	beat * 0.8 => now;
}

clape.gen_scale("C", octave, clape.scale_major);
//clape.chord(7, clape.chord_major) @=> chord;
//play_chord(chord);


for (0 => int idx; idx < clape.scale.size(); idx++)
{
	<<< idx + " => " + clape.scale[idx] >>>;

	clape.chord(idx, clape.chord_major) @=> chord;
	play_chord(chord);
}

for (int midi : clape.scale)
	{
		<<< (midi - (12 * octave)) + ", " + midi + " " + clape.index2Note(midi - (12 * octave)) >>>;

		//	MIDI to freq		
        Std.mtof(midi) => osc.freq;
		
		//	send to adsr
        1 => env1.keyOn;
        
		//	chuck to now
		//beat => now;

		//clape.chord(midi - (12 * octave), clape.chord_major) @=> chord;
		//play_chord (chord);
	}