//  MIDI = Musical Instrument Digital Interface

//  Decades old standard for letting Digital Instruments talk to each other

//  Has been in place for 40+ years

//  Midi uses 0-127 to represent musical notes

//  0 == 8 Hz
//      far below human hearing

//  Human hearing starts at 20Hz
//  Speakers don't play below 40-50Hz

//  Pianos have 88 keys instead of 127

//  There are only 12 notes
//  Most songs use most 7 notes

/*  CODE
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] @=> int notes[];

SinOsc osc => dac;
0.35 => osc.gain;

for (0 => int i; i < 11; i++)
{
    Std.mtof(notes[i] + 30) => osc.freq;
    200::ms => now;
}*/

//  Music Theory

//  Major Chords = Bright, Happy

//  Minor Chords = Darker, Sad

[0, 4, 7] @=> int major[];
[0, 3, 7] @=> int minor[];


SinOsc osc => dac => WvOut waveOut => blackhole;
"Midi.wav" => waveOut.wavFilename;

0.35 => osc.gain;

48 => int offset;
int position;

150::ms => dur eighth;

-1 => int count;
while (count < 3) 
{
    count++;

    0 => position;
    for (0 => int i; i < 4; i++)
    {
        for (0 => int j; j < 3; j++)
        {
            Std.mtof(major[j] + offset + position) => osc.freq;
            eighth => now;
        }
    }

    -3 => position;
    for (0 => int i; i < 4; i++)
    {
        for (0 => int j; j < 3; j++)
        {
            Std.mtof(minor[j] + offset + position) => osc.freq;
            eighth => now;
        }
    }

    5 => position;
    for (0 => int i; i < 4; i++)
    {
        for (0 => int j; j < 3; j++)
        {
            Std.mtof(major[j] + offset + position) => osc.freq;
            eighth => now;
        }
    }

    7 => position;
    for (0 => int i; i < 4; i++)
    {
        for (0 => int j; j < 3; j++)
        {
            Std.mtof(minor[j] + offset + position) => osc.freq;
            eighth => now;
        }
    }

}