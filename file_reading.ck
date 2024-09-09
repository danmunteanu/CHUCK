FileIO io;

io.open("score.txt", FileIO.READ) => int result;

while (!io.eof())
{
    //  read tokens
    io => string token;

    //  read line
    //  io.readLine() => string token;
    <<< token >>>;
}

//  <<< result >>>;