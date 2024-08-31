SqrOsc lfo => blackhole;
TriOsc osc => dac;

440 => int oscFreq => osc.freq;
0.25 => osc.gain;

6 => lfo.freq;

while (true)
{
    <<< lfo.last(), "" >>>;

    oscFreq + (oscFreq * lfo.last() / 40) => osc.freq;

    1::ms => now;
}