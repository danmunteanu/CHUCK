/*
int freq[4];
440 => freq[0];
660 => freq[1];
880 => freq[2];
1320 => freq[3];
*/

TriOsc osc => ADSR env1 => dac;
0.45 => osc.gain;

1::second => dur beat;
(0::ms, beat / 2, 0, 1::ms) => env1.set;
//(, beat, 1, 50::ms) => env1.set;

[ 110, 440, 330, 220, 770, 660, 880, 1320 ] @=> int frequencies[];


    [60, 62, 64, 65, 67, 69, 71, 72] @=> int pitches[];
//  C   D   E   F   G   A   B   C
//  0   1   2   3   4   5   6   7

fun void play(int idx, dur len)
{
    Std.mtof (pitches[idx]) => osc.freq;
    1 => env1.keyOn;

    len => now;
}

//  55775
play(5, 1::second);
play(5, 0.5::second);
play(7, 0.5::second);
play(7, 0.5::second);
play(5, 0.5::second);

//  pause
Std.mtof (0) => osc.freq;
1 => env1.keyOn;
1::second => now;

//  355
play(3, 0.5::second);
play(5, 0.5::second);
play(5, 0.5::second);


//  2151
play(2, 0.5::second);
play(1, 0.5::second);
play(5, 0.5::second);
play(1, 0.5::second);

// while (true)
// {
    
// for (0 => int idx; idx < frequencies.cap(); idx++)
// {
//     //  frequencies[idx] => osc.freq;

//     //  Std.mtof = MIDI to Frequency
//     //  Oscillators ask for specific frequencies
//     Std.mtof (pitches[idx]) => osc.freq;
//     250::ms => now;
// }

// }