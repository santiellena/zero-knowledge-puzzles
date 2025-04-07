pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Write a circuit that returns true when at least one
// element is 1. It should return false if all elements
// are 0. It should be unsatisfiable if any of the inputs
// are not 0 or not 1.

template MultiOR(n) {
    signal input in[n];
    signal output out;

    signal s[n];

    0 === in[0] * (in[0] - 1);
    s[0] <== in[0];

    for(var i = 1; i < n; i++){
        0 === in[i] * (in[i] - 1);
        s[i] <== in[i] + s[i-1] - in[i] * s[i-1];
    }

    out <== s[n-1];
}

component main = MultiOR(4);
