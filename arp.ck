public class MusicTri extends TriOsc
{
    SinOsc vibrato => this;
    2 => this.sync;
    6 => vibrato.freq;
    25 => vibrato.gain;

    48 => int offset;

    fun void note(int noteNum)
    {
        Std.mtof(noteNum + offset) => this.freq;
    }
}

MusicTri osc => dac;

220 => osc.freq;
0.2 => osc.gain;

[0, 3, 7, 11] @=> int notes[];
48 => int offset;

while (true)
{
    -1 => osc.vibrato.op;
    for (0 => int i; i < notes.cap(); ++i)
    {
        notes[i] => osc.note;
        1::second / 4 => now;
    }

    1 => osc.vibrato.op;
    for (0 => int i; i < notes.cap(); ++i)
    {
        10 * i => osc.vibrato.freq;
        notes[i] => osc.note;
        1::second / 4 => now;
    }

}