Noise osc => HPF filter => dac => WvOut waveOut => blackhole;

"filters.wav" => waveOut.wavFilename;

1000 => filter.freq;

//440 => osc.freq;
0.5 => osc.gain;

1::second => now;

