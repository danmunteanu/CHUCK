//  UGen = Unit Generator
//  Oscillators are Ugens

//  "=>" acts as a patch cable

//  ADSR = Attack / Sustain / Decay / Release

//  Oscillators
TriOsc osc1 => ADSR env1 => dac;
SqrOsc osc2 => ADSR env2 => dac;

0.25::second => dur beat;

//  ADSR Setup
(beat / 2, beat / 2, 0, 1::ms) => env1.set;
(1::ms, beat / 8, 0, 1::ms) => env2.set;

//  Gains
0.4 => osc1.gain;
0.1 => osc2.gain;

//  Chords
[0, 4, 7, 12] @=> int major[];
[0, 3, 7, 12] @=> int minor[];

fun void playSin(int chords[], int offset, int position)
{
    for (0 => int i; i < chords.cap(); i++)
    {        
        Std.mtof(chords[0] + offset + position) => osc1.freq;
        1 => env1.keyOn;
        
        for (0 => int j; j < chords.cap(); j++)
        {
            Std.mtof(chords[j] + offset + position + 12) => osc2.freq;
            1 => env2.keyOn;
            beat / 2 => now;
        }
    }
}

48 => int offset;
0 => int position;

while (1)
{
    playSin(major, offset, 0);
    playSin(minor, offset, -4);
    playSin(minor, offset, -2);
    playSin(major, offset, -5);
}