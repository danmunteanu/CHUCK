<<< "Panning and Randomization" >>>;

TriOsc osc => ADSR env1 => dac.right;
env1 => Delay delay[2];

0.5::second => dur beat;
delay[0] => dac.left;
delay[1] => dac.right;
beat => delay[0].max => delay[1].max;
0.5 => delay[0].gain => delay[1].gain;
delay[0] => delay[0];
delay[1] => delay[1];
beat / 4 => delay[0].delay;
beat / 2 => delay[1].delay;

(1::ms, beat/8, 0, 1::ms) => env1.set;
0.75 => osc.gain;

[0,4,7] @=> int major[];
[0,3,7] @=> int minor[];

60 => int offset;
int position;

for(0 => int i; i < 4; i++)
{
    for(0 => int j; j < minor.cap(); j++)
    {
        Std.mtof(minor[0] + offset + position) => osc.freq;
        1 => env1.keyOn;
        beat => now;
    }
}