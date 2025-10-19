module half_adder(
  input a,
  input b,
  output sum,
  output carry
);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  wire s1, c1, c2;

  half_adder HA1(.a(a), .b(b), .sum(s1), .carry(c1));
  half_adder HA2(.a(s1), .b(cin), .sum(sum), .carry(c2));

  assign cout = c1 | c2;
endmodule

module adder8(
  input [7:0] a,
  input [7:0] b,
  output [7:0] sum,
  output cout
);
  wire [7:0] c; 

  full_adder FA0(a[0], b[0], 1'b0, sum[0], c[0]);
  full_adder FA1(a[1], b[1], c[0], sum[1], c[1]);
  full_adder FA2(a[2], b[2], c[1], sum[2], c[2]);
  full_adder FA3(a[3], b[3], c[2], sum[3], c[3]);
  full_adder FA4(a[4], b[4], c[3], sum[4], c[4]);
  full_adder FA5(a[5], b[5], c[4], sum[5], c[5]);
  full_adder FA6(a[6], b[6], c[5], sum[6], c[6]);
  full_adder FA7(a[7], b[7], c[6], sum[7], c[7]);

  assign cout = c[7];
endmodule
