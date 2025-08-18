module CHIP(

    
    //input
    input wire clk, 
    input wire rst_n, 
    input wire en, 
    input wire [2:0] Mode,

    input wire signed [17:0] i_re_h, 
    input wire signed [17:0] i_im_h, 
    input wire signed [17:0] i_re_u, 
    input wire signed [17:0] i_im_u,

    input wire signed [18:0] i_N0_2,

    //output
    output reg signed [18:0]    o_LLR_0,
    output reg signed [18:0]    o_LLR_1,
    output reg signed [18:0]    o_LLR_2,
    output reg signed [18:0]    o_LLR_3,
    output reg signed [18:0]    o_LLR_4,
    output reg signed [18:0]    o_LLR_5,

    output wire valid

);

parameter wordlength = 18;
parameter LLR_wordlength = 19;
parameter fraction = 10;
parameter sym_num = 64;
parameter bit_num = 6;

//===============================================================//
// Wire & Reg                                                    //
//===============================================================//

//CPE
reg signed [wordlength-1:0] r_re_h; 
reg signed [wordlength-1:0] r_im_h;
reg signed [wordlength-1:0] r_re_u;
reg signed [wordlength-1:0] r_im_u;

wire signed [wordlength-1:0] w_h;
wire signed [wordlength-1:0] w_u_re;
wire signed [wordlength-1:0] w_u_im;
wire signed [wordlength-1:0] w_phase;

//MCU
wire signed [wordlength-1:0] LUT_real [0:sym_num-1];
wire signed [wordlength-1:0] LUT_imag [0:sym_num-1];
wire signed [wordlength-1:0] metric [0:sym_num-1];

//MC
wire signed [wordlength-1:0] w_metric_0_0;
wire signed [wordlength-1:0] w_metric_0_1;

wire signed [wordlength-1:0] w_metric_1_0;
wire signed [wordlength-1:0] w_metric_1_1;

wire signed [wordlength-1:0] w_metric_2_0;
wire signed [wordlength-1:0] w_metric_2_1;

wire signed [wordlength-1:0] w_metric_3_0;
wire signed [wordlength-1:0] w_metric_3_1;

wire signed [wordlength-1:0] w_metric_4_0;
wire signed [wordlength-1:0] w_metric_4_1;

wire signed [wordlength-1:0] w_metric_5_0;
wire signed [wordlength-1:0] w_metric_5_1;

//LLR
wire signed [wordlength-1:0] LLR_temp [0:bit_num-1];
reg signed [LLR_wordlength-1:0] N0_2;
reg signed [LLR_wordlength-1:0] r_N0_2 [0:7];
wire signed [LLR_wordlength + wordlength-1:0] LLR_mul [0:bit_num-1];
wire signed [LLR_wordlength-1:0] LLR [0:bit_num-1];

wire signed [18:0]    w_LLR_0;
wire signed [18:0]    w_LLR_1;
wire signed [18:0]    w_LLR_2;
wire signed [18:0]    w_LLR_3;
wire signed [18:0]    w_LLR_4;
wire signed [18:0]    w_LLR_5;

//====================================================================//
// CPE                                                                //
//====================================================================//

//Input Reg
always @(posedge clk) begin

    if (!rst_n) begin
        r_re_h <= 18'b0;
        r_im_h <= 18'b0;
        r_re_u <= 18'b0;
        r_im_u <= 18'b0;
    end
    else begin
        r_re_h <= i_re_h;
        r_im_h <= i_im_h;
        r_re_u <= i_re_u;
        r_im_u <= i_im_u;
    end

end

CPE CPE_1(

    //input
    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 
    .re_hi(r_re_h), 
    .im_hi(r_im_h), 
    .re_ui(r_re_u), 
    .im_ui(r_im_u), 

    //output
    .valid(valid), 
    .h_o(w_h), 
    .u_re_o(w_u_re), 
    .u_im_o(w_u_im), 
    .phase_o(w_phase)

);

