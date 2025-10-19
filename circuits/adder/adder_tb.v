module tb_adder;

  reg a, b, cin;
  wire sum_h, carry_h;
  wire sum_f, cout_f;
  reg [7:0] A, B;
  wire [7:0] SUM8;
  wire COUT8;

  half_adder HA(.a(a), .b(b), .sum(sum_h), .carry(carry_h));
  full_adder FA(.a(a), .b(b), .cin(cin), .sum(sum_f), .cout(cout_f));
  adder8 AD8(.a(A), .b(B), .sum(SUM8), .cout(COUT8));

  initial begin
    $dumpfile("build/adder_tb.vcd");
    $dumpvars(0, tb_adder);

    // Test half_adder
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    // Test full_adder
    a = 0; b = 0; cin = 0; #10;
    a = 0; b = 1; cin = 0; #10;
    a = 1; b = 0; cin = 1; #10;
    a = 1; b = 1; cin = 1; #10;

    // Test adder8
    A = 8'b00000000; B = 8'b00000000; #10;
    A = 8'b00001111; B = 8'b00000001; #10;
    A = 8'b11110000; B = 8'b00001111; #10;
    A = 8'b10101010; B = 8'b01010101; #10;
    A = 8'b11111111; B = 8'b00000001; #10;

    $finish;
  end

endmodule

