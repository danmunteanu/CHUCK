
//  to stop a sample:
//  set the SndBuf position to a sample past the end of the sample buffer
//  guitar.samples() => guitar.pos; //  STOP PLAYBACK
SndBuf guitar;// => dac;

//string filename;
//  filename => guitar.read;

// <<< guitar.samples() >>>;

// for (0 => int i; i < 9; i++)
// {
//     0 => guitar.pos;
//     2.05::second => now;
// }

string statii[30];

//  Controls the speed of the samples
1.0f => float rate;

fun void play_sample (string sound)
{
    SndBuf buf;
    me.dir() + sound => string filename;
    filename => buf.read;

    (1.0 / rate) * (buf.samples() / 44100.0) * 1::second => dur seconds;
    <<< filename + " Duration (seconds): ", seconds / 44100.0 >>>;
        
    rate => buf.rate;

    buf => dac;
    0 => buf.pos;
    seconds => now;
}

fun void load_m3(string folder)
{
    15 => statii.size;

    "01_angel_saligny.wav" => statii[0];
    "02_nicolae_teclu.wav" => statii[1];
    "03_1_dec_1918.wav" => statii[2];
    "04_nicolae_grigorescu.wav" => statii[3];
    "05_dristor.wav" => statii[4];
    "06_mihai_bravu.wav" => statii[5];
    "07_timpuri_noi.wav" => statii[6];
    "08_piata_unirii.wav" => statii[7];
    "09_izvor.wav" => statii[8];
    "10_eroilor.wav" => statii[9];
    "11_politehnica.wav" => statii[10];
    "12_lujerului.wav" => statii[11];
    "13_gorjului.wav" => statii[12];
    "14_pacii.wav" => statii[13];
    "15_preciziei.wav" => statii[14];
}

//  Load Station Names
fun void load_m1(string folder)
{
    20 => statii.size; 

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

fun void load_line (string line)
{
    "STATII_" + line => string folder;

    if (line.upper() == "M1")
        load_m1(folder);

    if (line.upper() == "M3")
        load_m3(folder);

    //  Prepend folder name
    for( string statie : statii )
    {
        folder + "/" + statie => statie;
    }
}



// play_sample("METRO/urmeaza_statia.wav");
// play_sample("METRO/piata_romana.wav");
// play_sample("METRO/directia_preciziei.wav");


"M3" => string linia;
load_line (linia);
play_sample("STATII_" + linia + "/" + linia + ".wav");

//  Enumera statii
for( string statie : statii )
{
    <<< statie >>>;

    play_sample("METRO/urmeaza_statia.wav");

    play_sample(statie);
}