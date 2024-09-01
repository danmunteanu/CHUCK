//  W W H W W W H - Major Scale

Clape clape;

SinOsc osc
=> ADSR env1 
=> dac;

0.55 => osc.gain;

1::second => dur beat;
(0::ms, beat / 2, 0, 1::ms) => env1.set;

6 => clape.octave;
clape.note2freq("G") => osc.freq;

// 1 => env1.keyOn;
// beat => now;

clape.gen_major_scale("G");

for (string note : clape.notes)
	{
		<<< note >>>;

		clape.note2freq(note) => osc.freq;
		
        1 => env1.keyOn;
        
		//	Chuck to Now
		beat => now;

		//pause(0.5::ms);
	}