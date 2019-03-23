module mux2to1(out, sel, in1, in2);
    input in1, in2, sel;
    output out;
    wire not_sel, a1, a2;
    not (not_sel, se1);
    and (a1, sel, in2);
    and (a2, not_sel, in1);
    or (out, a1, a2);
endmodule

module 32b_mux2to1(out, sel, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	input sel;
	genvar j;
	generate for (j = 0; j < 32; j = j+1) begin: mux_loop
	mux2to1 m0(out [j] = )
	