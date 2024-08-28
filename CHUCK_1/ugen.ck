//  UGen = Unit Generator
//  Oscillators are Ugens

//  "=>" acts as a patch cable

//  ADSR = Attack / Sustain / Decay / Release

//  Oscillators
TriOsc osc1 => ADSR env1 => dac => WvOut waveOut => blackhole;
TriOsc osc2 => ADSR env2 => dac => waveOut => blackhole;;

//SinOsc osc => dac;// => WvOut waveOut => blackhole;
"MidiFull.wav" => waveOut.wavFilename;

1::second => dur beat;

//  ADSR Setup
(beat / 2, beat / 2, 0, 1::ms) => env1.set;
(1::ms, beat / 8, 0, 1::ms) => env2.set;

//  Gains
0.2 => osc1.gain;
0.1 => osc2.gain;

//  Chords
[0, 4, 7, 12] @=> int major[];
[0, 3, 7, 12] @=> int minor[];

fun void playTwobars(int position, int chords[])
{
    for (0 => int i; i < chords.cap(); i++)
    {        
        Std.mtof(chords[0] + offset + position) => osc1.freq;
        1 => env1.keyOn;
        
        for (0 => int j; j < chords.cap(); j++)
        {
            Std.mtof(chords[j] + offset + position + 12) => osc2.freq;
            1 => env2.keyOn;
            beat / 8 => now;
        }
    }
}

48 => int offset;
0 => int position;

fun void playSin(int chords[], int position)
{
    for (0 => int i; i < chords.cap(); i++)
    {        
        Std.mtof(chords[0] + offset + position) => osc1.freq;
        1 => env1.keyOn;
        
        for (0 => int j; j < chords.cap(); j++)
        {
            Std.mtof(chords[j] + offset + position + 12) => osc2.freq;
            1 => env2.keyOn;
            beat / 8 => now;
        }
    }
}


// 0 => int c;
// while (c < 3)
// {
//     playSin(major, 0);
//     playSin(minor, -4);
//     playSin(minor, -2);
//     playSin(major, -5);

//     c++;
// }

// playSin(minor, 0);
// playSin(major, -4);
playSin(major, -2);
playSin(minor, -5);

playSin(major, 0);
playSin(major, -7);
playSin(minor, 2);
playSin(major, -5);
