Noise osc => BRF filter => dac => WvOut waveOut => blackhole;

"filters.wav" => waveOut.wavFilename;

1000 => filter.freq;

//440 => osc.freq;
10 => filter.Q;
0.2 => osc.gain;

1::second => now;

