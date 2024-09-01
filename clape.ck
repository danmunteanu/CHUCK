public class Clape
{
	//	60 MIDI = C5

	//	The notes we'll play
	string notes[100];

	//	minor/major scale of midi notes
	int scale[8];

	4 => int octave;

	//	root = octave * 12

	//	returns an index between [0, 11]
	fun int note2index(string note)
	{
		0 => int idx;
		
		if ("C" == note) 0 => idx;
		
			if ("C#" == note) 1 => idx;
			if ("DB" == note) 1 => idx;
		
		if ("D" == note) 2 => idx;
		
			if ("D#" == note) 3 => idx;
			if ("EB" == note) 3 => idx;
		
		if ("E" == note) 4 => idx;
		
		if ("F" == note) 5 => idx;
		
			if ("F#" == note) 6 => idx;
			if ("GB" == note) 6 => idx;
		
		if ("G" == note) 7 => idx;
		
			if ("G#" == note) 8 => idx;
			if ("AB" == note) 8 => idx;
		
		if ("A" == note) 9 => idx;
		
			if ("A#" == note) 10 => idx;
			if ("BB" == note) 10 => idx;
		
		if ("B" == note) 11 => idx;

		return idx;
	}

	fun float note2freq (string note)
	{
		octave * 12 => int root;

		//	get the index of the note	
		note2index(note.upper()) => int idx;

		<<< "Index " + idx >>>;

		return Std.mtof(root + idx);
	}

	fun void up_octave()
	{
		octave + 1 => octave;
		if (octave > 11)
			11 => octave;
	}

	fun void down_octave()
	{
		octave - 1 => octave;
		if (octave < 0)
			0 => octave;
	}

	fun void score_to_music (string score)
	{
		StringTokenizer strtok;

		// set the string
		strtok.set( score );

		// check how many tokens there are
		<<< "tokens found:", strtok.size() >>>;

		//	Allocate size of notes
		strtok.size() => notes.size;

		//	Reset Index
		0 => int idx;

		// iterate through the tokens
		while( strtok.more() )
		{
			// print current token
			strtok.next() => string token;

			//	Save this token to array
			token => notes[idx];

			//	<<< "Note " + idx + ": " + notes[idx] >>>;

			idx + 1 => idx;
		}

		// reset the tokenizer
		strtok.reset();
	}

	fun string index2Note(int idx)
	{
		idx % 12 => idx;

		if (idx == 0) return "C";
			if (idx == 1) return "C#";
		if (idx == 2) return "D";
			if (idx == 3) return "D#";
		if (idx == 4) return "E";
		if (idx == 5) return "F";
			if (idx == 6) return "F#";
		if (idx == 7) return "G";
			if (idx == 8) return "G#";
		if (idx == 9) return "A";
			if (idx == 10) return "A#";
		if (idx == 11) return "B";

		return "C";
	}

	fun void gen_minor_scale(string start_note, int octave)
	{
		//	W H W W H W W / T S T T S T T
		[0, 2, 1, 2, 2, 1, 2, 2] @=> int minor[];

		note2index(start_note) => int note_index;	//	Get note index
		
		0 => int midi;
		8 => scale.size;
		for (0 => int jdx; jdx < 8; jdx++)
		{
			note_index + minor[jdx] => note_index;
			octave * 12 + note_index => midi => scale[jdx];
		}		
	}

	fun void gen_major_scale(string start_note, int octave)
	{
		//	Major Scale
		//  W W H W W W H / T T S T T T S

		//	<<< start_note + "" + octave >>>;

		//	C, 5 => 5 * 12 + index(C)

		[0, 2, 2, 1, 2, 2, 2, 1] @=> int major[];

		note2index(start_note) => int note_index;	//	Get note index
		
		0 => int midi;
		8 => scale.size;
		for (0 => int jdx; jdx < 8; jdx++)
		{
			note_index + major[jdx] => note_index;
			octave * 12 + note_index => midi => scale[jdx];
		}		
	}

}
