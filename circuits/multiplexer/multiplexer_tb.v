module tb_mux16x8;

    reg [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
    reg [7:0] in8, in9, in10, in11, in12, in13, in14, in15;
    reg [3:0] sel;
    wire [7:0] y;

    mux16x8 uut(
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .in8(in8), .in9(in9), .in10(in10), .in11(in11),
        .in12(in12), .in13(in13), .in14(in14), .in15(in15),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpvars(0, tb_mux16x8);

        in0  = 8'h00; in1  = 8'h11; in2  = 8'h22; in3  = 8'h33;
        in4  = 8'h44; in5  = 8'h55; in6  = 8'h66; in7  = 8'h77;
        in8  = 8'h88; in9  = 8'h99; in10 = 8'hAA; in11 = 8'hBB;
        in12 = 8'hCC; in13 = 8'hDD; in14 = 8'hEE; in15 = 8'hFF;

        sel = 4'b0000; #10;
        sel = 4'b0001; #10;
        sel = 4'b0010; #10;
        sel = 4'b0011; #10;
        sel = 4'b0100; #10;
        sel = 4'b0101; #10;
        sel = 4'b0110; #10;
        sel = 4'b0111; #10;
        sel = 4'b1000; #10;
        sel = 4'b1001; #10;
        sel = 4'b1010; #10;
        sel = 4'b1011; #10;
        sel = 4'b1100; #10;
        sel = 4'b1101; #10;
        sel = 4'b1110; #10;
        sel = 4'b1111; #10;

        $finish;
    end
endmodule