//====================================================================//
// Constellation table                                                //
//====================================================================//
const_table cs1(

		Mode,
		LUT_real[0], LUT_real[1], LUT_real[2], LUT_real[3], LUT_real[4], LUT_real[5], LUT_real[6], LUT_real[7], LUT_real[8], LUT_real[9], 
		LUT_real[10], LUT_real[11], LUT_real[12], LUT_real[13], LUT_real[14], LUT_real[15], LUT_real[16], LUT_real[17], LUT_real[18], LUT_real[19], 
		LUT_real[20], LUT_real[21], LUT_real[22], LUT_real[23], LUT_real[24], LUT_real[25], LUT_real[26], LUT_real[27], LUT_real[28], LUT_real[29], 
		LUT_real[30], LUT_real[31], LUT_real[32], LUT_real[33], LUT_real[34], LUT_real[35], LUT_real[36], LUT_real[37], LUT_real[38], LUT_real[39], 
		LUT_real[40], LUT_real[41], LUT_real[42], LUT_real[43], LUT_real[44], LUT_real[45], LUT_real[46], LUT_real[47], LUT_real[48], LUT_real[49], 
		LUT_real[50], LUT_real[51], LUT_real[52], LUT_real[53], LUT_real[54], LUT_real[55], LUT_real[56], LUT_real[57], LUT_real[58], LUT_real[59], 
		LUT_real[60], LUT_real[61], LUT_real[62], LUT_real[63],

		LUT_imag[0], LUT_imag[1], LUT_imag[2], LUT_imag[3], LUT_imag[4], LUT_imag[5], LUT_imag[6], LUT_imag[7], LUT_imag[8], LUT_imag[9], 
		LUT_imag[10], LUT_imag[11], LUT_imag[12], LUT_imag[13], LUT_imag[14], LUT_imag[15], LUT_imag[16], LUT_imag[17], LUT_imag[18], LUT_imag[19], 
		LUT_imag[20], LUT_imag[21], LUT_imag[22], LUT_imag[23], LUT_imag[24], LUT_imag[25], LUT_imag[26], LUT_imag[27], LUT_imag[28], LUT_imag[29], 
		LUT_imag[30], LUT_imag[31], LUT_imag[32], LUT_imag[33], LUT_imag[34], LUT_imag[35], LUT_imag[36], LUT_imag[37], LUT_imag[38], LUT_imag[39], 
		LUT_imag[40], LUT_imag[41], LUT_imag[42], LUT_imag[43], LUT_imag[44], LUT_imag[45], LUT_imag[46], LUT_imag[47], LUT_imag[48], LUT_imag[49], 
		LUT_imag[50], LUT_imag[51], LUT_imag[52], LUT_imag[53], LUT_imag[54], LUT_imag[55], LUT_imag[56], LUT_imag[57], LUT_imag[58], LUT_imag[59], 
		LUT_imag[60], LUT_imag[61], LUT_imag[62], LUT_imag[63]
	
);

