module tb_incdec;

    reg [7:0] a;
    wire [7:0] out_inc, out_dec;
    wire cout, bout;

    inc8 U_INC(.a(a), .out(out_inc), .cout(cout));
    dec8 U_DEC(.a(a), .out(out_dec), .bout(bout));

    initial begin
        $dumpvars(0, tb_incdec);

        a = 8'd0; #10;
        a = 8'd1; #10;
        a = 8'd127; #10;
        a = 8'd128; #10;
        a = 8'd254; #10;
        a = 8'd255; #10;

        $finish;
    end

endmodule

