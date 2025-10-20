// Receive 16 8 bits inputs and a 4 bits for selection (16 operations max)
module mux16x8(
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    input [7:0] in5,
    input [7:0] in6,
    input [7:0] in7,
    input [7:0] in8,
    input [7:0] in9,
    input [7:0] in10,
    input [7:0] in11,
    input [7:0] in12,
    input [7:0] in13,
    input [7:0] in14,
    input [7:0] in15,
    input [3:0] sel,
    output [7:0] y
);
    wire [3:0] s_n;
    assign s_n = ~sel;

    assign y = (in0  & {8{s_n[3]&s_n[2]&s_n[1]&s_n[0]}}) |
               (in1  & {8{s_n[3]&s_n[2]&s_n[1]&sel[0]}}) |
               (in2  & {8{s_n[3]&s_n[2]&sel[1]&s_n[0]}}) |
               (in3  & {8{s_n[3]&s_n[2]&sel[1]&sel[0]}}) |
               (in4  & {8{s_n[3]&sel[2]&s_n[1]&s_n[0]}}) |
               (in5  & {8{s_n[3]&sel[2]&s_n[1]&sel[0]}}) |
               (in6  & {8{s_n[3]&sel[2]&sel[1]&s_n[0]}}) |
               (in7  & {8{s_n[3]&sel[2]&sel[1]&sel[0]}}) |
               (in8  & {8{sel[3]&s_n[2]&s_n[1]&s_n[0]}}) |
               (in9  & {8{sel[3]&s_n[2]&s_n[1]&sel[0]}}) |
               (in10 & {8{sel[3]&s_n[2]&sel[1]&s_n[0]}}) |
               (in11 & {8{sel[3]&s_n[2]&sel[1]&sel[0]}}) |
               (in12 & {8{sel[3]&sel[2]&s_n[1]&s_n[0]}}) |
               (in13 & {8{sel[3]&sel[2]&s_n[1]&sel[0]}}) |
               (in14 & {8{sel[3]&sel[2]&sel[1]&s_n[0]}}) |
               (in15 & {8{sel[3]&sel[2]&sel[1]&sel[0]}});

endmodule