//================================================================================//
// MCU                                                                            //
//================================================================================//
MMCU mm1(

	clk, rst_n,
	w_u_re, w_u_im,
	w_h,
	LUT_real[0], LUT_real[1], LUT_real[2], LUT_real[3], LUT_real[4], LUT_real[5], LUT_real[6], LUT_real[7], LUT_real[8], LUT_real[9], 
	LUT_real[10], LUT_real[11], LUT_real[12], LUT_real[13], LUT_real[14], LUT_real[15], LUT_real[16], LUT_real[17], LUT_real[18], LUT_real[19], 
	LUT_real[20], LUT_real[21], LUT_real[22], LUT_real[23], LUT_real[24], LUT_real[25], LUT_real[26], LUT_real[27], LUT_real[28], LUT_real[29], 
	LUT_real[30], LUT_real[31], LUT_real[32], LUT_real[33], LUT_real[34], LUT_real[35], LUT_real[36], LUT_real[37], LUT_real[38], LUT_real[39], 
	LUT_real[40], LUT_real[41], LUT_real[42], LUT_real[43], LUT_real[44], LUT_real[45], LUT_real[46], LUT_real[47], LUT_real[48], LUT_real[49], 
	LUT_real[50], LUT_real[51], LUT_real[52], LUT_real[53], LUT_real[54], LUT_real[55], LUT_real[56], LUT_real[57], LUT_real[58], LUT_real[59], 
	LUT_real[60], LUT_real[61], LUT_real[62], LUT_real[63],

	LUT_imag[0], LUT_imag[1], LUT_imag[2], LUT_imag[3], LUT_imag[4], LUT_imag[5], LUT_imag[6], LUT_imag[7], LUT_imag[8], LUT_imag[9], 
	LUT_imag[10], LUT_imag[11], LUT_imag[12], LUT_imag[13], LUT_imag[14], LUT_imag[15], LUT_imag[16], LUT_imag[17], LUT_imag[18], LUT_imag[19], 
	LUT_imag[20], LUT_imag[21], LUT_imag[22], LUT_imag[23], LUT_imag[24], LUT_imag[25], LUT_imag[26], LUT_imag[27], LUT_imag[28], LUT_imag[29], 
	LUT_imag[30], LUT_imag[31], LUT_imag[32], LUT_imag[33], LUT_imag[34], LUT_imag[35], LUT_imag[36], LUT_imag[37], LUT_imag[38], LUT_imag[39], 
	LUT_imag[40], LUT_imag[41], LUT_imag[42], LUT_imag[43], LUT_imag[44], LUT_imag[45], LUT_imag[46], LUT_imag[47], LUT_imag[48], LUT_imag[49], 
	LUT_imag[50], LUT_imag[51], LUT_imag[52], LUT_imag[53], LUT_imag[54], LUT_imag[55], LUT_imag[56], LUT_imag[57], LUT_imag[58], LUT_imag[59], 
	LUT_imag[60], LUT_imag[61], LUT_imag[62], LUT_imag[63],

	metric[0], metric[1], metric[2], metric[3], metric[4], metric[5], metric[6], metric[7], metric[8], metric[9], 
	metric[10], metric[11], metric[12], metric[13], metric[14], metric[15], metric[16], metric[17], metric[18], metric[19], 
	metric[20], metric[21], metric[22], metric[23], metric[24], metric[25], metric[26], metric[27], metric[28], metric[29], 
	metric[30], metric[31], metric[32], metric[33], metric[34], metric[35], metric[36], metric[37], metric[38], metric[39], 
	metric[40], metric[41], metric[42], metric[43], metric[44], metric[45], metric[46], metric[47], metric[48], metric[49], 
	metric[50], metric[51], metric[52], metric[53], metric[54], metric[55], metric[56], metric[57], metric[58], metric[59], 
	metric[60], metric[61], metric[62], metric[63],

	en1, en2, en3, en4, en5

);



//=====================================================================================//
// Find Min Metric                                                                     //
//=====================================================================================//

//bit 0
MC S0_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[14]),.i_metric_2(metric[15]),.i_metric_3(metric[13]),.i_metric_4(metric[28]),.i_metric_5(metric[30]),.i_metric_6(metric[31]),.i_metric_7(metric[29]),.i_metric_8(metric[24]),.i_metric_9(metric[26]),
    .i_metric_10(metric[27]),.i_metric_11(metric[25]),.i_metric_12(metric[8]),.i_metric_13(metric[0]),.i_metric_14(metric[16]),.i_metric_15(metric[20]),.i_metric_16(metric[4]),.i_metric_17(metric[6]),.i_metric_18(metric[22]),.i_metric_19(metric[18]),
    .i_metric_20(metric[2]),.i_metric_21(metric[10]),.i_metric_22(metric[11]),.i_metric_23(metric[3]),.i_metric_24(metric[19]),.i_metric_25(metric[23]),.i_metric_26(metric[7]),.i_metric_27(metric[5]),.i_metric_28(metric[21]),.i_metric_29(metric[17]),
    .i_metric_30(metric[1]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_0_0)

);

