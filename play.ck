SndBuf buffer => dac;

"Infinituri 6.wav" => buffer.read;
buffer.samples() => buffer.pos;

0 => buffer.pos;
buffer.length() => now;