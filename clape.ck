//	Chords using notes from the scale => Diatonic

//	Chords using notes not all from the scale => Chromatic

//	Chord 1: Tonic (e.g. C major => C-E-G)
//	Chord 5: Dominant (C major => G-B-D)

public class Clape
{
	//	60 MIDI = C5

	11 => int MAX_OCTAVE;
	0 => int MIN_OCTAVE;

	//	The notes we'll play
	string mNotes[256];

	//  A major scale is a pattern of intervals
	//   W W H W W W H or T T S T T T S
	[0, 2, 2, 1, 2, 2, 2, 1] @=> int mMajorScale[];

	//	W H W W H W W / T S T T S T T
	[0, 2, 1, 2, 2, 1, 2, 2] @=> int mMinorScale[];

	//	Chords
	[0, 4, 3] @=> int chord_major[];
	[0, 3, 4] @=> int chord_minor[];

	//	Active scale, contains MIDI Notes
	int mScale[8];

	//	active octave
	5 => int mOctave;

	//	ctor
	fun @construct()
	{
		//	Load major scale starting on C5
		load_scale("C", 5, mMajorScale);
	}

	//	dtor
	fun @destruct()
	{
		//	handle destruction operations, if any	
	}

	//	root = octave * 12

	//	note2index maps a note to an index between [0, 11]
	//	e.g. 
	//		C -> 0, 
	//		D# -> 3
	fun static int note2index(string n)
	{
		n.upper() => string note;
		-1 => int idx;
		
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

	fun int validateNote(string n)
	{
		n.upper() => string note;

		return
			("C" == note) ||
				("C#" == note) ||
				("DB" == note) ||
			("D" == note) ||	
				("D#" == note) ||
				("EB" == note) ||
			("E" == note) ||		
			("F" == note) ||		
				("F#" == note) ||
				("GB" == note) ||
			("G" == note) ||		
				("G#" == note) ||
				("AB" == note) ||
			("A" == note) ||	
				("A#" == note) ||
				("BB" == note) ||
			("B" == note);
	}

	//	converts a [0, 11] index to a note (uses modulo 12)
	fun static string index2Note(int idx)
	{
		//	Return Sharps or Flats?

		idx % 12 => idx;

		//	default to sharps
		"#" => string x;

		if (idx == 0) return "C";
			if (idx == 1) return "C" + x;
		if (idx == 2) return "D";
			if (idx == 3) return "D" + x;
		if (idx == 4) return "E";
		if (idx == 5) return "F";
			if (idx == 6) return "F" + x;
		if (idx == 7) return "G";
			if (idx == 8) return "G" + x;
		if (idx == 9) return "A";
			if (idx == 10) return "A" + x;
		if (idx == 11) return "B";

		//	default to C
		return "C";
	}

	//	Generates MIDI notes based on p_scale and stores them into the scale array
	fun void load_scale(string start_note, int octave, int p_scale[])
	{
		note2index(start_note) => int note_index;	//	Get note index

		<<< "start note ", start_note >>>;
		<<< "note index ", note_index >>>;

		0 => int midi;
		8 => mScale.size;
		for (0 => int jdx; jdx < 8; jdx++)
		{
			note_index + p_scale[jdx] => note_index;
			octave * 12 + note_index => midi => mScale[jdx];
		}
	}

	//	Returns the frequency of the note based on current octave
	fun float note2freq (string note)
	{
		//	root note of the octave
		mOctave * 12 => int root;

		//	get the index of the note	
		note2index(note) => int idx;

		//<<< "Index " + idx >>>;

		//	Frequency
		return Std.mtof(root + idx);
	}

	//	raises the current octave, but keeps it below MAX_OCTAVE
	fun void octaveUp()
	{
		mOctave + 1 => mOctave;
		if (mOctave > MAX_OCTAVE)
			MAX_OCTAVE => mOctave;
	}

	//	decreases the current octave DOWN to MIN_OCTAVE
	fun void octaveDown()
	{
		mOctave - 1 => mOctave;
		if (mOctave < MIN_OCTAVE)
			MIN_OCTAVE => mOctave;
	}

	//	Converts score to music
	fun void score_to_music (string score)
	{
		StringTokenizer strtok;

		// set the string
		strtok.set( score );

		// check how many tokens there are
		<<< "tokens found:", strtok.size() >>>;

		//	Allocate size of notes
		strtok.size() => mNotes.size;

		//	Reset Index
		0 => int idx;

		// iterate through the tokens
		while( strtok.more() )
		{
			// print current token
			strtok.next() => string token;

			//	Save this token to array
			token => mNotes[idx];

			//	<<< "Note " + idx + ": " + notes[idx] >>>;

			idx + 1 => idx;
		}

		// reset the tokenizer
		strtok.reset();
	}

}