MC S0_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[60]),.i_metric_1(metric[44]),.i_metric_2(metric[46]),.i_metric_3(metric[62]),.i_metric_4(metric[63]),.i_metric_5(metric[47]),.i_metric_6(metric[45]),.i_metric_7(metric[61]),.i_metric_8(metric[56]),.i_metric_9(metric[48]),
    .i_metric_10(metric[52]),.i_metric_11(metric[36]),.i_metric_12(metric[38]),.i_metric_13(metric[54]),.i_metric_14(metric[50]),.i_metric_15(metric[58]),.i_metric_16(metric[59]),.i_metric_17(metric[51]),.i_metric_18(metric[55]),.i_metric_19(metric[39]),
    .i_metric_20(metric[37]),.i_metric_21(metric[53]),.i_metric_22(metric[49]),.i_metric_23(metric[57]),.i_metric_24(metric[40]),.i_metric_25(metric[32]),.i_metric_26(metric[34]),.i_metric_27(metric[42]),.i_metric_28(metric[43]),.i_metric_29(metric[35]),
    .i_metric_30(metric[33]),.i_metric_31(metric[41]),

    //output metric
    .o_metric(w_metric_0_1)

);

//bit1
MC S1_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[14]),.i_metric_2(metric[15]),.i_metric_3(metric[13]),.i_metric_4(metric[44]),.i_metric_5(metric[46]),.i_metric_6(metric[47]),.i_metric_7(metric[45]),.i_metric_8(metric[36]),.i_metric_9(metric[38]),
    .i_metric_10(metric[39]),.i_metric_11(metric[37]),.i_metric_12(metric[8]),.i_metric_13(metric[40]),.i_metric_14(metric[32]),.i_metric_15(metric[0]),.i_metric_16(metric[4]),.i_metric_17(metric[6]),.i_metric_18(metric[2]),.i_metric_19(metric[34]),
    .i_metric_20(metric[42]),.i_metric_21(metric[10]),.i_metric_22(metric[11]),.i_metric_23(metric[43]),.i_metric_24(metric[35]),.i_metric_25(metric[3]),.i_metric_26(metric[7]),.i_metric_27(metric[5]),.i_metric_28(metric[1]),.i_metric_29(metric[33]),
    .i_metric_30(metric[41]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_1_0)

);

MC S1_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[28]),.i_metric_1(metric[60]),.i_metric_2(metric[62]),.i_metric_3(metric[30]),.i_metric_4(metric[31]),.i_metric_5(metric[63]),.i_metric_6(metric[61]),.i_metric_7(metric[29]),.i_metric_8(metric[24]),.i_metric_9(metric[56]),
    .i_metric_10(metric[48]),.i_metric_11(metric[52]),.i_metric_12(metric[54]),.i_metric_13(metric[50]),.i_metric_14(metric[58]),.i_metric_15(metric[26]),.i_metric_16(metric[27]),.i_metric_17(metric[59]),.i_metric_18(metric[51]),.i_metric_19(metric[55]),
    .i_metric_20(metric[53]),.i_metric_21(metric[49]),.i_metric_22(metric[57]),.i_metric_23(metric[25]),.i_metric_24(metric[16]),.i_metric_25(metric[20]),.i_metric_26(metric[22]),.i_metric_27(metric[18]),.i_metric_28(metric[19]),.i_metric_29(metric[23]),
    .i_metric_30(metric[21]),.i_metric_31(metric[17]),

    //output metric
    .o_metric(w_metric_1_1)

);

