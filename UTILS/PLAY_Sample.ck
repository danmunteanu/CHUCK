SndBuf buffer => dac;

"piata_romana.wav" => buffer.read;
buffer.samples() => buffer.pos;

0 => buffer.pos;
buffer.length() => now;