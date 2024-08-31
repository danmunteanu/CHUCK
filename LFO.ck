SinOsc lfo2 => blackhole;
SinOsc lfo => blackhole;
TriOsc osc => LPF filter => dac;

//  Oscillators put out a value between -1 and 1

0.5 => lfo2.freq;
1 => lfo.freq;
55 => int oscFreq => osc.freq;
0.125 => float oscGain => osc.gain;
500 => float filterFreq => filter.freq;
3 => filter.Q;

// 440 => int oscFreq => osc.freq;
// 0.25 => osc.gain;
// 6 => lfo.freq;

while (true)
{
    // <<< lfo.last(), "" >>>;

    // oscFreq + (oscFreq * lfo.last() / 40) => osc.freq;

    ((lfo2.last() + 1) * 5) => lfo.freq;
    filterFreq + ((lfo.last()) * filterFreq) => filter.freq;

    1::ms => now;
}