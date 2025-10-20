module tb_shifts;

    reg [7:0] a;
    reg [2:0] shamt;
    wire [7:0] y_sll, y_srl, y_sra;

    sll8 U_SLL(.a(a), .shamt(shamt), .y(y_sll));
    srl8 U_SRL(.a(a), .shamt(shamt), .y(y_srl));
    sra8 U_SRA(.a(a), .shamt(shamt), .y(y_sra));

    initial begin
        $dumpvars(0, tb_shifts);

        a = 8'b10110011;
        shamt = 3'b000; #10;
        shamt = 3'b001; #10;
        shamt = 3'b010; #10;
        shamt = 3'b011; #10;
        shamt = 3'b100; #10;
        shamt = 3'b101; #10;
        shamt = 3'b110; #10;
        shamt = 3'b111; #10;

        a = 8'b11001010;
        shamt = 3'b000; #10;
        shamt = 3'b001; #10;
        shamt = 3'b010; #10;
        shamt = 3'b011; #10;

        $finish;
    end

endmodule

