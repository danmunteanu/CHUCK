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

	fun void gen_major_scale(string start_note, int octave)
	{
		//  W W H W W W H - Major Scale

		//	C, 5 => 5 * 12 + index(C)

		note2index(start_note) => int idx;	//	Get note index
		
		//	Compute midi for note
		octave * 12 + idx => int midi;	midi => scale[0];
		
		idx + 2 => idx;	//	W
		octave * 12 + idx => midi;	midi => scale[1];

		idx + 2 => idx;	//	W
		octave * 12 + idx => midi;	midi => scale[2];

		idx + 1 => idx;	//	H
		octave * 12 + idx => midi;	midi => scale[3];

		idx + 2 => idx;	//	W
		octave * 12 + idx => midi;	midi => scale[4];

		idx + 2 => idx;	//	W
		octave * 12 + idx => midi;	midi => scale[5];

		idx + 2 => idx;	//	W
		octave * 12 + idx => midi;	midi => scale[6];

		idx + 1 => idx;	//	H
		octave * 12 + idx => midi;	midi => scale[7];

		// <<< start_note + "" + octave + " has MIDI: " + midi >>>;

		/*8 => notes.size;
		index2Note(idx) => notes[0];	(idx + 2)% 12 => idx;	//	W
		index2Note(idx) => notes[1];	(idx + 2)% 12 => idx;	//	W
		index2Note(idx) => notes[2];	(idx + 1)% 12 => idx;	//	H
		index2Note(idx) => notes[3];	(idx + 2)% 12 => idx;	//	W
		index2Note(idx) => notes[4];	(idx + 2)% 12 => idx;	//	W
		index2Note(idx) => notes[5];	(idx + 2)% 12 => idx;	//	W
		index2Note(idx) => notes[6];	(idx + 1)% 12 => idx;	//	H
		index2Note(idx) => notes[7];	*/

	}

}
