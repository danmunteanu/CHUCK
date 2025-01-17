1 => int counter;

/*while (counter <= 7)
{
    500::ms => now;  //  Advance the project by this duration
    <<< counter >>>;
    counter + 1 => counter;
}*/

//  Osc
SinOsc osc => dac;
0.2 => osc.gain;

for (1000 => int idx; idx > 0; idx--)
{
    idx => osc.freq;
    <<< idx >>>;
    2::ms => now;
}