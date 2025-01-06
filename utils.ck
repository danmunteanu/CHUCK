// A collection of Chuck utils

//  prints out all available audio devices and MIDI devices
//  chuck --probe   

// print out value of an expression or var
<<< "4 + 5 is", 4 + 5 >>>;

// chuck intializer to array reference
[ 1, 1, 2, 3, 5, 8 ] @=> int foo[];

//  Array of objects

// objects in arrays are automatically instantiated
Object group[10];

// array of null object references
Object @ groupp[10];

//  Generates information regarding the 
//  underlying type of an object or a class
SinOsc.help();

// declare 2 by 2 array of int
[ [1,3], [2,4] ] @=> int bars[][];

//  OBJECT INSTANTIATION
class Foo {}
// create a Foo object; stored in reference variable bar
Foo bar;

// create a null reference to a Foo object
Foo @ bar2;

// assign new instance of Foo to bar
new Foo @=> Foo @ bar3;

//  The code above is exactly equivalent to Foo bar; as shown above. 
//  The new operator creates an instance of a class, in this case Foo. 
//  The @=> operator performs the reference assignment. 

// reference assign to duh
bar @=> Foo @ duh;  // (now both bar and duh points to the same object)

//  There can be at most one public class per file.

