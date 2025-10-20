module tb_rotate;

    reg [7:0] a;
    reg [2:0] shamt;
    wire [7:0] y_rol, y_ror;

    rol8 U_ROL(.a(a), .shamt(shamt), .y(y_rol));
    ror8 U_ROR(.a(a), .shamt(shamt), .y(y_ror));

    integer i, j;

    initial begin
        $dumpvars(0, tb_rotate);

        for (i = 0; i < 256; i = i + 1) begin
            a = i;
            for (j = 0; j < 8; j = j + 1) begin
                shamt = j;
                #1;
            end
        end

        $finish;
    end

endmodule

