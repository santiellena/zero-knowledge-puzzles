pragma circom 2.1.8;

// Create a circuit that takes an array of four signals
// `in`and a signal s and returns is satisfied if `in`
// is the binary representation of `n`. For example:
// 
// Accept:
// 0,  [0,0,0,0]
// 1,  [1,0,0,0]
// 15, [1,1,1,1]
// 
// Reject:
// 0, [3,0,0,0]
// 
// The circuit is unsatisfiable if n > 15

template FourBitBinary() {
    signal input in[4];
    signal input n;

    var coefficient = 1;
    var num = 0;
    for(var i = 0; i < 4; i++){
        0 === in[i] * (in[i] - 1); // binary
        
        num += in[i] * coefficient;
        coefficient *= 2;
    }

    n === num;
}

component main{public [n]} = FourBitBinary();
