//  A major scale is a pattern of intervals
//   W W H W W W H

Clape clape;

SinOsc osc
=> ADSR env1 
=> dac;

0.55 => osc.gain;

1::second / 3 => dur beat;
(0::ms, beat / 2, 0, 1::ms) => env1.set;

6 => clape.octave;
//clape.note2freq("G") => osc.freq;

// 1 => env1.keyOn;
// beat => now;

5 => int octave;
clape.gen_minor_scale("C", octave);
clape.gen_major_scale("G", octave);

for (int midi : clape.scale)
	{
		<<< midi + " " + clape.index2Note(midi - (12 * octave)) >>>;

        Std.mtof(midi) => osc.freq;
		
        1 => env1.keyOn;
        
		//	Chuck to Now
		beat => now;

		//pause(0.5::ms);
	}