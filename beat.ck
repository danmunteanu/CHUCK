1::second / 2 => dur beat;

TriOsc osc => dac;

0.45 => osc.gain;

100 => osc.freq;
beat / 2  => now;

200 => osc.freq;
beat / 1.8 => now;

400 => osc.freq;
beat /1.5 => now;