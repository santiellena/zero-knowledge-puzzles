pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Create a circuit that is satisfied if `numerator`,
// `denominator`, `quotient`, and `remainder` represent
// a valid integer division. You will need a comparison check, so
// we've already imported the library and set n to be 252 bits.
//
// Hint: integer division in Circom is `\`.
// `/` is modular division
// `%` is integer modulus

template IntDiv(n) {
    signal input numerator;
    signal input denominator;
    signal input quotient;
    signal input remainder;

    // Ensure numerator = quotient * denominator + remainder
    signal product;
    product <== quotient * denominator;
    numerator === product + remainder;

    // Ensure 0 <= remainder < denominator
    component lessThan = LessThan(n);
    lessThan.in[0] <== remainder;
    lessThan.in[1] <== denominator;
    lessThan.out === 1; // remainder < denominator

    // Optionally ensure denominator != 0 (to avoid division by zero)
    component isZero = IsZero();
    isZero.in <== denominator;
    isZero.out === 0; // denominator must not be 0
}

component main = IntDiv(252);
