`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Phu Vuong
// 
// Create Date:    10:46:26 11/16/2019 
// Design Name:
// Module Name:    encoder_8b10b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module encoder_8b10b(
    input ain,
    input bin,
    input cin,
    input din,
    input ein,
    input fin,
    input gin,
    input hin,
    input rin,
    input is_special,
    output a,
    output b,
    output c,
    output d,
    output e,
    output i,
    output f,
    output g,
    output h,
    output j
    );
    
    ///////////////////////////
    //wire - reg - defination//
    ///////////////////////////
    
    //kin detector
    //k28 detector
    wire k28_a;
    wire k28_b;
    wire k28_c;
    wire k28_d;
    wire k28_e;
    wire k28_dtt;
    //kin detector output
    wire kin;
    wire kinb;
    
    //3b4b
    //not
    wire finb;
    wire ginb;
    wire hinb;
    //rp
    wire x3b4b_rp_f;
    wire x3b4b_rp_g;
    wire x3b4b_rp_h;
    wire x3b4b_rp_j;
    //rn
    wire x3b4b_rn_f;
    wire x3b4b_rn_g;
    wire x3b4b_rn_h;
    wire x3b4b_rn_j;
    
    //5b6b
    //not
    wire ainb;
    wire binb;
    wire cinb;
    wire dinb;
    //r+_e0
    wire x5b6b_rp_e0_a;
    wire x5b6b_rp_e0_b;
    wire x5b6b_rp_e0_c;
    wire x5b6b_rp_e0_d;
    wire x5b6b_rp_e0_e;
    wire x5b6b_rp_e0_i;
    //r+_e1
    wire x5b6b_rp_e1_a;
    wire x5b6b_rp_e1_b;
    wire x5b6b_rp_e1_c;
    wire x5b6b_rp_e1_d;
    wire x5b6b_rp_e1_e;
    wire x5b6b_rp_e1_i;
    //r-_e0
    wire x5b6b_rn_e0_a;
    wire x5b6b_rn_e0_b;
    wire x5b6b_rn_e0_c;
    wire x5b6b_rn_e0_d;
    wire x5b6b_rn_e0_e;
    wire x5b6b_rn_e0_i;
    //r-_e1
    wire x5b6b_rn_e1_a;
    wire x5b6b_rn_e1_b;
    wire x5b6b_rn_e1_c;
    wire x5b6b_rn_e1_d;
    wire x5b6b_rn_e1_e;
    wire x5b6b_rn_e1_i;
    //r+
    wire x5b6b_rp_a;
    wire x5b6b_rp_b;
    wire x5b6b_rp_c;
    wire x5b6b_rp_d;
    wire x5b6b_rp_e;
    wire x5b6b_rp_i;
    //r-
    wire x5b6b_rn_a;
    wire x5b6b_rn_b;
    wire x5b6b_rn_c;
    wire x5b6b_rn_d;
    wire x5b6b_rn_e;
    wire x5b6b_rn_i;
    //non_special
    wire x5b6b_non_a;
    wire x5b6b_non_b;
    wire x5b6b_non_c;
    wire x5b6b_non_d;
    wire x5b6b_non_e;
    wire x5b6b_non_i;
    //specical
    wire x5b6b_special_rp_a;
    wire x5b6b_special_rp_b;
    wire x5b6b_special_rp_c;
    wire x5b6b_special_rp_d;
    wire x5b6b_special_rp_e;
    wire x5b6b_special_rp_i;
    
    wire x5b6b_special_rn_a;
    wire x5b6b_special_rn_b;
    wire x5b6b_special_rn_c;
    wire x5b6b_special_rn_d;
    wire x5b6b_special_rn_e;
    wire x5b6b_special_rn_i;
    
    wire x5b6b_special_a;
    wire x5b6b_special_b;
    wire x5b6b_special_c;
    wire x5b6b_special_d;
    wire x5b6b_special_e;
    wire x5b6b_special_i;
    
    
    
    
    ///////////////////////////
    //     circuit design    //
    ///////////////////////////

    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    
    //************************
    //***   kin detector   ***
    //************************
    
    //k28 detector
    assign k28_a = ain ^^~ 1'b0;
    assign k28_b = bin ^^~ 1'b0;
    assign k28_c = cin ^^~ 1'b1;
    assign k28_d = din ^^~ 1'b1;
    assign k28_e = ein ^^~ 1'b1;
    
    assign k28_dtt = k28_a & k28_b & k28_c & k28_d & k28_e;
    
    assign kin = k28_dtt & is_special;
    assign kinb = ~kin;

    /*----------------------------------------------------------*/
    
    
    
    
    
    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    
    //****************
    //***   3b4b   ***
    //****************
    //--> x3b4b
    
    //not assignment
    assign ginb = ~gin;
    assign finb = ~fin;
    assign hinb = ~hin;
    
    //r+ (rp)
    assign x3b4b_rp_f = (kin & finb) | (kinb & ginb & fin) | (kin & hinb & gin);
    assign x3b4b_rp_g = (kin & fin) | (kinb & hinb & finb) | (kinb & gin & finb) | (kin & hin & ginb);
    assign x3b4b_rp_h = (kinb & hin & ginb) | (kinb & hin & finb) | (kin & hinb & ginb) | (kin & hinb & finb) | (kinb & hinb & gin & fin) | (kin & hin & gin & fin);
    assign x3b4b_rp_j = (kin & hin) | (kinb & hinb & fin) | (kinb & hinb & gin) | (kinb & gin & fin) | (kin & ginb & finb);
    
    //r- (rn)
    assign x3b4b_rn_f = (ginb & fin) | (kinb & ginb) | (hinb & ginb) | (kinb & fin) | (hin & fin);
    assign x3b4b_rn_g = (gin & finb) | (kinb & gin) | (kinb & hin & finb);
    assign x3b4b_rn_h = (kin & hin & ginb) | (kinb & hin & fin) | (hin & gin & finb) | (kinb & hinb & ginb & finb) | (kin & hinb & gin & fin);
    assign x3b4b_rn_j = (kinb & ginb & finb) | (kinb & hinb & ginb) | (kin & hinb & fin) | (hinb & gin & finb);
    
    //3b4b output
    assign f = (rin == 1'b1) ? x3b4b_rp_f : x3b4b_rn_f;
    assign g = (rin == 1'b1) ? x3b4b_rp_g : x3b4b_rn_g;
    assign h = (rin == 1'b1) ? x3b4b_rp_h : x3b4b_rn_h;
    assign j = (rin == 1'b1) ? x3b4b_rp_j : x3b4b_rn_j;
        
    /*----------------------------------------------------------*/
    
    
    
    
    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    
    //****************
    //***   5b6b   ***
    //****************
    
    //not assignment
    assign ainb = ~ain;
    assign binb = ~bin;
    assign cinb = ~cin;
    assign dinb = ~din;
    
    //r+_e0
    assign x5b6b_rp_e0_a = (ainb & binb & dinb) | (bin & cinb & dinb) | (ain & cin & dinb) | (ain & binb & din) | (binb & cinb & din) | (ain & cinb & din);
    assign x5b6b_rp_e0_b = (ain & bin) | (bin & din) | (ainb & cin & dinb) | (ainb & cinb & din) | (ain & cinb & dinb);
    assign x5b6b_rp_e0_c = (ain & binb & dinb) | (ain & cin & dinb) | (ainb & bin & dinb) | (binb & cin & din) | (ainb & cin & din) | (ainb & binb & din);
    assign x5b6b_rp_e0_d = (cin & din) | (ain & din) | (ainb & binb & cin) | (binb & cinb & dinb) | (ainb & bin & cinb);
    assign x5b6b_rp_e0_e = (ainb & binb & cinb & dinb) | (ain & bin & cin & din);
    assign x5b6b_rp_e0_i = (cinb & dinb) | (ainb & binb) | (binb & dinb) | (binb & cinb) | (ainb & cinb) | (ainb & dinb) | (ain & bin & cin & din);
    
    //r-_e0
    assign x5b6b_rn_e0_a = (ain & binb) | (ain & din) | (ain & cinb);
    assign x5b6b_rn_e0_b = (ainb & bin) | (bin & cinb) | (ainb & cinb & dinb);
    assign x5b6b_rn_e0_c = (cin & din) | (binb & cin) | (ainb & cin) | (ainb & binb & dinb);
    assign x5b6b_rn_e0_d = (cinb & din) | (binb & din) | (ainb & bin & din) | (ain & bin & cin & dinb);
    assign x5b6b_rn_e0_e = (ainb & binb & cin & dinb) | (ainb & binb & cinb & din) | (ain & binb & cinb & dinb) | (ain & bin & cin & dinb) | (ainb & bin & cinb & dinb);
    assign x5b6b_rn_e0_i = (ain & bin & dinb) | (ain & cin & dinb) | (bin & cin & dinb) | (ain & binb & cinb & din) | (ainb & bin & cinb & din) | (ainb & binb & cin & din);
        
    //r+_e1
    assign x5b6b_rp_e1_a = (ain & dinb) | (ain & cin) | (binb & cinb & din);
    assign x5b6b_rp_e1_b = (ainb & bin) | (bin & dinb) | (ainb & cinb) | (bin & cinb & din);
    assign x5b6b_rp_e1_c = cin | (ainb & binb & dinb);
    assign x5b6b_rp_e1_d = (binb & cin & din) | (ain & cinb & din) | (ainb & bin & din);
    assign x5b6b_rp_e1_e = 1'b1;
    assign x5b6b_rp_e1_i = (ainb & binb & dinb) | (binb & cinb & dinb) | (ainb & cinb & dinb) | (ainb & binb & cinb) | (ain & bin & cin & din);
    
    //r-_e1
    assign x5b6b_rn_e1_a = (binb & cinb & dinb) | (ain & cinb & dinb) | (ain & binb & dinb) | (ain & cinb & din) | (ainb & bin & cin & din);
    assign x5b6b_rn_e1_b = (ain & cin & din) | (bin & cinb & dinb) | (ainb & bin & dinb) | (ainb & bin & cinb);
    assign x5b6b_rn_e1_c = (ainb & binb & din) | (binb & cin & dinb) | (ainb & cin & dinb) | (ain & bin & cinb & din);
    assign x5b6b_rn_e1_d = (ain & bin & cin) | (ainb & binb & din) | (ainb & binb & cinb) | (binb & cinb & din) | (ainb & cinb & din);
    assign x5b6b_rn_e1_e = (ainb & binb & cin) | (ain & binb & dinb) | (bin & cinb & dinb) | (ainb & bin & dinb) | (ainb & bin & cinb) | (ain & binb & cinb);
    assign x5b6b_rn_e1_i = (ainb & binb & cin & dinb) | (ain & binb & cinb & dinb) | (ain & binb & cin & din) | (ain & bin & cin & dinb) | (ain & bin & cinb & din) | (ainb & bin & cinb & dinb) | (ainb & bin & cin & din);
    
    //r+
    assign x5b6b_rp_a = (ein == 1'b1) ? x5b6b_rp_e1_a : x5b6b_rp_e0_a;
    assign x5b6b_rp_b = (ein == 1'b1) ? x5b6b_rp_e1_b : x5b6b_rp_e0_b;
    assign x5b6b_rp_c = (ein == 1'b1) ? x5b6b_rp_e1_c : x5b6b_rp_e0_c;
    assign x5b6b_rp_d = (ein == 1'b1) ? x5b6b_rp_e1_d : x5b6b_rp_e0_d;
    assign x5b6b_rp_e = (ein == 1'b1) ? x5b6b_rp_e1_e : x5b6b_rp_e0_e;
    assign x5b6b_rp_i = (ein == 1'b1) ? x5b6b_rp_e1_i : x5b6b_rp_e0_i;
    
    //r-
    assign x5b6b_rn_a = (ein == 1'b1) ? x5b6b_rn_e1_a : x5b6b_rn_e0_a;
    assign x5b6b_rn_b = (ein == 1'b1) ? x5b6b_rn_e1_b : x5b6b_rn_e0_b;
    assign x5b6b_rn_c = (ein == 1'b1) ? x5b6b_rn_e1_c : x5b6b_rn_e0_c;
    assign x5b6b_rn_d = (ein == 1'b1) ? x5b6b_rn_e1_d : x5b6b_rn_e0_d;
    assign x5b6b_rn_e = (ein == 1'b1) ? x5b6b_rn_e1_e : x5b6b_rn_e0_e;
    assign x5b6b_rn_i = (ein == 1'b1) ? x5b6b_rn_e1_i : x5b6b_rn_e0_i;
    
    //non_special
    assign x5b6b_non_a = (rin == 1'b1) ? x5b6b_rp_a : x5b6b_rn_a;
    assign x5b6b_non_b = (rin == 1'b1) ? x5b6b_rp_b : x5b6b_rn_b;
    assign x5b6b_non_c = (rin == 1'b1) ? x5b6b_rp_c : x5b6b_rn_c;
    assign x5b6b_non_d = (rin == 1'b1) ? x5b6b_rp_d : x5b6b_rn_d;
    assign x5b6b_non_e = (rin == 1'b1) ? x5b6b_rp_e : x5b6b_rn_e;
    assign x5b6b_non_i = (rin == 1'b1) ? x5b6b_rp_i : x5b6b_rn_i;
    
    //special
    assign x5b6b_special_rp_a = 1'b1;
    assign x5b6b_special_rp_b = 1'b1;
    assign x5b6b_special_rp_c = 1'b0;
    assign x5b6b_special_rp_d = 1'b0;
    assign x5b6b_special_rp_e = 1'b0;
    assign x5b6b_special_rp_i = 1'b0;
    
    assign x5b6b_special_rn_a = 1'b0;
    assign x5b6b_special_rn_b = 1'b0;
    assign x5b6b_special_rn_c = 1'b1;
    assign x5b6b_special_rn_d = 1'b1;
    assign x5b6b_special_rn_e = 1'b1;
    assign x5b6b_special_rn_i = 1'b1;
    
    assign x5b6b_special_a = (rin == 1'b1) ? x5b6b_special_rp_a : x5b6b_special_rn_a;
    assign x5b6b_special_b = (rin == 1'b1) ? x5b6b_special_rp_b : x5b6b_special_rn_b;
    assign x5b6b_special_c = (rin == 1'b1) ? x5b6b_special_rp_c : x5b6b_special_rn_c;
    assign x5b6b_special_d = (rin == 1'b1) ? x5b6b_special_rp_d : x5b6b_special_rn_d;
    assign x5b6b_special_e = (rin == 1'b1) ? x5b6b_special_rp_e : x5b6b_special_rn_e;
    assign x5b6b_special_i = (rin == 1'b1) ? x5b6b_special_rp_i : x5b6b_special_rn_i;
    
    //5b6b output
    assign a = (kin == 1'b1) ? x5b6b_special_a : x5b6b_non_a;
    assign b = (kin == 1'b1) ? x5b6b_special_b : x5b6b_non_b;
    assign c = (kin == 1'b1) ? x5b6b_special_c : x5b6b_non_c;
    assign d = (kin == 1'b1) ? x5b6b_special_d : x5b6b_non_d;
    assign e = (kin == 1'b1) ? x5b6b_special_e : x5b6b_non_e;
    assign i = (kin == 1'b1) ? x5b6b_special_i : x5b6b_non_i;
    
    /*----------------------------------------------------------*/

endmodule
