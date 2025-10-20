module d_ff(
  input D,
  input clk,
  output reg Q
);
  always @(posedge clk) begin
    Q <= D;
  end
endmodule

module reg8(
  input [7:0] D,
  input clk,
  input EN,
  output [7:0] Q
);
  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : bits
      wire d_in;
      assign d_in = EN ? D[i] : Q[i]; 
      d_ff ff(.D(d_in), .clk(clk), .Q(Q[i]));
    end
  endgenerate
endmodule
