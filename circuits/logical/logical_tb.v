module logic_tb;

    reg [7:0] A, B;
    wire [7:0] AND_OUT, OR_OUT, XOR_OUT, NOR_OUT, NAND_OUT, XNOR_OUT, NOT_OUT;

    and8   u_and8(.a(A), .b(B), .y(AND_OUT));
    or8    u_or8(.a(A), .b(B), .y(OR_OUT));
    xor8   u_xor8(.a(A), .b(B), .y(XOR_OUT));
    nor8   u_nor8(.a(A), .b(B), .y(NOR_OUT));
    nand8  u_nand8(.a(A), .b(B), .y(NAND_OUT));
    xnor8  u_xnor8(.a(A), .b(B), .y(XNOR_OUT));
    not8   u_not8(.a(A), .y(NOT_OUT));

    initial begin
        $dumpvars(0, logic_tb);

        A = 8'b00001111; B = 8'b11110000; #10;
        A = 8'b10101010; B = 8'b01010101; #10;
        A = 8'b11111111; B = 8'b00000000; #10;
        A = 8'b11001100; B = 8'b00110011; #10;

        $finish;
    end

endmodule

