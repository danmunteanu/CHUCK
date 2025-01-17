me.dir () + "night_king.ck" => string nightKing;

//Machine.add(nightKing) => int id;

SinOsc osc => dac;
110 => osc.freq;
0.2 => osc.gain;

6::second => now;

//Machine.remove(id);