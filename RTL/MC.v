module MC #(

    parameter wordlength = 18

)(

    input wire clk, 
    input wire rst_n, 
    input wire en,

    input wire signed [wordlength-1:0] i_metric_0,
    input wire signed [wordlength-1:0] i_metric_1,
    input wire signed [wordlength-1:0] i_metric_2,
    input wire signed [wordlength-1:0] i_metric_3,
    input wire signed [wordlength-1:0] i_metric_4,
    input wire signed [wordlength-1:0] i_metric_5,
    input wire signed [wordlength-1:0] i_metric_6,
    input wire signed [wordlength-1:0] i_metric_7,
    input wire signed [wordlength-1:0] i_metric_8,
    input wire signed [wordlength-1:0] i_metric_9,
    input wire signed [wordlength-1:0] i_metric_10,
    input wire signed [wordlength-1:0] i_metric_11,
    input wire signed [wordlength-1:0] i_metric_12,
    input wire signed [wordlength-1:0] i_metric_13,
    input wire signed [wordlength-1:0] i_metric_14,
    input wire signed [wordlength-1:0] i_metric_15,
    input wire signed [wordlength-1:0] i_metric_16,
    input wire signed [wordlength-1:0] i_metric_17,
    input wire signed [wordlength-1:0] i_metric_18,
    input wire signed [wordlength-1:0] i_metric_19,
    input wire signed [wordlength-1:0] i_metric_20,
    input wire signed [wordlength-1:0] i_metric_21,
    input wire signed [wordlength-1:0] i_metric_22,
    input wire signed [wordlength-1:0] i_metric_23,
    input wire signed [wordlength-1:0] i_metric_24,
    input wire signed [wordlength-1:0] i_metric_25,
    input wire signed [wordlength-1:0] i_metric_26,
    input wire signed [wordlength-1:0] i_metric_27,
    input wire signed [wordlength-1:0] i_metric_28,
    input wire signed [wordlength-1:0] i_metric_29,
    input wire signed [wordlength-1:0] i_metric_30,
    input wire signed [wordlength-1:0] i_metric_31,

    output reg signed [wordlength-1:0]        o_metric

);

//=======================================//
// Wire & Reg                            //
//=======================================//

wire signed [wordlength-1:0] w12_0;
wire signed [wordlength-1:0] w12_1;
wire signed [wordlength-1:0] w12_2;
wire signed [wordlength-1:0] w12_3;
wire signed [wordlength-1:0] w12_4;
wire signed [wordlength-1:0] w12_5;
wire signed [wordlength-1:0] w12_6;
wire signed [wordlength-1:0] w12_7;
wire signed [wordlength-1:0] w12_8;
wire signed [wordlength-1:0] w12_9;
wire signed [wordlength-1:0] w12_10;
wire signed [wordlength-1:0] w12_11;
wire signed [wordlength-1:0] w12_12;
wire signed [wordlength-1:0] w12_13;
wire signed [wordlength-1:0] w12_14;
wire signed [wordlength-1:0] w12_15;

wire signed [wordlength-1:0] w23_0;
wire signed [wordlength-1:0] w23_1;
wire signed [wordlength-1:0] w23_2;
wire signed [wordlength-1:0] w23_3;
wire signed [wordlength-1:0] w23_4;
wire signed [wordlength-1:0] w23_5;
wire signed [wordlength-1:0] w23_6;
wire signed [wordlength-1:0] w23_7;

wire signed [wordlength-1:0] w34_0;
wire signed [wordlength-1:0] w34_1;
wire signed [wordlength-1:0] w34_2;
wire signed [wordlength-1:0] w34_3;

wire signed [wordlength-1:0] w45_0;
wire signed [wordlength-1:0] w45_1;

wire signed [wordlength-1:0] w_metric;

//=======================================//
// Find min metric                       //
//=======================================//

assign w12_0 = (i_metric_0 <= i_metric_1) ? i_metric_0 : i_metric_1;
assign w12_1 = (i_metric_2 <= i_metric_3) ? i_metric_2 : i_metric_3;
assign w12_2 = (i_metric_4 <= i_metric_5) ? i_metric_4 : i_metric_5;
assign w12_3 = (i_metric_6 <= i_metric_7) ? i_metric_6 : i_metric_7;
assign w12_4 = (i_metric_8 <= i_metric_9) ? i_metric_8 : i_metric_9;
assign w12_5 = (i_metric_10 <= i_metric_11) ? i_metric_10 : i_metric_11;
assign w12_6 = (i_metric_12 <= i_metric_13) ? i_metric_12 : i_metric_13;
assign w12_7 = (i_metric_14 <= i_metric_15) ? i_metric_14 : i_metric_15;
assign w12_8 = (i_metric_16 <= i_metric_17) ? i_metric_16 : i_metric_17;
assign w12_9 = (i_metric_18 <= i_metric_19) ? i_metric_18 : i_metric_19;
assign w12_10 = (i_metric_20 <= i_metric_21) ? i_metric_20 : i_metric_21;
assign w12_11 = (i_metric_22 <= i_metric_23) ? i_metric_22 : i_metric_23;
assign w12_12 = (i_metric_24 <= i_metric_25) ? i_metric_24 : i_metric_25;
assign w12_13 = (i_metric_26 <= i_metric_27) ? i_metric_26 : i_metric_27;
assign w12_14 = (i_metric_28 <= i_metric_29) ? i_metric_28 : i_metric_29;
assign w12_15 = (i_metric_30 <= i_metric_31) ? i_metric_30 : i_metric_31;

assign w23_0 = (w12_0 <= w12_1) ? w12_0 : w12_1;
assign w23_1 = (w12_2 <= w12_3) ? w12_2 : w12_3;
assign w23_2 = (w12_4 <= w12_5) ? w12_4 : w12_5;
assign w23_3 = (w12_6 <= w12_7) ? w12_6 : w12_7;
assign w23_4 = (w12_8 <= w12_9) ? w12_8 : w12_9;
assign w23_5 = (w12_10 <= w12_11) ? w12_10 : w12_11;
assign w23_6 = (w12_12 <= w12_13) ? w12_12 : w12_13;
assign w23_7 = (w12_14 <= w12_15) ? w12_14 : w12_15;

assign w34_0 = (w23_0 <= w23_1) ? w23_0 : w23_1;
assign w34_1 = (w23_2 <= w23_3) ? w23_2 : w23_3;
assign w34_2 = (w23_4 <= w23_5) ? w23_4 : w23_5;
assign w34_3 = (w23_6 <= w23_7) ? w23_6 : w23_7;

assign w45_0 = (w34_0 <= w34_1) ? w34_0 : w34_1;
assign w45_1 = (w34_2 <= w34_3) ? w34_2 : w34_3;

assign w_metric = (w45_0 <= w45_1) ? w45_0 : w45_1;

always @(posedge clk or negedge rst_n) begin
    
    if (!rst_n) begin
        o_metric <= 'b0;
    end
    else begin
        o_metric <= w_metric;
    end

end

endmodule