//bit2
MC S2_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[48]),.i_metric_1(metric[52]),.i_metric_2(metric[36]),.i_metric_3(metric[38]),.i_metric_4(metric[54]),.i_metric_5(metric[50]),.i_metric_6(metric[51]),.i_metric_7(metric[55]),.i_metric_8(metric[39]),.i_metric_9(metric[37]),
    .i_metric_10(metric[53]),.i_metric_11(metric[49]),.i_metric_12(metric[32]),.i_metric_13(metric[0]),.i_metric_14(metric[16]),.i_metric_15(metric[20]),.i_metric_16(metric[4]),.i_metric_17(metric[6]),.i_metric_18(metric[22]),.i_metric_19(metric[18]),
    .i_metric_20(metric[2]),.i_metric_21(metric[34]),.i_metric_22(metric[35]),.i_metric_23(metric[3]),.i_metric_24(metric[19]),.i_metric_25(metric[23]),.i_metric_26(metric[7]),.i_metric_27(metric[5]),.i_metric_28(metric[21]),.i_metric_29(metric[17]),
    .i_metric_30(metric[1]),.i_metric_31(metric[33]),

    //output metric
    .o_metric(w_metric_2_0)

);

MC S2_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[14]),.i_metric_2(metric[15]),.i_metric_3(metric[13]),.i_metric_4(metric[28]),.i_metric_5(metric[60]),.i_metric_6(metric[44]),.i_metric_7(metric[46]),.i_metric_8(metric[62]),.i_metric_9(metric[30]),
    .i_metric_10(metric[31]),.i_metric_11(metric[63]),.i_metric_12(metric[47]),.i_metric_13(metric[45]),.i_metric_14(metric[61]),.i_metric_15(metric[29]),.i_metric_16(metric[24]),.i_metric_17(metric[56]),.i_metric_18(metric[58]),.i_metric_19(metric[26]),
    .i_metric_20(metric[27]),.i_metric_21(metric[59]),.i_metric_22(metric[57]),.i_metric_23(metric[25]),.i_metric_24(metric[8]),.i_metric_25(metric[40]),.i_metric_26(metric[42]),.i_metric_27(metric[10]),.i_metric_28(metric[11]),.i_metric_29(metric[43]),
    .i_metric_30(metric[41]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_2_1)

);

//bit3
MC S3_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[24]),.i_metric_1(metric[56]),.i_metric_2(metric[48]),.i_metric_3(metric[50]),.i_metric_4(metric[58]),.i_metric_5(metric[26]),.i_metric_6(metric[27]),.i_metric_7(metric[59]),.i_metric_8(metric[51]),.i_metric_9(metric[49]),
    .i_metric_10(metric[57]),.i_metric_11(metric[25]),.i_metric_12(metric[8]),.i_metric_13(metric[40]),.i_metric_14(metric[32]),.i_metric_15(metric[0]),.i_metric_16(metric[16]),.i_metric_17(metric[18]),.i_metric_18(metric[2]),.i_metric_19(metric[34]),
    .i_metric_20(metric[42]),.i_metric_21(metric[10]),.i_metric_22(metric[11]),.i_metric_23(metric[43]),.i_metric_24(metric[35]),.i_metric_25(metric[3]),.i_metric_26(metric[19]),.i_metric_27(metric[17]),.i_metric_28(metric[1]),.i_metric_29(metric[33]),
    .i_metric_30(metric[41]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_3_0)

);

MC S3_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[14]),.i_metric_2(metric[15]),.i_metric_3(metric[13]),.i_metric_4(metric[28]),.i_metric_5(metric[60]),.i_metric_6(metric[44]),.i_metric_7(metric[46]),.i_metric_8(metric[62]),.i_metric_9(metric[30]),
    .i_metric_10(metric[31]),.i_metric_11(metric[63]),.i_metric_12(metric[47]),.i_metric_13(metric[45]),.i_metric_14(metric[61]),.i_metric_15(metric[29]),.i_metric_16(metric[52]),.i_metric_17(metric[36]),.i_metric_18(metric[38]),.i_metric_19(metric[54]),
    .i_metric_20(metric[55]),.i_metric_21(metric[39]),.i_metric_22(metric[37]),.i_metric_23(metric[53]),.i_metric_24(metric[20]),.i_metric_25(metric[4]),.i_metric_26(metric[6]),.i_metric_27(metric[22]),.i_metric_28(metric[23]),.i_metric_29(metric[7]),
    .i_metric_30(metric[5]),.i_metric_31(metric[21]),

    //output metric
    .o_metric(w_metric_3_1)

);

