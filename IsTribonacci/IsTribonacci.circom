pragma circom 2.1.8;

template IsTribonacci(n) {
    signal input in[n];
    assert (n >= 3);

    // check if in[n] is a tribonacci sequence
    // 0, 1, 1, 2, 4, 7, 13, 24, 44, ...
    // The three first are 0, 1, 1,
    // the rest are the sum of the previous three
    // circuit must work for arbitrary n

    in[0] === 0;
    in[1] === 1;
    in[2] === 1;

    for(var i = 3; i < n; i++){
        in[i] === in[i-1] + in[i-2] + in[i-3]; 
    }
}

component main = IsTribonacci(9);