pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
   // Your Code Here..
   signal input a[3];
   signal output c;

   var e;
   var f;
   e = a[0] - a[1];
   f = a[1] - a[2];

   c <== (1 - f) * (1 - e);
}

component main = Equality();