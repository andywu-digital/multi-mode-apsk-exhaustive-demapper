`define WORDLENGTH 18 //Q8.10

module CPE(

	input wire 				clk, rst_n, en, 
	input wire signed [`WORDLENGTH-1:0] 	re_hi, im_hi, re_ui, im_ui, 
	output wire 				valid, 
	output reg signed [`WORDLENGTH-1:0] 	h_o, u_re_o, u_im_o, 
	output wire signed [`WORDLENGTH-1:0] 	phase_o

);

//=============================//
// Wire & Reg
//=============================//
wire 			M0_valid, M1_valid; 
wire [`WORDLENGTH-1:0] 	M0_re_o, M0_im_o;
wire [`WORDLENGTH-1:0] 	M1_re_o, M1_im_o;
 
reg [`WORDLENGTH-1:0] 	h [1:0]; //h delay reg
reg [`WORDLENGTH-1:0] 	u_im_d;
reg [`WORDLENGTH-1:0] 	u_re_d;

wire 			angle_0_o, angle_1_o, angle_2_o, angle_3_o, angle_4_o, angle_5_o, angle_6_o, angle_pre_o, pre_rot_o, phase_valid;

//============================//
// Input Reg
//============================//
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
	
//============================//
// CORDIC
//============================//

//VM Mode - calculate angle of h
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

//RM Mode - calculate u before h
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

//VM Mode - Calculate angle of u
Vectoring_Mode VM2( 
	.clk(clk),
	.rst_n(rst_n),
	.en(M1_valid),
	.x_i(M1_re_o),
	.y_i(M1_im_o), 
	.valid(valid),
	.z_o(phase_o)
);

//==================================//
// Output Reg
//==================================//
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
 
	
endmodule

//=======================================================================//
// Sub-Module
//=======================================================================//

`define WORDLENGTH 18 // Q8.10
`define FRACTION 10

module CORDIC_LUTF_M0(clk, rst_n, en, x_i, y_i, valid, x_o, y_o, angle_0_o, angle_1_o, angle_2_o, angle_3_o, angle_4_o, angle_5_o, angle_6_o, angle_pre_o, pre_rot_o, phase_valid);

// ========== //
// IO
// ========== //
input   clk, rst_n, en;
input   signed  [`WORDLENGTH-1:0]   x_i, y_i;

output reg angle_0_o, angle_1_o, angle_2_o, angle_3_o, angle_4_o, angle_5_o, angle_6_o;
output reg angle_pre_o, pre_rot_o, phase_valid;
output  valid;
output  signed  [`WORDLENGTH-1:0]   x_o, y_o;

// ===================== //
// Prerotation
// ===================== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]    xi_inv, yi_inv, x_pre, y_pre, x_pre_o, y_pre_o;
wire    angle_pre, pre_rot;

// -------------- //
assign {angle_pre, pre_rot} =  {y_i[`WORDLENGTH-1], x_i[`WORDLENGTH-1]};

assign xi_inv = -x_i;
assign yi_inv = -y_i;

assign x_pre = (angle_pre)? yi_inv:y_i;
assign y_pre = (angle_pre)? x_i:xi_inv;

assign x_pre_o = (pre_rot)? x_pre:x_i;
assign y_pre_o = (pre_rot)? y_pre:y_i;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        {angle_pre_o, pre_rot_o} <= 2'b00;
    else
        {angle_pre_o, pre_rot_o} <= {angle_pre, pre_rot};
end

// ========== //
// Stage 0
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s0_inv, y_s0_inv, x_s0_sel, y_s0_sel, x_s0_o, y_s0_o;
wire    angle_0;

// -------------- //
assign angle_0 =  y_pre_o[`WORDLENGTH-1];

assign x_s0_inv = -x_pre_o;
assign y_s0_inv = -y_pre_o;

assign x_s0_sel = (angle_0)? y_s0_inv:y_pre_o;
assign y_s0_sel = (angle_0)? x_pre_o:x_s0_inv;

assign x_s0_o = x_pre_o + x_s0_sel;
assign y_s0_o = y_pre_o + y_s0_sel;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_0_o <= 1'b0;
    else
        angle_0_o <= angle_0;
end

// ========== //
// Stage 1
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s1_inv, y_s1_inv, x_s1_sel, y_s1_sel, x_s1_shf, y_s1_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s1_o, y_s1_o;
wire    angle_1;

