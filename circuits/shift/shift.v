module sll8(
    input [7:0] a,
    input [2:0] shamt, 
    output [7:0] y
);
    assign y = a << shamt;
endmodule

module srl8(
    input [7:0] a,
    input [2:0] shamt,
    output [7:0] y
);
    assign y = a >> shamt;

endmodule

module sra8(
    input [7:0] a,
    input [2:0] shamt,
    output [7:0] y
);
    assign y = $signed(a) >>> shamt;
endmodule