//bit4
MC S4_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[13]),.i_metric_2(metric[28]),.i_metric_3(metric[60]),.i_metric_4(metric[44]),.i_metric_5(metric[45]),.i_metric_6(metric[61]),.i_metric_7(metric[29]),.i_metric_8(metric[24]),.i_metric_9(metric[56]),
    .i_metric_10(metric[48]),.i_metric_11(metric[52]),.i_metric_12(metric[36]),.i_metric_13(metric[37]),.i_metric_14(metric[53]),.i_metric_15(metric[49]),.i_metric_16(metric[57]),.i_metric_17(metric[25]),.i_metric_18(metric[8]),.i_metric_19(metric[40]),
    .i_metric_20(metric[32]),.i_metric_21(metric[0]),.i_metric_22(metric[16]),.i_metric_23(metric[20]),.i_metric_24(metric[4]),.i_metric_25(metric[5]),.i_metric_26(metric[21]),.i_metric_27(metric[17]),.i_metric_28(metric[1]),.i_metric_29(metric[33]),
    .i_metric_30(metric[41]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_4_0)

);

MC S4_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[14]),.i_metric_1(metric[15]),.i_metric_2(metric[46]),.i_metric_3(metric[62]),.i_metric_4(metric[30]),.i_metric_5(metric[31]),.i_metric_6(metric[63]),.i_metric_7(metric[47]),.i_metric_8(metric[38]),.i_metric_9(metric[54]),
    .i_metric_10(metric[50]),.i_metric_11(metric[58]),.i_metric_12(metric[26]),.i_metric_13(metric[27]),.i_metric_14(metric[59]),.i_metric_15(metric[51]),.i_metric_16(metric[55]),.i_metric_17(metric[39]),.i_metric_18(metric[6]),.i_metric_19(metric[22]),
    .i_metric_20(metric[18]),.i_metric_21(metric[2]),.i_metric_22(metric[34]),.i_metric_23(metric[42]),.i_metric_24(metric[10]),.i_metric_25(metric[11]),.i_metric_26(metric[43]),.i_metric_27(metric[35]),.i_metric_28(metric[3]),.i_metric_29(metric[19]),
    .i_metric_30(metric[23]),.i_metric_31(metric[7]),

    //output metric
    .o_metric(w_metric_4_1)

);

//bit5
MC S5_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[12]),.i_metric_1(metric[14]),.i_metric_2(metric[28]),.i_metric_3(metric[60]),.i_metric_4(metric[44]),.i_metric_5(metric[46]),.i_metric_6(metric[62]),.i_metric_7(metric[30]),.i_metric_8(metric[24]),.i_metric_9(metric[56]),
    .i_metric_10(metric[48]),.i_metric_11(metric[52]),.i_metric_12(metric[36]),.i_metric_13(metric[38]),.i_metric_14(metric[54]),.i_metric_15(metric[50]),.i_metric_16(metric[58]),.i_metric_17(metric[26]),.i_metric_18(metric[8]),.i_metric_19(metric[40]),
    .i_metric_20(metric[32]),.i_metric_21(metric[0]),.i_metric_22(metric[16]),.i_metric_23(metric[20]),.i_metric_24(metric[4]),.i_metric_25(metric[6]),.i_metric_26(metric[22]),.i_metric_27(metric[18]),.i_metric_28(metric[2]),.i_metric_29(metric[34]),
    .i_metric_30(metric[42]),.i_metric_31(metric[10]),

    //output metric
    .o_metric(w_metric_5_0)

);

