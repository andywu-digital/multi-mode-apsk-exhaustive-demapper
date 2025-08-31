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
    output wire signed [18:0]    o_LLR_0,
    output wire signed [18:0]    o_LLR_1,
    output wire signed [18:0]    o_LLR_2,
    output wire signed [18:0]    o_LLR_3,
    output wire signed [18:0]    o_LLR_4,
    output wire signed [18:0]    o_LLR_5,

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
	Mode,
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
	metric[60], metric[61], metric[62], metric[63]

);



//=====================================================================================//
// Find Min Metric                                                                     //
//=====================================================================================//
CU cu1(
	clk, rst_n, en,
	metric[0], metric[1], metric[2], metric[3], metric[4], metric[5], metric[6], metric[7], metric[8], metric[9], 
	metric[10], metric[11], metric[12], metric[13], metric[14], metric[15], metric[16], metric[17], metric[18], metric[19], 
	metric[20], metric[21], metric[22], metric[23], metric[24], metric[25], metric[26], metric[27], metric[28], metric[29], 
	metric[30], metric[31], metric[32], metric[33], metric[34], metric[35], metric[36], metric[37], metric[38], metric[39], 
	metric[40], metric[41], metric[42], metric[43], metric[44], metric[45], metric[46], metric[47], metric[48], metric[49], 
	metric[50], metric[51], metric[52], metric[53], metric[54], metric[55], metric[56], metric[57], metric[58], metric[59], 
	metric[60], metric[61], metric[62], metric[63],
	w_metric_0_0, w_metric_1_0, w_metric_2_0, w_metric_3_0, w_metric_4_0, w_metric_5_0,
	w_metric_0_1, w_metric_1_1, w_metric_2_1, w_metric_3_1, w_metric_4_1, w_metric_5_1
);


//=======================================================================================//
// LLR                                                                                   //
//=======================================================================================//
LCU l1(
    clk, rst_n,
    Mode,
	w_metric_0_0, w_metric_1_0, w_metric_2_0, w_metric_3_0, w_metric_4_0, w_metric_5_0,
	w_metric_0_1, w_metric_1_1, w_metric_2_1, w_metric_3_1, w_metric_4_1, w_metric_5_1,
	i_N0_2,
	o_LLR_0, o_LLR_1, o_LLR_2, o_LLR_3, o_LLR_4, o_LLR_5
);

endmodule
