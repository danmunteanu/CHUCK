SinOsc osc (440) => dac;
0.15 => osc.gain;
0.5::second => now;

Osc osc1 => dac;
0.15 => osc1.gain;
33 => osc1.freq;
0.5::second => now;