MC S5_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric[15]),.i_metric_1(metric[13]),.i_metric_2(metric[31]),.i_metric_3(metric[63]),.i_metric_4(metric[47]),.i_metric_5(metric[45]),.i_metric_6(metric[61]),.i_metric_7(metric[29]),.i_metric_8(metric[27]),.i_metric_9(metric[59]),
    .i_metric_10(metric[51]),.i_metric_11(metric[55]),.i_metric_12(metric[39]),.i_metric_13(metric[37]),.i_metric_14(metric[53]),.i_metric_15(metric[49]),.i_metric_16(metric[57]),.i_metric_17(metric[25]),.i_metric_18(metric[11]),.i_metric_19(metric[43]),
    .i_metric_20(metric[35]),.i_metric_21(metric[3]),.i_metric_22(metric[19]),.i_metric_23(metric[23]),.i_metric_24(metric[7]),.i_metric_25(metric[5]),.i_metric_26(metric[21]),.i_metric_27(metric[17]),.i_metric_28(metric[1]),.i_metric_29(metric[33]),
    .i_metric_30(metric[41]),.i_metric_31(metric[9]),

    //output metric
    .o_metric(w_metric_5_1)

);

//=======================================================================================//
// LLR                                                                                   //
//=======================================================================================//

assign LLR_temp[0] = w_metric_0_1 - w_metric_0_0;
assign LLR_temp[1] = w_metric_1_1 - w_metric_1_0;
assign LLR_temp[2] = w_metric_2_1 - w_metric_2_0;
assign LLR_temp[3] = w_metric_3_1 - w_metric_3_0;
assign LLR_temp[4] = w_metric_4_1 - w_metric_4_0;
assign LLR_temp[5] = w_metric_5_1 - w_metric_5_0;

//N0
always@(posedge clk or negedge rst_n) begin

    if(!rst_n) begin

        N0_2 <= 'b0;  
        r_N0_2[0] <= 'b0;
        r_N0_2[1] <= 'b0;
        r_N0_2[2] <= 'b0;
        r_N0_2[3] <= 'b0;
        r_N0_2[4] <= 'b0;
        r_N0_2[5] <= 'b0;
        r_N0_2[6] <= 'b0;

    end
    else begin

        r_N0_2[0] <= i_N0_2;
        r_N0_2[1] <= r_N0_2[0];
        N0_2 <= r_N0_2[1];

    end

end

assign LLR_mul[0] = LLR_temp[0]*N0_2;
assign LLR_mul[1] = LLR_temp[1]*N0_2;
assign LLR_mul[2] = LLR_temp[2]*N0_2;
assign LLR_mul[3] = LLR_temp[3]*N0_2;
assign LLR_mul[4] = LLR_temp[4]*N0_2;
assign LLR_mul[5] = LLR_temp[5]*N0_2;

assign w_LLR_0 = (Mode == 3'd5) ? LLR_mul[0][fraction+LLR_wordlength-1:fraction] : 19'd0;
assign w_LLR_1 = ((Mode == 3'd4) || (Mode == 3'd5)) ? LLR_mul[1][fraction+LLR_wordlength-1:fraction] : 19'd0;
assign w_LLR_2 = ((Mode == 3'd3) || (Mode == 3'd4) || (Mode == 3'd5)) ? LLR_mul[2][fraction+LLR_wordlength-1:fraction] : 19'd0;
assign w_LLR_3 = ((Mode == 3'd2) || (Mode == 3'd3) || (Mode == 3'd4) || (Mode == 3'd5)) ? LLR_mul[3][fraction+LLR_wordlength-1:fraction] : 19'd0;
assign w_LLR_4 = LLR_mul[4][fraction+LLR_wordlength-1:fraction];
assign w_LLR_5 = LLR_mul[5][fraction+LLR_wordlength-1:fraction];

always @ (posedge clk or negedge rst_n) begin

    if(!rst_n) begin
        o_LLR_0 <= 'b0;
        o_LLR_1 <= 'b0;
        o_LLR_2 <= 'b0;
        o_LLR_3 <= 'b0;
        o_LLR_4 <= 'b0;
        o_LLR_5 <= 'b0;
    end 
    else begin
        o_LLR_0 <= w_LLR_0;
        o_LLR_1 <= w_LLR_1;
        o_LLR_2 <= w_LLR_2;
        o_LLR_3 <= w_LLR_3;
        o_LLR_4 <= w_LLR_4;
        o_LLR_5 <= w_LLR_5;
    end

end

endmodule
