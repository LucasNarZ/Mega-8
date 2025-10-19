module tb_subtractor;

  reg a, b, bin;
  wire diff_h, borrow_h;
  wire diff_f, borrow_f;
  reg [7:0] A, B;
  wire [7:0] DIFF8;
  wire BOUT8;

  half_subtractor HS(.a(a), .b(b), .diff(diff_h), .borrow(borrow_h));
  full_subtractor FS(.a(a), .b(b), .bin(bin), .diff(diff_f), .borrow_out(borrow_f));
  subtr8 SUB8(.a(A), .b(B), .diff(DIFF8), .bout(BOUT8));

  initial begin
    $dumpfile("build/subtractor_tb.vcd");
    $dumpvars(0, tb_subtractor);

    // Test half_subtractor
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    // Test full_subtractor
    a=0; b=0; bin=0; #10;
    a=0; b=1; bin=0; #10;
    a=1; b=0; bin=1; #10;
    a=1; b=1; bin=1; #10;

    // Test subtr8
    A = 8'b00000000; B = 8'b00000000; #10;
    A = 8'b00001111; B = 8'b00000001; #10;
    A = 8'b11110000; B = 8'b00001111; #10;
    A = 8'b10101010; B = 8'b01010101; #10;
    A = 8'b00000001; B = 8'b11111111; #10;

    $finish;
  end

endmodule
