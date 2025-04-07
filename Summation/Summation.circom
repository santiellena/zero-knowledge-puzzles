pragma circom 2.1.8;

template Summation(n) {
    signal input in[n];
    signal input sum;

    // constrain sum === in[0] + in[1] + in[2] + ... + in[n-1]
    // this should work for any n
    var summation = 0;

    for(var i = 0; i < n; i++){
        summation += in[i];
    }

    summation === sum;
}

component main = Summation(8);