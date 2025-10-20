module inc8(
    input [7:0] a,
    output [7:0] out,
    output cout
);
    adder8 A1(a, 8'h01, out, cout);

endmodule

module dec8(
    input [7:0] a,
    output [7:0] out,
    output bout
);
    subtr8 S1(a, 8'h01, out, bout);

endmodule
