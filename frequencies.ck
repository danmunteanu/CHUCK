/*
int freq[4];
440 => freq[0];
660 => freq[1];
880 => freq[2];
1320 => freq[3];
*/

SinOsc osc => dac;
0.15 => osc.gain;

[ 110, 440, 330, 220, 770, 660, 880, 1320 ] @=> int frequencies[];

[60, 62, 64, 65, 67, 69, 71, 72] @=> int pitches[];

while (true)
{
    
for (0 => int idx; idx < frequencies.cap(); idx++)
{
    //  frequencies[idx] => osc.freq;

    //  Std.mtof = MIDI to Frequency
    //  Oscillators ask for specific frequencies
    Std.mtof (pitches[idx]) => osc.freq;
    200::ms => now;
}

}