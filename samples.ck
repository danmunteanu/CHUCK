SndBuf guitar;// => dac;

string filename;
//  filename => guitar.read;

// <<< guitar.samples() >>>;

// for (0 => int i; i < 9; i++)
// {
//     0 => guitar.pos;
//     2.05::second => now;
// }

string statii[20];

//  Controls the speed of the samples
1.1f => float rate;

fun void play_wav (string sound)
{
    SndBuf buf;
    me.dir() + sound => filename;
    filename => buf.read;

    (1.0 / rate) * (buf.samples() / 44100.0) * 1::second => dur seconds;
    <<< filename + " Duration (seconds): ", seconds / 44100.0 >>>;
        
    rate => buf.rate;

    buf => dac;
    0 => buf.pos;
    seconds => now;
}

fun void load_stations(string folder)
{
    "01_pantelimon.wav" => statii[0];
    "02_republica.wav" => statii[1];
    "03_costin_georgian.wav" => statii[2];
    "04_titan.wav" => statii[3];
    "05_nicolae_grigorescu.wav" => statii[4];
    "06_dristor.wav" => statii[5];
    "07_mihai_bravu.wav" => statii[6];
    "08_timpuri_noi.wav" => statii[7];
    "09_piata_unirii.wav" => statii[8];
    "10_izvor.wav" => statii[9];
    "11_eroilor.wav" => statii[10];
    "12_grozavesti.wav" => statii[11];
    "13_petrache_poenaru.wav" => statii[12];
    "14_crangasi.wav" => statii[13];
    "15_basarab.wav" => statii[14];
    "16_gara_de_nord_1.wav" => statii[15];
    "17_piata_victoriei_2.wav" => statii[16];
    "18_stefan_cel_mare.wav" => statii[17];
    "19_obor.wav" => statii[18];
    "20_piata_iancului.wav" => statii[19];
}

//  to stop a sample:
//  set the SndBuf position to a sample past the end of the sample buffer
//  guitar.samples() => guitar.pos; //  STOP PLAYBACK

play_wav("METRO/urmeaza_statia.wav");
play_wav("METRO/piata_romana.wav");
play_wav("METRO/directia_preciziei.wav");

load_stations;
for( string statie : statii )
{
    // print the element
    <<< statie >>>;
}