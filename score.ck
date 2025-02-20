TriOsc osc => ADSR env => dac;
(1::ms, 100::ms, 0, 1::ms) => env.set;

FileIO io;
StringTokenizer tok;

io.open("scores/song_moonlight_densetsu.txt", FileIO.READ) => int result;
// io.open("scores/linkin_park.txt", FileIO.READ) => int result;
// io.open("scores/score.txt", FileIO.READ) => int result;

Clape clape;
5 => clape.m_Octave;

2::second => dur beat;
48 => int offset;

fun void ProcessComment(string line)
{
    <<< line >>>;
}

fun void ProcessRest(string line)
{
    tok.set(line);
    tok.next() => string rest;
    tok.next() => Std.atoi => int div;
    <<< rest, div >>>;
    beat / div => now;
    
}

fun void ProcessNote(string line)
{
    tok.set(line);
    tok.next() => string note;
    tok.next() => Std.atoi => int div;
    <<< note, div >>>;

    clape.note2freq(note) => osc.freq;

    //<<< "tok ", tok.more() >>>;
    // note + offset => Std.mtof => osc.freq;
    1 => env.keyOn;
    beat / div => now;
}

fun void ProcessOctave(string line)
{
    tok.set(line);
    tok.next() => string op;
    if (op == "OCT")
        tok.next() => Std.atoi => clape.m_Octave;
    else if (op == "DOWN")
        clape.octave_down();
    else if (op == "UP")
        clape.octave_up();
    
    <<< clape.m_Octave >>>;

}


0 => int lineStart;
0 => int numLine;

//while (true)
{
    while (io.more())
    {        
        string line;

        if (numLine < lineStart)
        {
            //  Jump lines
            io.readLine() => line;
            
            1 + numLine => numLine;
            continue;
        }

        io.readLine() => line;
        if (line.find ("//") == 0)
        {
            //  Process comment
            line => ProcessComment;
        } 
        else if (line.find("R") == 0)
        {
            //  Process Rest
            line => ProcessRest;
        }
        else if (line.find("OCT") == 0 || 
                line.find("DOWN") == 0 || 
                line.find("UP") == 0)
        {
            line => ProcessOctave;
        }
        else {
            line => ProcessNote;
        }
    }
    0 => io.seek;
}

// while (!io.eof())
// {
//     //  read tokens
//     io => string token;

//     //  read line
//     //  io.readLine() => string token;
//     <<< token >>>;
// }

// //  <<< result >>>;