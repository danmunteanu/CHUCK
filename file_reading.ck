TriOsc osc => ADSR env => dac;
(1::ms, 100::ms, 0, 1::ms) => env.set;

FileIO io;
StringTokenizer tok;

io.open("king.txt", FileIO.READ) => int result;

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
    tok.next() => Std.atoi => int note;
    tok.next() => Std.atoi => int div;
    <<< note, div >>>;
    //<<< "tok ", tok.more() >>>;
    note + offset => Std.mtof => osc.freq;
    1 => env.keyOn;
    beat / div => now;
}

//while (true)
{
    while (io.more())
    {
        io.readLine() => string line;

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