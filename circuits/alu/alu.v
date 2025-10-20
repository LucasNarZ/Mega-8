module alu8(
    input [7:0] a,
    input [7:0] b,
    input [3:0] opcode,
    output [7:0] y,
    output cout,
    output bout
);

    wire [7:0] sum, diff, inc, dec;
    wire c_add, b_sub, cout_inc, bout_dec;
    wire [7:0] and_res, or_res, xor_res, not_a, nor_a, xnor_a, nand_a;
    wire [7:0] sll_res, srl_res, sra_res;
    wire [7:0] rol_res, ror_res;

    adder8 U_ADD(a, b, sum, c_add);
    subtr8 U_SUB(a, b, diff, b_sub);
    inc8 U_INC(a, inc, cout_inc);
    dec8 U_DEC(a, dec, bout_dec);

    and8  U_AND(a, b, and_res);
    or8   U_OR(a, b, or_res);
    xor8  U_XOR(a, b, xor_res);
    not8  U_NOT(a, not_a);
    nor8  U_NOR(a, b, nor_a);
    xnor8 U_XNOR(a, b, xnor_a);
    nand8 U_NAND(a, b, nand_a);

    sll8 U_SLL(a, b[2:0], sll_res);
    srl8 U_SRL(a, b[2:0], srl_res);
    sra8 U_SRA(a, b[2:0], sra_res);
    rol8 U_ROL(a, b[2:0], rol_res);
    ror8 U_ROR(a, b[2:0], ror_res);

    wire [7:0] mux_in[15:0];
    assign mux_in[0]  = sum;
    assign mux_in[1]  = diff;
    assign mux_in[2]  = inc;
    assign mux_in[3]  = dec;
    assign mux_in[4]  = and_res;
    assign mux_in[5]  = or_res;
    assign mux_in[6]  = xor_res;
    assign mux_in[7]  = not_a;
    assign mux_in[8]  = nor_a;
    assign mux_in[9]  = xnor_a;
    assign mux_in[10] = nand_a;
    assign mux_in[11] = sll_res;
    assign mux_in[12] = srl_res;
    assign mux_in[13] = sra_res;
    assign mux_in[14] = rol_res;
    assign mux_in[15] = ror_res;

    mux16x8 U_MUX(
        mux_in[0], mux_in[1], mux_in[2], mux_in[3],
        mux_in[4], mux_in[5], mux_in[6], mux_in[7],
        mux_in[8], mux_in[9], mux_in[10], mux_in[11],
        mux_in[12], mux_in[13], mux_in[14], mux_in[15],
        opcode, y
    );

    assign cout = c_add | cout_inc;
    assign bout = b_sub | bout_dec;

endmodule

