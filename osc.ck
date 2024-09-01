
SinOsc osc => dac;

440 => osc.freq;
0.25 => osc.gain;

1::second / 2 => dur beat;
beat => now;

osc.freq() * 2 => osc.freq;
beat => now;

osc.freq() * 2 => osc.freq;
beat => now;

osc.freq() * 2 => osc.freq;
beat => now;