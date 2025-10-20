module ram_2kb(
  input wire we,           
  input wire re,          
  input wire [10:0] addr,
  input wire [7:0] din, 
  output wire [7:0] dout
);
  reg [7:0] mem [0:2047];  // memória de 2KB
  reg [7:0] data_out;

  always @(*) begin
    if (we) mem[addr] = din;
    if (re) data_out = mem[addr];
  end

  assign dout = (re) ? data_out : 8'bz; 
endmodule