// -------------- //
assign angle_1 =  y_s0_o[`WORDLENGTH-1];

assign x_s1_inv = -x_s0_o;
assign y_s1_inv = -y_s0_o;

assign x_s1_sel = (angle_1)? y_s1_inv:y_s0_o;
assign y_s1_sel = (angle_1)? x_s0_o:x_s1_inv;

assign x_s1_shf = x_s1_sel>>>1;
assign y_s1_shf = y_s1_sel>>>1;

assign x_s1_o = x_s0_o + x_s1_shf;
assign y_s1_o = y_s0_o + y_s1_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_1_o <= 1'b0;
    else
        angle_1_o <= angle_1;
end

// ========== //
// Stage 2
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s2_inv, y_s2_inv, x_s2_sel, y_s2_sel, x_s2_shf, y_s2_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s2_o, y_s2_o;
wire    angle_2;

// -------------- //
assign angle_2 =  y_s1_o[`WORDLENGTH-1];

assign x_s2_inv = -x_s1_o;
assign y_s2_inv = -y_s1_o;

assign x_s2_sel = (angle_2)? y_s2_inv:y_s1_o;
assign y_s2_sel = (angle_2)? x_s1_o:x_s2_inv;

assign x_s2_shf = x_s2_sel>>>2;
assign y_s2_shf = y_s2_sel>>>2;

assign x_s2_o = x_s1_o + x_s2_shf;
assign y_s2_o = y_s1_o + y_s2_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_2_o <= 1'b0;
    else
        angle_2_o <= angle_2;
end

// ========== //
// Stage 3
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s3_inv, y_s3_inv, x_s3_sel, y_s3_sel, x_s3_shf, y_s3_shf;
reg    signed  [`WORDLENGTH-1:0]   x_s3_o, y_s3_o;
wire    signed  [`WORDLENGTH-1:0]   x_s3_w, y_s3_w;
wire    angle_3;

// -------------- //
assign angle_3 =  y_s2_o[`WORDLENGTH-1];

assign x_s3_inv = -x_s2_o;
assign y_s3_inv = -y_s2_o;

assign x_s3_sel = (angle_3)? y_s3_inv:y_s2_o;
assign y_s3_sel = (angle_3)? x_s2_o:x_s3_inv;

assign x_s3_shf = x_s3_sel>>>3;
assign y_s3_shf = y_s3_sel>>>3;

assign x_s3_w = x_s2_o + x_s3_shf;
assign y_s3_w = y_s2_o + y_s3_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_3_o <= 1'b0;
    else
        angle_3_o <= angle_3;
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        x_s3_o <= 1'b0;
        y_s3_o <= 1'b0;
    end
    else begin
        x_s3_o <= x_s3_w;
        y_s3_o <= y_s3_w;
    end
end

// ========== //
// Stage 4
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s4_inv, y_s4_inv, x_s4_sel, y_s4_sel, x_s4_shf, y_s4_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s4_o, y_s4_o;
wire    angle_4;

// -------------- //
assign angle_4 =  y_s3_o[`WORDLENGTH-1];

assign x_s4_inv = -x_s3_o;
assign y_s4_inv = -y_s3_o;

assign x_s4_sel = (angle_4)? y_s4_inv:y_s3_o;
assign y_s4_sel = (angle_4)? x_s3_o:x_s4_inv;

assign x_s4_shf = x_s4_sel>>>4;
assign y_s4_shf = y_s4_sel>>>4;

assign x_s4_o = x_s3_o + x_s4_shf;
assign y_s4_o = y_s3_o + y_s4_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_4_o <= 1'b0;
    else
        angle_4_o <= angle_4;
end

// ========== //
// Stage 5
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s5_inv, y_s5_inv, x_s5_sel, y_s5_sel, x_s5_shf, y_s5_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s5_o, y_s5_o;
wire    angle_5;

// -------------- //
assign angle_5 =  y_s4_o[`WORDLENGTH-1];

assign x_s5_inv = -x_s4_o;
assign y_s5_inv = -y_s4_o;

assign x_s5_sel = (angle_5)? y_s5_inv:y_s4_o;
assign y_s5_sel = (angle_5)? x_s4_o:x_s5_inv;

assign x_s5_shf = x_s5_sel>>>5;
assign y_s5_shf = y_s5_sel>>>5;

assign x_s5_o = x_s4_o + x_s5_shf;
assign y_s5_o = y_s4_o + y_s5_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_5_o <= 1'b0;
    else
        angle_5_o <= angle_5;
end

// ========== //
// Stage 6
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s6_inv, y_s6_inv, x_s6_sel, y_s6_sel, x_s6_shf, y_s6_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s6_o, y_s6_o;
wire    angle_6;

// -------------- //
assign angle_6 =  y_s5_o[`WORDLENGTH-1];

