//  FM Synthesis
SinOsc mod1 => ADSR env1 => 
SinOsc carrier =>
dac => 
WvOut wave =>
blackhole;

"testFM.wav" => wave.wavFilename;
2 => carrier.sync;
0.8 => carrier.gain;

220 => carrier.freq;
210 => mod1.freq;

500 => mod1.gain;

(1::ms, 1::second, 0, 1::ms) => env1.set;
1 => env1.keyOn;
2::second => now;