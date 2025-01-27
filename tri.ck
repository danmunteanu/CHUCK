TriOsc osc => ADSR env => dac;

//  T-T-S-T-T-T-S
[0, 2, 4, 5, 7, 9, 11, 12] @=> int major[];

//  T-S-T-T-S-T-T
[0, 2, 3, 5, 7, 8, 10, 12] @=> int minor[];


//  setup envelope
(1::ms, 1000::ms, 0.05, 500::ms) => env.set;

0.4 => osc.gain;

//  SETUP MUSICAL
5 => int octave;
"A" => string root;
octave * 12 + note2index(root) => int offset;

minor @=> int notes[];

fun int note2index(string n)
	{
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

		return idx;
	}

fun string midi2note(int idx)
{
    // <<< idx % 12 >>>;

    idx % 12 => idx;

    if (idx == 0) return "C";
        if (idx == 1) return "C#";
    if (idx == 2) return "D";
        if (idx == 3) return "D#";
    if (idx == 4) return "E";
    if (idx == 5) return "F";
        if (idx == 6) return "F#";
    if (idx == 7) return "G";
        if (idx == 8) return "G#";
    if (idx == 9) return "A";
        if (idx == 10) return "A#";
    if (idx == 11) return "B";

    return "C";   
}

for (0 => int i; i < notes.cap(); ++i)
{
    Std.mtof(offset + notes[i]) => osc.freq;
    // <<< offset + notes[i] + " -> " + osc.freq() >>>;
    
    <<< midi2note(offset + notes[i]) >>>;

    1 => env.keyOn;
    1::second / 5 => now;
}