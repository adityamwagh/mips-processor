module mux2to1(out, sel, in1, in2);
    input in1, in2, sel;
    output out;
    wire not_sel, a1, a2;
    not (not_sel, se1);
    and (a1, sel, in2);
    and (a2, not_sel, in1);
    or (out, a1, a2);
endmodule

module bit8_2to1mux(out, sel, in1, in2);
    input [7:0] in1, in2;
    output [7:0] out;
    input sel;
    /* We can use genvar and generate block and a for 
    loop for the following statements

    genvar j;
    // This is the variable that is to be used in the generate 
    // block
    generate for (j = 0; j<8; j = j+1) begin: mux_loop
    //mux_loop is the name of the loop
    mux2to1 m1 (out[j], sel, in1[j], in2[j]);
    // mux2to1 is instanciated everytime it is called
    
    */

    mux2to1 m0(out[0], sel, in1[0], in2[0]);
    mux2to1 m1(out[1], sel, in1[1], in2[1]);
    mux2to1 m2(out[2], sel, in1[2], in2[2]);
    mux2to1 m3(out[3], sel, in1[3], in2[3]);
    mux2to1 m4(out[4], sel, in1[4], in2[4]);
    mux2to1 m5(out[5], sel, in1[5], in2[5]);
    mux2to1 m6(out[6], sel, in1[6], in2[6]);
    mux2to1 m7(out[7], sel, in1[7], in2[7]);
    
    //end iverilog
    //endgenerate
endmodule

module tb_8bit2to1mux;
    reg [7:0] INP1, INP2;
    reg SEL;
    wire [7:0] out;
    bit8_2to1mux M1 (out, SEL, INP1, INP2);
    initial
    begin
      INP1=8'b10101010;
      INP2=8'b01010101;
      SEL=1'b0;
      #100 SEL=1'b1;
      #1000 $finish;
    end
endmodule

