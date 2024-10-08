<<< "Reverbs & Delays" >>>; 

//  Signal Chain
SinOsc osc => ADSR env1  => NRev rev1 => dac; 
env1 => Delay delay1 => dac;

0.9 => osc.gain; 

0.5::second => dur beat; 
(1::ms, beat / 8, 0, 1::ms) => env1.set;

0.2 => rev1.mix;

beat => delay1.max;
beat / 4 => delay1.delay;
0.5 => delay1. gain;
delay1 => delay1;   //  feedback

[0,4,7] @=> int major[]; 
[0,3,7] @=> int minor[]; 

60 => int offset;
int position; 

for(0 => int i; i < 4; i++) { 
    for(0 => int j; j < minor.cap(); j++) { 
        Std.mtof(minor[j] + offset + position) => osc.freq; 
        1 => env1.keyOn;
        beat => now;
    } 
} 

