
me.dir () + "14-drum-machine-sounds/" => string folder;

SndBuf kick => dac;
SndBuf snare => dac;
SndBuf cHat => dac;
SndBuf oHat => dac;

folder + "kick.wav" => string kickFile;
folder + "snare.wav" => string snareFile;
folder + "c-hat.wav" => string cHatFileName;
folder + "o-hat.wav" => string oHatFileName;

kickFile => kick.read;
snareFile => snare.read;
cHatFileName => cHat.read;
oHatFileName => oHat.read;

fun void SilenceAllBuffers()
{
    kick.samples() => kick.pos;
    snare.samples() => snare.pos;
    cHat.samples () => cHat.pos;
    oHat.samples () => oHat.pos;
}

SilenceAllBuffers();

0.5::second => dur beat;

fun void Drum (int select, dur duration)
{
    if (select == 0)
    {
        0 => kick.pos;
        0 => cHat.pos;
    }

    if (select == 1)
    {
        0 => oHat.pos;
    }

    if (select == 2)
    {
        0 => kick.pos;
        0 => cHat.pos;
        0 => snare.pos;
    }

    duration => now;

    SilenceAllBuffers();
}

1.12 => float factor;

while (true)
{
    
    Drum (0, beat / 2);
    Drum (1, beat / 2);
    Drum (2, beat / 2);
    Drum (1, beat / 2);
    Drum (0, beat / 2);
    Drum (1, beat / 2);
    Drum (2, beat / 2);
    Drum (1, beat / 2);

    beat * 1 / factor => beat;
    1 / factor => factor;
}

