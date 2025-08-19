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
