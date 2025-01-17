<<<"Send to Digital Audio Console">>>;

SinOsc osc => dac => WvOut waveOut => blackhole;

"test.wav" => waveOut.wavFilename;

230 => osc.freq;
0.5 => osc.gain;

1::second => now;