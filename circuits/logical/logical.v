module and8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = a & b;
endmodule

module or8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = a | b;
endmodule

module xor8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = a ^ b;
endmodule

module nor8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = ~(a | b);
endmodule

module nand8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = ~(a & b);
endmodule

module xnor8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = ~(a ^ b);
endmodule

module not8(
    input [7:0] a,
    output [7:0] y
);
    assign y = ~a;
endmodule

