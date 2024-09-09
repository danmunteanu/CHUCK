BandedWG stk => dac;

[0, 4, 7, 11] @=> int notes[];

48 => int offset;

0.8 => stk.bowPressure;
2 => stk.preset;

while (true)
{
    Math.random2(0, 2) => int position;
    (position * 12) + offset + notes[Math.random2(0, notes.cap() - 1)] => int note;
    note => Std.mtof => stk.freq;
    1.0 => stk.startBowing;
    2800::ms => now;
    1.0 => stk.stopBowing;
    200::ms => now;
}