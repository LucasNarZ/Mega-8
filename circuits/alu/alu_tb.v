module tb_alu8;

    reg [7:0] a, b;
    reg [3:0] opcode;
    wire [7:0] y;
    wire cout, bout;

    alu8 U_ALU(a, b, opcode, y, cout, bout);

    initial begin
        $dumpvars(0, tb_alu8);

        a = 8'h3C;
        b = 8'h12;

        opcode = 4'd0; #5;
        opcode = 4'd1; #5;
        opcode = 4'd2; #5;
        opcode = 4'd3; #5;
        opcode = 4'd4; #5;
        opcode = 4'd5; #5;
        opcode = 4'd6; #5;
        opcode = 4'd7; #5;
        opcode = 4'd8; #5;
        opcode = 4'd9; #5;
        opcode = 4'd10; #5;
        opcode = 4'd11; #5;
        opcode = 4'd12; #5;
        opcode = 4'd13; #5;
        opcode = 4'd14; #5;
        opcode = 4'd15; #5;

        $finish;
    end

endmodule

