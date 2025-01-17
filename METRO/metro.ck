
//  to stop a sample:
//  set the SndBuf position to a sample past the end of the sample buffer
//  guitar.samples() => guitar.pos; //  STOP PLAYBACK
//  SndBuf guitar;// => dac;

//string filename;
//  filename => guitar.read;

// <<< guitar.samples() >>>;

// for (0 => int i; i < 9; i++)
// {
//     0 => guitar.pos;
//     2.05::second => now;
// }

string stations[30];

//  Controls the speed of the samples
1.0f => float rate;

SndBuf buf;

Delay del;
0.5 => del.gain;
1::second / 2 => del.max;

//  Patch the delay in
buf => del => dac;

fun void play_sample (string sound)
{
    me.dir() + sound => string filename;
    filename => buf.read;

    (1.0 / rate) * (buf.samples() / 44100.0) * 1::second => dur seconds;
    <<< filename + " Duration (seconds): ", seconds / 44100.0 >>>;
        
    rate => buf.rate;

    0 => buf.pos;
    seconds => now;
}

fun void load_m2(string folder)
{
    15 => stations.size;

    "01_pipera.wav" => stations[0];
    "02_aurel_vlaicu.wav" => stations[1];
    "03_aviatorilor.wav" => stations[2];
    "04_piata_victoriei.wav" => stations[3];
    "05_gara_de_nord.wav" => stations[4];
    "06_piata_romana.wav" => stations[5];
    "07_universitate.wav" => stations[6];
    "08_piata_unirii.wav" => stations[7];
    "08_tineretului.wav" => stations[8];
    "09_eroii_revolutiiei.wav" => stations[9];
    "10_ctin_brancoveanu.wav" => stations[10];
    "11_piata_sudului.wav" => stations[11];
    "12_aparatorii_patriei.wav" => stations[12];
    "13_dimitrie_leonida.wav" => stations[13];
    "14_berceni.wav" => stations[14];
    "15_tudor_arghezi.wav" => stations[15];
}

fun void load_m3(string folder)
{
    15 => stations.size;

    "01_angel_saligny.wav" => stations[0];
    "02_nicolae_teclu.wav" => stations[1];
    "03_1_dec_1918.wav" => stations[2];
    "04_nicolae_grigorescu.wav" => stations[3];
    "05_dristor.wav" => stations[4];
    "06_mihai_bravu.wav" => stations[5];
    "07_timpuri_noi.wav" => stations[6];
    "08_piata_unirii.wav" => stations[7];
    "09_izvor.wav" => stations[8];
    "10_eroilor.wav" => stations[9];
    "11_politehnica.wav" => stations[10];
    "12_lujerului.wav" => stations[11];
    "13_gorjului.wav" => stations[12];
    "14_pacii.wav" => stations[13];
    "15_preciziei.wav" => stations[14];
}

//  Load Station Names
fun void load_m1(string folder)
{
    20 => stations.size; 

    "01_pantelimon.wav" => stations[0];
    "02_republica.wav" => stations[1];
    "03_costin_georgian.wav" => stations[2];
    "04_titan.wav" => stations[3];
    "05_nicolae_grigorescu.wav" => stations[4];
    "06_dristor.wav" => stations[5];
    "07_mihai_bravu.wav" => stations[6];
    "08_timpuri_noi.wav" => stations[7];
    "09_piata_unirii.wav" => stations[8];
    "10_izvor.wav" => stations[9];
    "11_eroilor.wav" => stations[10];
    "12_grozavesti.wav" => stations[11];
    "13_petrache_poenaru.wav" => stations[12];
    "14_crangasi.wav" => stations[13];
    "15_basarab.wav" => stations[14];
    "16_gara_de_nord_1.wav" => stations[15];
    "17_piata_victoriei_2.wav" => stations[16];
    "18_stefan_cel_mare.wav" => stations[17];
    "19_obor.wav" => stations[18];
    "20_piata_iancului.wav" => stations[19];
}

fun void load_line (string line)
{
    line => string folder;

    if (line.upper() == "M1")
        load_m1(folder);

    else if (line.upper() == "M2")
        load_m2(folder);

    else if (line.upper() == "M3")
        load_m3(folder);

    //  Prepend folder name
    for( string station : stations )
    {
        folder + "/" + station => station;
    }
}



// play_sample("METRO/urmeaza_statia.wav");
// play_sample("METRO/piata_romana.wav");
// play_sample("METRO/directia_preciziei.wav");

//  Toggle Save To Wav
0 => int SaveToWav;

"M1" => string line;
load_line (line);


//0.5 => del.gain;

//  Save To .Wav?
if (1 == SaveToWav)
{
    dac => WvOut waveOut => blackhole;
    "read_stations_" + line + ".wav" => waveOut.wavFilename;
}

//  Announce The Line
play_sample(line + "/" + line + ".wav");

//  Enumerate stations
for( string station : stations )
{
    <<< "Urmeaza Statia: " + station >>>;

    play_sample("urmeaza_statia.wav");

    play_sample(station);

    //  Pause for a bit
    0.4::second => now;
}