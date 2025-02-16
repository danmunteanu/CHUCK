public class Utils
{
    //	Static vector declaration
    //  https://chuck.cs.princeton.edu/doc/examples/vector/vec3.ck
    @(5,6,7) => static vec3 S_VEC3;

    // array
    [8,9,10,11] @=> static int S_INT_ARRAY[];
}

@(12, 3, 5) => Utils.S_VEC3;

<<< Utils.S_VEC3 >>>;