assign x_s6_inv = -x_s5_o;
assign y_s6_inv = -y_s5_o;

assign x_s6_sel = (angle_6)? y_s6_inv:y_s5_o;
assign y_s6_sel = (angle_6)? x_s5_o:x_s6_inv;

assign x_s6_shf = x_s6_sel>>>6;
assign y_s6_shf = y_s6_sel>>>6;

assign x_s6_o = x_s5_o + x_s6_shf;
assign y_s6_o = y_s5_o + y_s6_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        angle_6_o <= 1'b0;
    else
        angle_6_o <= angle_6;
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        phase_valid <= 1'b0;
    else
        phase_valid <= en;
end

// ========== //
// Output
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH+10:0]   x_mul, y_mul;
parameter signed Kn = 11'b0_1001101101;
// -------------- //
//pipe
reg[`WORDLENGTH - 1:0]x_s6_o_reg;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        x_s6_o_reg<=0;
    else
        x_s6_o_reg<=x_s6_o;

assign x_mul=Kn*x_s6_o_reg;

//pipe over
//assign x_mul = Kn*x_s6_o; //no pipe
assign y_mul = Kn*y_s6_o;

assign valid = en;
assign x_o = $signed(x_mul[`FRACTION +`WORDLENGTH - 1:`FRACTION]);
assign y_o = $signed(y_mul[`FRACTION +`WORDLENGTH - 1:`FRACTION]);

endmodule


module CORDIC_LUTF_M1(clk, rst_n, en, x_i, y_i, valid, x_o, y_o, angle_0_i, angle_1_i, angle_2_i, angle_3_i, angle_4_i, angle_5_i, angle_6_i, angle_pre_i, pre_rot_i);

// ========== //
// IO
// ========== //
input   clk, rst_n, en;
input   signed  [`WORDLENGTH-1:0]   x_i, y_i;

input angle_0_i, angle_1_i, angle_2_i, angle_3_i, angle_4_i, angle_5_i, angle_6_i, angle_pre_i, pre_rot_i;
output reg  valid;
output reg  signed  [`WORDLENGTH-1:0]   x_o, y_o;

// ===================== //
// Prerotation
// ===================== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]    xi_inv, yi_inv, x_pre, y_pre, x_pre_o, y_pre_o;
wire    angle_pre, pre_rot;
reg     angle_pre_r, pre_rot_r;
// -------------- //
assign {angle_pre, pre_rot} = {angle_pre_i, pre_rot_i};

assign xi_inv = -x_i;
assign yi_inv = -y_i;

assign x_pre = (angle_pre)? yi_inv:y_i;
assign y_pre = (angle_pre)? x_i:xi_inv;

assign x_pre_o = (pre_rot)? x_pre:x_i;
assign y_pre_o = (pre_rot)? y_pre:y_i;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        {angle_pre_r, pre_rot_r} <= 2'b00;
    else
        {angle_pre_r, pre_rot_r} <= {angle_pre, pre_rot};
end

// ========== //
// Stage 0
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s0_inv, y_s0_inv, x_s0_sel, y_s0_sel, x_s0_o, y_s0_o;
wire    angle_0;

// -------------- //
assign angle_0 =  angle_0_i ;

assign x_s0_inv = -x_pre_o;
assign y_s0_inv = -y_pre_o;

assign x_s0_sel = (angle_0)? y_s0_inv:y_pre_o;
assign y_s0_sel = (angle_0)? x_pre_o:x_s0_inv;

assign x_s0_o = x_pre_o + x_s0_sel;
assign y_s0_o = y_pre_o + y_s0_sel;


// ========== //
// Stage 1
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s1_inv, y_s1_inv, x_s1_sel, y_s1_sel, x_s1_shf, y_s1_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s1_o, y_s1_o;
wire    angle_1;

// -------------- //
assign angle_1 =  angle_1_i ;

assign x_s1_inv = -x_s0_o;
assign y_s1_inv = -y_s0_o;

assign x_s1_sel = (angle_1)? y_s1_inv:y_s0_o;
assign y_s1_sel = (angle_1)? x_s0_o:x_s1_inv;

assign x_s1_shf = x_s1_sel>>>1;
assign y_s1_shf = y_s1_sel>>>1;

assign x_s1_o = x_s0_o + x_s1_shf;
assign y_s1_o = y_s0_o + y_s1_shf;


// ========== //
// Stage 2
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s2_inv, y_s2_inv, x_s2_sel, y_s2_sel, x_s2_shf, y_s2_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s2_o, y_s2_o;
wire    angle_2;

// -------------- //
assign angle_2 =  angle_2_i ;

assign x_s2_inv = -x_s1_o;
assign y_s2_inv = -y_s1_o;

assign x_s2_sel = (angle_2)? y_s2_inv:y_s1_o;
assign y_s2_sel = (angle_2)? x_s1_o:x_s2_inv;

assign x_s2_shf = x_s2_sel>>>2;
assign y_s2_shf = y_s2_sel>>>2;

assign x_s2_o = x_s1_o + x_s2_shf;
assign y_s2_o = y_s1_o + y_s2_shf;


// ========== //
// Stage 3
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s3_inv, y_s3_inv, x_s3_sel, y_s3_sel, x_s3_shf, y_s3_shf;
reg    signed  [`WORDLENGTH-1:0]   x_s3_o, y_s3_o;
wire    signed  [`WORDLENGTH-1:0]   x_s3_w, y_s3_w;
wire    angle_3;

// -------------- //
assign angle_3 =  angle_3_i ;

assign x_s3_inv = -x_s2_o;
assign y_s3_inv = -y_s2_o;

assign x_s3_sel = (angle_3)? y_s3_inv:y_s2_o;
assign y_s3_sel = (angle_3)? x_s2_o:x_s3_inv;

assign x_s3_shf = x_s3_sel>>>3;
assign y_s3_shf = y_s3_sel>>>3;

assign x_s3_w = x_s2_o + x_s3_shf;
assign y_s3_w = y_s2_o + y_s3_shf;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        x_s3_o <= 1'b0;
        y_s3_o <= 1'b0;
    end
    else begin
        x_s3_o <= x_s3_w;
        y_s3_o <= y_s3_w;
    end
end


// ========== //
// Stage 4
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s4_inv, y_s4_inv, x_s4_sel, y_s4_sel, x_s4_shf, y_s4_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s4_o, y_s4_o;
wire    angle_4;

// -------------- //
assign angle_4 =  angle_4_i ;

assign x_s4_inv = -x_s3_o;
assign y_s4_inv = -y_s3_o;

assign x_s4_sel = (angle_4)? y_s4_inv:y_s3_o;
assign y_s4_sel = (angle_4)? x_s3_o:x_s4_inv;

assign x_s4_shf = x_s4_sel>>>4;
assign y_s4_shf = y_s4_sel>>>4;

assign x_s4_o = x_s3_o + x_s4_shf;
assign y_s4_o = y_s3_o + y_s4_shf;


// ========== //
// Stage 5
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s5_inv, y_s5_inv, x_s5_sel, y_s5_sel, x_s5_shf, y_s5_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s5_o, y_s5_o;
wire    angle_5;

// -------------- //
assign angle_5 =  angle_5_i ;

assign x_s5_inv = -x_s4_o;
assign y_s5_inv = -y_s4_o;

assign x_s5_sel = (angle_5)? y_s5_inv:y_s4_o;
assign y_s5_sel = (angle_5)? x_s4_o:x_s5_inv;

assign x_s5_shf = x_s5_sel>>>5;
assign y_s5_shf = y_s5_sel>>>5;

assign x_s5_o = x_s4_o + x_s5_shf;
assign y_s5_o = y_s4_o + y_s5_shf;


// ========== //
// Stage 6
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s6_inv, y_s6_inv, x_s6_sel, y_s6_sel, x_s6_shf, y_s6_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s6_o, y_s6_o;
wire    angle_6;

// -------------- //
assign angle_6 =  angle_6_i ;

assign x_s6_inv = -x_s5_o;
assign y_s6_inv = -y_s5_o;

assign x_s6_sel = (angle_6)? y_s6_inv:y_s5_o;
assign y_s6_sel = (angle_6)? x_s5_o:x_s6_inv;

assign x_s6_shf = x_s6_sel>>>6;
assign y_s6_shf = y_s6_sel>>>6;

assign x_s6_o = x_s5_o + x_s6_shf;
assign y_s6_o = y_s5_o + y_s6_shf;


// ========== //
// Output
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH+10:0]   x_mul, y_mul;
parameter signed Kn = 11'b0_1001101101;
// -------------- //
assign x_mul = Kn*x_s6_o;
assign y_mul = Kn*y_s6_o;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        valid<=0;
    else
        valid<=en;
        
always@(posedge clk or negedge rst_n)
    if(!rst_n)
         x_o<=0;
    else
        x_o<= $signed(x_mul[`FRACTION +`WORDLENGTH - 1:`FRACTION]);
        
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        y_o<=0;
    else
        y_o<=$signed(y_mul[`FRACTION +`WORDLENGTH - 1:`FRACTION]);


endmodule

module Vectoring_Mode(clk, rst_n, en, x_i, y_i, valid, z_o);

input   clk, rst_n, en;
input   signed  [`WORDLENGTH-1:0] x_i, y_i;

output  reg valid;
output  reg signed  [`WORDLENGTH-1:0] z_o;

// ===================== //
// Prerotation 
// ===================== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]    xi_inv, yi_inv, x_pre, y_pre, z_pre, x_pre_o, y_pre_o, z_pre_o;
wire    angle_pre, pre_rot;   
// -------------- //
assign {angle_pre, pre_rot} = {y_i[`WORDLENGTH-1], x_i[`WORDLENGTH-1]}; 

assign xi_inv = -x_i;
assign yi_inv = -y_i;

assign x_pre = (angle_pre)? yi_inv:y_i;
assign y_pre = (angle_pre)? x_i:xi_inv;
assign z_pre = (angle_pre)? 18'h3f9b7:18'h00648; //pi/2

assign x_pre_o = (pre_rot)? x_pre:x_i;
assign y_pre_o = (pre_rot)? y_pre:y_i;
assign z_pre_o = (pre_rot)? z_pre:{`WORDLENGTH{1'd0}};

// ========== //
// Stage 0
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s0_inv, y_s0_inv, x_s0_sel, y_s0_sel, z_s0_sel, x_s0_o, y_s0_o, z_s0_o;
wire    angle_0;
// -------------- //
assign angle_0 = y_pre_o[`WORDLENGTH-1];

assign x_s0_inv = -x_pre_o;
assign y_s0_inv = -y_pre_o;

assign x_s0_sel = (angle_0)? y_s0_inv:y_pre_o;
assign y_s0_sel = (angle_0)? x_pre_o:x_s0_inv;
assign z_s0_sel = (angle_0)? 18'h3fcdc:18'h00324; //atan(2^(-0))

assign x_s0_o = x_pre_o + x_s0_sel;
assign y_s0_o = y_pre_o + y_s0_sel;
assign z_s0_o = z_pre_o + z_s0_sel;

// ========== //
// Stage 1
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s1_inv, y_s1_inv, x_s1_sel, y_s1_sel, z_s1_sel, x_s1_shf, y_s1_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s1_o, y_s1_o, z_s1_o;
wire    angle_1;
// -------------- //
assign angle_1 = y_s0_o[`WORDLENGTH-1];

assign x_s1_inv = -x_s0_o;
assign y_s1_inv = -y_s0_o;

assign x_s1_sel = (angle_1)? y_s1_inv:y_s0_o;
assign y_s1_sel = (angle_1)? x_s0_o:x_s1_inv;
assign z_s1_sel = (angle_1)? 18'h3fe26:18'h001da; //atan(2^(-1))

assign x_s1_shf = x_s1_sel>>>1;
assign y_s1_shf = y_s1_sel>>>1;

assign x_s1_o = x_s0_o + x_s1_shf;
assign y_s1_o = y_s0_o + y_s1_shf;
assign z_s1_o = z_s0_o + z_s1_sel;

// ========== //
// Stage 2
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s2_inv, y_s2_inv, x_s2_sel, y_s2_sel, z_s2_sel, x_s2_shf, y_s2_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s2_o, y_s2_o, z_s2_o;
wire    angle_2;
// -------------- //
assign angle_2 = y_s1_o[`WORDLENGTH-1];

assign x_s2_inv = -x_s1_o;
assign y_s2_inv = -y_s1_o;

assign x_s2_sel = (angle_2)? y_s2_inv:y_s1_o;
assign y_s2_sel = (angle_2)? x_s1_o:x_s2_inv;
assign z_s2_sel = (angle_2)? 18'h3ff06:18'h000fa; //atan(2^(-2))

assign x_s2_shf = x_s2_sel>>>2;
assign y_s2_shf = y_s2_sel>>>2;

assign x_s2_o = x_s1_o + x_s2_shf;
assign y_s2_o = y_s1_o + y_s2_shf;
assign z_s2_o = z_s1_o + z_s2_sel;

// ========== //
// Stage 3
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s3_inv, y_s3_inv, x_s3_sel, y_s3_sel, z_s3_sel, x_s3_shf, y_s3_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s3_o, y_s3_o, z_s3_o;
wire    angle_3;
// -------------- //
assign angle_3 = y_s2_o[`WORDLENGTH-1];

assign x_s3_inv = -x_s2_o;
assign y_s3_inv = -y_s2_o;

assign x_s3_sel = (angle_3)? y_s3_inv:y_s2_o;
assign y_s3_sel = (angle_3)? x_s2_o:x_s3_inv;
assign z_s3_sel = (angle_3)? 18'h3ff81:18'h0007f; //atan(2^(-3))

assign x_s3_shf = x_s3_sel>>>3;
assign y_s3_shf = y_s3_sel>>>3;

assign x_s3_o = x_s2_o + x_s3_shf;
assign y_s3_o = y_s2_o + y_s3_shf;
assign z_s3_o = z_s2_o + z_s3_sel;

// ========== //
// Stage 4
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s4_inv, y_s4_inv, x_s4_sel, y_s4_sel, z_s4_sel, x_s4_shf, y_s4_shf;
wire    signed  [`WORDLENGTH-1:0]   x_s4_o, y_s4_o, z_s4_o;
wire    angle_4;
// -------------- //
assign angle_4 = y_s3_o[`WORDLENGTH-1];

assign x_s4_inv = -x_s3_o;
assign y_s4_inv = -y_s3_o;

assign x_s4_sel = (angle_4)? y_s4_inv:y_s3_o;
assign y_s4_sel = (angle_4)? x_s3_o:x_s4_inv;
assign z_s4_sel = (angle_4)? 18'h3ffc1:18'h0003f; //atan(2^(-4))

assign x_s4_shf = x_s4_sel>>>4;
assign y_s4_shf = y_s4_sel>>>4;

assign x_s4_o = x_s3_o + x_s4_shf;
assign y_s4_o = y_s3_o + y_s4_shf;
assign z_s4_o = z_s3_o + z_s4_sel;

// ========== //
// Stage 5
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   x_s5_inv, y_s5_sel, z_s5_sel, y_s5_shf;
wire    signed  [`WORDLENGTH-1:0]    y_s5_o, z_s5_o;
wire    angle_5;
// -------------- //
assign angle_5 = y_s4_o[`WORDLENGTH-1];

assign x_s5_inv = -x_s4_o;



assign y_s5_sel = (angle_5)? x_s4_o:x_s5_inv;
assign z_s5_sel = (angle_5)? 18'h3ffe1:18'h0001f; //atan(2^(-5))


assign y_s5_shf = y_s5_sel>>>5;


assign y_s5_o = y_s4_o + y_s5_shf;
assign z_s5_o = z_s4_o + z_s5_sel;

// ========== //
// Stage 6
// ========== //
// --- Signal --- //
wire    signed  [`WORDLENGTH-1:0]   z_s6_sel;
wire    signed  [`WORDLENGTH-1:0]   z_s6_o;
wire    angle_6;
// -------------- //
assign angle_6 = y_s5_o[`WORDLENGTH-1];

assign z_s6_sel = (angle_6)? 18'b111111111111110001:18'b000000000000001111; //atan(2^(-6))

assign z_s6_o = z_s5_o + z_s6_sel;

// ========== //
// Output
// ========== //
always@(posedge clk or negedge rst_n)
    if(!rst_n) 
        valid <= 1'b0;
    else
        valid <= en;

always@(posedge clk or negedge rst_n)
    if(!rst_n) 
        z_o <= {`WORDLENGTH{1'd0}};
    else 
        z_o <= z_s6_o;

endmodule
