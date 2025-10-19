module half_subtractor (
    input a,
    input b,
    output diff,
    output borrow
);
    assign diff = a ^ b;
    assign borrow = ~a & b;
endmodule

module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output borrow_out
);
    assign diff = a ^ b ^ bin;
    assign borrow_out = (~a & b) | ((~a | b) & bin);
endmodule

module subtr8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] diff,
    output bout
);
    wire [7:0] borrow; 

    full_subtractor FS0(a[0], b[0], 1'b0, diff[0], borrow[0]);
    full_subtractor FS1(a[1], b[1], borrow[0], diff[1], borrow[1]);
    full_subtractor FS2(a[2], b[2], borrow[1], diff[2], borrow[2]);
    full_subtractor FS3(a[3], b[3], borrow[2], diff[3], borrow[3]);
    full_subtractor FS4(a[4], b[4], borrow[3], diff[4], borrow[4]);
    full_subtractor FS5(a[5], b[5], borrow[4], diff[5], borrow[5]);
    full_subtractor FS6(a[6], b[6], borrow[5], diff[6], borrow[6]);
    full_subtractor FS7(a[7], b[7], borrow[6], diff[7], borrow[7]);

    assign bout = borrow[7];
endmodule
