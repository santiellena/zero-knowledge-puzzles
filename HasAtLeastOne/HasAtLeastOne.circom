pragma circom 2.1.8;

// Create a circuit that takes an array of signals `in[n]` and
// a signal k. The circuit should return 1 if `k` is in the list
// and 0 otherwise. This circuit should work for an arbitrary
// length of `in`.

template HasAtLeastOne(n) { 
    signal input in[n];
    signal input k;
    signal output out;

    signal s[n];

    s[0] <== in[0] - k;

    for(var i = 1; i < n; i++){
        s[i] <== s[i-1] * (in[i] - k);
    }

    // here the logic of the IsZero template was copied
    // because if s[n-1] == 0, then there is a match

    component iszero = IsZero();
    iszero.in <== s[n-1];
    out <== iszero.out;

    /*
        For the record:
        - At the beggining I thought of the posibility of computing the inverse of a non-zero
        value to multiply it and get one.
        - Then I could treat the hole thing as binary variables, which is easier to work with 
        given the output needed.
        - However, I got a non-quadratic constraint error:
        ```circom
        signal inv_last_s;
        inv_last_s <== 1 / s[n-1];
        out <== 1 - (s[n-1] * inv_last_s);
        ``` 
        - The issue here was that s[n-1] could be zero and division by zero is not allowed,
        this triggered that "non-quadratic constraint" issue. Yes, weird the name of the error
        given the nature of the error.
        - My intuition that the inverse of zero would be zero in Circom was wrong, but I wasn't
        far wrong. If you chech the IsZero template, that's what it does!!
    */
}

template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv +1;
    in*out === 0;
}

component main = HasAtLeastOne(4);
