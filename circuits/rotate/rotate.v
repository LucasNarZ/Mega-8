module rol8(
    input [7:0] a,
    input [2:0] shamt,
    output [7:0] y
);
    assign y = (a << shamt) | (a >> (8-shamt));
endmodule

module ror8(
    input [7:0] a,
    input [2:0] shamt,
    output [7:0] y
);
    assign y = (a >> shamt) | (a << (8-shamt));
endmodule

