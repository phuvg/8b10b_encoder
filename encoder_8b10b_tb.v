`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:13 11/16/2019
// Design Name:   encoder_8b10b
// Module Name:   F:/verilog_work/encoder_8b10b/encoder_8b10b_tb.v
// Project Name:  encoder_8b10b
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder_8b10b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder_8b10b_tb;

	// Inputs
	reg ain;
	reg bin;
	reg cin;
	reg din;
	reg ein;
	reg fin;
	reg gin;
	reg hin;
	reg rin;
	reg is_special;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire i;
	wire f;
	wire g;
	wire h;
	wire j;
    
    reg [10:0]in_data;
    
    reg [3:0]out_3b4b;
    reg [5:0]out_5b6b;
    
    reg [3:0]exp_3b4b;
    reg [5:0]exp_5b6b;

	// Instantiate the Unit Under Test (UUT)
	encoder_8b10b uut (
		.ain(ain), 
		.bin(bin), 
		.cin(cin), 
		.din(din), 
		.ein(ein), 
		.fin(fin), 
		.gin(gin), 
		.hin(hin), 
		.rin(rin), 
		.is_special(is_special), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.i(i), 
		.f(f), 
		.g(g), 
		.h(h), 
		.j(j)
	);
    
    parameter tstep = 50;
    parameter tdelay = 10;

    always @(in_data) begin
		is_special = in_data[9];
        rin = in_data[8];
        ain = in_data[7];
        bin = in_data[6];
        cin = in_data[5];
        din = in_data[4];
        ein = in_data[3];
        fin = in_data[2];
        gin = in_data[1];
        hin = in_data[0];
    end
    
    always @(*) begin
        out_3b4b = {f,g,h,j};
        out_5b6b = {a,b,c,d,e,i};
    end
    
    initial begin
        //initial
        in_data = 11'bz;
        exp_5b6b = 6'bx;
        exp_3b4b = 4'bx;
        
        //delay
        #100;
    
        // Add stimulus here
        #(tstep);
        $display("check 3b4b -- rin = 0");
        in_data = 11'b0_0_00000_000;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1011;
        
        #(tstep);
        in_data = 11'b0_0_00000_100;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1001;
        
        #(tstep);
        in_data = 11'b0_0_00000_010;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b0101;
        
        #(tstep);
        in_data = 11'b0_0_00000_110;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1100;
        
        #(tstep);
        in_data = 11'b0_0_00000_001;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1101;
        
        #(tstep);
        in_data = 11'b0_0_00000_101;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1010;
        
        #(tstep);
        in_data = 11'b0_0_00000_011;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b0110;
        
        #(tstep);
        in_data = 11'b0_0_00000_111;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        $display("check 3b4b -- rin = 1");
        in_data = 11'b0_1_00000_000;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0100;
        
        #(tstep);
        in_data = 11'b0_1_00000_100;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b1001;
        
        #(tstep);
        in_data = 11'b0_1_00000_010;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0101;
        
        #(tstep);
        in_data = 11'b0_1_00000_110;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0011;
        
        #(tstep);
        in_data = 11'b0_1_00000_001;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0010;
        
        #(tstep);
        in_data = 11'b0_1_00000_101;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b1010;
        
        #(tstep);
        in_data = 11'b0_1_00000_011;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0110;
        
        #(tstep);
        in_data = 11'b0_1_00000_111;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        $display("check 5b6b -- rin = 0 -- e = 0");
        in_data = 11'b0_0_00000_111;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10000_111;
        #(tdelay);
        exp_5b6b = 6'b100010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01000_111;
        #(tdelay);
        exp_5b6b = 6'b010010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11000_111;
        #(tdelay);
        exp_5b6b = 6'b110001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00100_111;
        #(tdelay);
        exp_5b6b = 6'b001010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10100_111;
        #(tdelay);
        exp_5b6b = 6'b101001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01100_111;
        #(tdelay);
        exp_5b6b = 6'b011001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11100_111;
        #(tdelay);
        exp_5b6b = 6'b000111;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00010_111;
        #(tdelay);
        exp_5b6b = 6'b000110;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10010_111;
        #(tdelay);
        exp_5b6b = 6'b100101;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01010_111;
        #(tdelay);
        exp_5b6b = 6'b010101;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11010_111;
        #(tdelay);
        exp_5b6b = 6'b110100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00110_111;
        #(tdelay);
        exp_5b6b = 6'b001101;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10110_111;
        #(tdelay);
        exp_5b6b = 6'b101100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01110_111;
        #(tdelay);
        exp_5b6b = 6'b011100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11110_111;
        #(tdelay);
        exp_5b6b = 6'b101000;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        $display("check 5b6b -- rin = 0 -- e = 1");
        in_data = 11'b0_0_00001_111;
        #(tdelay);
        exp_5b6b = 6'b100100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10001_111;
        #(tdelay);
        exp_5b6b = 6'b100011;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01001_111;
        #(tdelay);
        exp_5b6b = 6'b010011;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11001_111;
        #(tdelay);
        exp_5b6b = 6'b110010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00101_111;
        #(tdelay);
        exp_5b6b = 6'b001011;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10101_111;
        #(tdelay);
        exp_5b6b = 6'b101010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01101_111;
        #(tdelay);
        exp_5b6b = 6'b011010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11101_111;
        #(tdelay);
        exp_5b6b = 6'b000101;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00011_111;
        #(tdelay);
        exp_5b6b = 6'b001100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10011_111;
        #(tdelay);
        exp_5b6b = 6'b100110;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01011_111;
        #(tdelay);
        exp_5b6b = 6'b010110;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11011_111;
        #(tdelay);
        exp_5b6b = 6'b101001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_00111_111;
        #(tdelay);
        exp_5b6b = 6'b001110;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_10111_111;
        #(tdelay);
        exp_5b6b = 6'b010001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_01111_111;
        #(tdelay);
        exp_5b6b = 6'b100001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b0_0_11111_111;
        #(tdelay);
        exp_5b6b = 6'b010100;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        $display("check 5b6b -- rin = 1 -- e = 0");
        in_data = 11'b0_1_00000_111;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10000_111;
        #(tdelay);
        exp_5b6b = 6'b011101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01000_111;
        #(tdelay);
        exp_5b6b = 6'b101101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11000_111;
        #(tdelay);
        exp_5b6b = 6'b110001;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00100_111;
        #(tdelay);
        exp_5b6b = 6'b110101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10100_111;
        #(tdelay);
        exp_5b6b = 6'b101001;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01100_111;
        #(tdelay);
        exp_5b6b = 6'b011001;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11100_111;
        #(tdelay);
        exp_5b6b = 6'b111000;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00010_111;
        #(tdelay);
        exp_5b6b = 6'b111001;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10010_111;
        #(tdelay);
        exp_5b6b = 6'b100101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01010_111;
        #(tdelay);
        exp_5b6b = 6'b010101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11010_111;
        #(tdelay);
        exp_5b6b = 6'b110100;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00110_111;
        #(tdelay);
        exp_5b6b = 6'b001101;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10110_111;
        #(tdelay);
        exp_5b6b = 6'b101100;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01110_111;
        #(tdelay);
        exp_5b6b = 6'b011100;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11110_111;
        #(tdelay);
        exp_5b6b = 6'b010111;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        $display("check 5b6b -- rin = 1 -- e = 1");
        in_data = 11'b0_1_00001_111;
        #(tdelay);
        exp_5b6b = 6'b011011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10001_111;
        #(tdelay);
        exp_5b6b = 6'b100011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01001_111;
        #(tdelay);
        exp_5b6b = 6'b010011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11001_111;
        #(tdelay);
        exp_5b6b = 6'b110010;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00101_111;
        #(tdelay);
        exp_5b6b = 6'b001011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10101_111;
        #(tdelay);
        exp_5b6b = 6'b101010;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01101_111;
        #(tdelay);
        exp_5b6b = 6'b011010;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11101_111;
        #(tdelay);
        exp_5b6b = 6'b111010;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00011_111;
        #(tdelay);
        exp_5b6b = 6'b110011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10011_111;
        #(tdelay);
        exp_5b6b = 6'b100110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01011_111;
        #(tdelay);
        exp_5b6b = 6'b010110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11011_111;
        #(tdelay);
        exp_5b6b = 6'b010110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_00111_111;
        #(tdelay);
        exp_5b6b = 6'b001110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_10111_111;
        #(tdelay);
        exp_5b6b = 6'b101110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_01111_111;
        #(tdelay);
        exp_5b6b = 6'b011110;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        in_data = 11'b0_1_11111_111;
        #(tdelay);
        exp_5b6b = 6'b101011;
        exp_3b4b = 4'b0001;
        
        #(tstep);
        $display("check special data - rd = 0");
        in_data = 11'b1_0_00111_000;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b1000;
        
        #(tstep);
        in_data = 11'b1_0_00111_100;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b1001;
        
        #(tstep);
        in_data = 11'b1_0_00111_010;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b0101;
        
        #(tstep);
        in_data = 11'b1_0_00111_110;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b0011;
        
        #(tstep);
        in_data = 11'b1_0_00111_001;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b0010;
        
        #(tstep);
        in_data = 11'b1_0_00111_101;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b1010;
        
        #(tstep);
        in_data = 11'b1_0_00111_011;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b0110;
        
        #(tstep);
        in_data = 11'b1_0_00111_111;
        #(tdelay);
        exp_5b6b = 6'b001111;
        exp_3b4b = 4'b1000;
        
        #(tstep);
        $display("check special data - rd = 1");
        in_data = 11'b1_1_00111_000;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b1011;
        
        #(tstep);
        in_data = 11'b1_1_00111_100;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b0110;
        
        #(tstep);
        in_data = 11'b1_1_00111_010;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b1010;
        
        #(tstep);
        in_data = 11'b1_1_00111_110;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b1100;
        
        #(tstep);
        in_data = 11'b1_1_00111_001;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b1101;
        
        #(tstep);
        in_data = 11'b1_1_00111_101;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b0101;
        
        #(tstep);
        in_data = 11'b1_1_00111_011;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b1001;
        
        #(tstep);
        in_data = 11'b1_1_00111_111;
        #(tdelay);
        exp_5b6b = 6'b110000;
        exp_3b4b = 4'b0111;
        
        #(tstep);
        $display("check non_special");
        in_data = 11'b1_0_00000_001;
        #(tdelay);
        exp_5b6b = 6'b011000;
        exp_3b4b = 4'b1101;
        
        #(tstep);
        in_data = 11'b1_0_01000_111;
        #(tdelay);
        exp_5b6b = 6'b010010;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b1_0_11000_111;
        #(tdelay);
        exp_5b6b = 6'b110001;
        exp_3b4b = 4'b1110;
        
        #(tstep);
        in_data = 11'b1_1_00000_110;
        #(tdelay);
        exp_5b6b = 6'b100111;
        exp_3b4b = 4'b0011;
        
        #(tstep);
        in_data = 11'b1_1_11101_111;
        #(tdelay);
        exp_5b6b = 6'b111010;
        exp_3b4b = 4'b0001;
    end
    
    always @(exp_5b6b or exp_3b4b) begin
        if({out_5b6b,out_3b4b} == {exp_5b6b,exp_3b4b}) begin
            $display("INPUT: Rd = %b ABCDE FGH = %b%b%b%b%b %b%b%b OUTPUT: abcdei fghj = %b%b%b%b%b%b %b%b%b%b EXPECTED: abcdei fghj = %b %b => PASS", rin, ain, bin, cin, din, ein, fin, gin, hin, a, b, c, d, e, i, f, g, h, j, exp_5b6b, exp_3b4b);
        end else begin
            $display("INPUT: Rd = %b ABCDE FGH = %b%b%b%b%b %b%b%b OUTPUT: abcdei fghj = %b%b%b%b%b%b %b%b%b%b EXPECTED: abcdei fghj = %b %b => FAIL", rin, ain, bin, cin, din, ein, fin, gin, hin, a, b, c, d, e, i, f, g, h, j, exp_5b6b, exp_3b4b);
        end
    end
endmodule

