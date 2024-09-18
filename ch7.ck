SinOsc osc (440) => dac;
0.15 => osc.gain;
0.5::second => now;

Osc osc1 => dac;
0.15 => osc1.gain;
33 => osc1.freq;
0.5::second => now;

//  7th

//  Dominant Maj3-min3-min3
//  [0, 4, 7, 10]

//  Major 7th Maj3-min3-Maj3
//  [0, 4, 7, 11]

//  Minor 7th min3-Maj3-min3
//  [0, 3, 7, 10]

//  Minor major 7th min3-Maj3-Maj3
//  [0, 3, 7, 11]

//  Half dim 7th
//  [0, 3, 6, 10]

//  Fully dim 7th
//  [0, 3, 6, 9]
