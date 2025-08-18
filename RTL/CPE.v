//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/30 22:48:01
// Design Name: 
// Module Name: CPE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define WORDLENGTH 18 //Q8.10
module CPE(clk, rst_n, en, re_hi, im_hi, re_ui, im_ui, valid, h_o, u_re_o, u_im_o, phase_o);
// ========== //
// IO
// ========== //
input   clk, rst_n, en;
input   signed  [`WORDLENGTH-1:0] re_ui, im_ui, re_hi, im_hi;

output  valid;
output  reg signed  [`WORDLENGTH-1:0] h_o, u_re_o, u_im_o;
output         signed  [`WORDLENGTH-1:0] phase_o;  

wire M0_valid, M1_valid; 
wire [`WORDLENGTH-1:0] M0_re_o, M0_im_o;
wire [`WORDLENGTH-1:0] M1_re_o, M1_im_o;
 
reg [`WORDLENGTH-1:0] h [1:0]; //h delay reg
reg [`WORDLENGTH-1:0] u_im_d;
reg [`WORDLENGTH-1:0] u_re_d;

wire angle_0_o, angle_1_o, angle_2_o, angle_3_o, angle_4_o, angle_5_o, angle_6_o, angle_pre_o, pre_rot_o, phase_valid;

always@(posedge clk or negedge rst_n)
	if(!rst_n)
		u_re_d<=0;
	else
		u_re_d<=re_ui;

always@(posedge clk or negedge rst_n)
	if(!rst_n)
		u_im_d<=0;
	else 
		u_im_d<=im_ui;
	


CORDIC_LUTF_M0 M0(
.clk(clk), 
.rst_n(rst_n), 
.en(en),  
.x_i(re_hi), 
.y_i(im_hi), 
.valid(M0_valid), 
.x_o(M0_re_o), 
.y_o(M0_im_o), 
.angle_0_o(angle_0_o), 
.angle_1_o(angle_1_o), 
.angle_2_o(angle_2_o), 
.angle_3_o(angle_3_o), 
.angle_4_o(angle_4_o), 
.angle_5_o(angle_5_o), 
.angle_6_o(angle_6_o), 
.angle_pre_o(angle_pre_o), 
.pre_rot_o(pre_rot_o), 
.phase_valid(phase_valid)
);

CORDIC_LUTF_M1 M1(
.clk(clk), 
.rst_n(rst_n), 
.en(phase_valid), 
.x_i(u_re_d), 
.y_i(u_im_d), 
.valid(M1_valid), 
.x_o(M1_re_o), 
.y_o(M1_im_o), 
.angle_0_i(angle_0_o), 
.angle_1_i(angle_1_o), 
.angle_2_i(angle_2_o), 
.angle_3_i(angle_3_o), 
.angle_4_i(angle_4_o), 
.angle_5_i(angle_5_o), 
.angle_6_i(angle_6_o), 
.angle_pre_i(angle_pre_o), 
.pre_rot_i(pre_rot_o)
);





always@(posedge clk or negedge rst_n)
	if(!rst_n)
		h[0]<=0;
	else 
		h[0]<=M0_re_o;

	
always@(posedge clk or negedge rst_n)
	if(!rst_n)
		h_o<=0;
	else
		h_o<=h[0];
		

	
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        u_re_o<=0;
    else
        u_re_o<=M1_re_o;

    
 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        u_im_o<=0;
    else
        u_im_o<=M1_im_o;
 
	
		

Vectoring_Mode VM2( 
.clk(clk),
.rst_n(rst_n),
.en(M1_valid),
.x_i(M1_re_o),
.y_i(M1_im_o), 
.valid(valid),
.z_o(phase_o)
);

endmodule
