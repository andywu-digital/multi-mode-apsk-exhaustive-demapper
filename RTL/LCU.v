module LCU#(
	parameter wordlength = 18,
	parameter LLR_wordlength = 19,
	parameter fraction = 10,
	parameter sym_num = 64,
	parameter bit_num = 6
)(
	input wire [wordlength-1:0]		w_metric_0_0, w_metric_1_0, w_metric_2_0, w_metric_3_0, w_metric_4_0, w_metric_5_0,
						w_metric_0_1, w_metric_1_1, w_metric_2_1, w_metric_3_1, w_metric_4_1, w_metric_5_1,
	input wire [wordlength-1:0] 		i_NO_2,
	input wire [LLR_wordlength-1:0] 	o_LLR_0, o_LLR_1, o_LLR_2, o_LLR_3, o_LLR_4, o_LLR_5
);

//===============================//
// Wire & Reg
//===============================//
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

//==============================//
// LLR calculate
//==============================//
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
