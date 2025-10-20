`timescale 1ns/1ps
module reg8_tb;
  reg [7:0] D;
  reg EN;
  wire [7:0] Q;
  reg8 uut(.D(D), .EN(EN), .Q(Q));
  initial begin
    $dumpvars(0, reg8_tb);
    EN = 0; D = 8'b00000000; #10;
    EN = 1; D = 8'b10101010; #10;
    EN = 0; D = 8'b11111111; #10;
    EN = 1; D = 8'b01010101; #10;
    EN = 0; D = 8'b00000000; #10;
    $finish;
  end
endmodule
