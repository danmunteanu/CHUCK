//  Beat & Sync
1::second => dur T;
T - (now % T) => now;

//  one period offset
// T => now;

SinOsc osc => dac;

111 => osc.freq;
0.5 => osc.gain;

T => now;