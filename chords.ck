//  MAJOR SCALE / T T S T T T S
[0, 2, 2, 1, 2, 2, 2, 1] @=> int scaleMajor[];

//  MINOR SCALE / T S T T S T T
[0, 2, 1, 2, 2, 1, 2, 2] @=> int scaleMinor[];

//  chords
[0, 4, 3] @=> int chordMajor[];
[0, 3, 4] @=> int chordMinor[];

Gain master => dac;
60 => int root; //  C5
0.55f::second => dur beat;  //  Duration

//  Oscillators
[new TriOsc, new TriOsc, new TriOsc] @=> TriOsc oscs[];

//  Max gain for oscillators
1.0f / oscs.size() => float max_gain;
<<< "Max Gain: " + max_gain >>>;

//  Initialize oscillators
for (0 => int i; i < oscs.size(); i++) {
    max_gain => oscs[i].gain;
    oscs[i] => master;
}

fun void playChord(TriOsc o[], int root, int chord[], dur beat)
{
    root => int midiNote;

    0 => int idx;
    //  Put each note of the chord into an oscillator
    for (idx; idx < chord.size(); idx++)
    {
        midiNote + chord[idx] => midiNote;
        <<< midiNote >>>;
        Std.mtof(midiNote) => o[idx].freq;
    }

    beat => now;
}

fun playScale(int root, int scale[])
{
    root => int note;
    for (0 => int idx; idx < scale.size(); idx++)
    {
        note + scale[idx] => note;
        playChord(oscs, note, chordMajor, beat);    
    }

}

// playChord(oscs, 60, chordMajor, 1::second);

playScale(60, scaleMajor);

//  pause a bit
0 => master.gain;
0.5::second => now;
1 => master.gain;

// playChord(oscs, 65, chordMinor, 1::second);

