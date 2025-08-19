module CU#(
	parameter wordlength = 18,
	parameter LLR_wordlength = 19,
	parameter fraction = 10,
	parameter sym_num = 64,
	parameter bit_num = 6
)(
	input wire clk, rst_n, en,
	input wire [wordlength-1:0] 	metric_0, metric_1, metric_2, metric_3, metric_4, metric_5, metric_6, metric_7, metric_8, metric_9, 
					metric_10, metric_11, metric_12, metric_13, metric_14, metric_15, metric_16, metric_17, metric_18, metric_19, 
					metric_20, metric_21, metric_22, metric_23, metric_24, metric_25, metric_26, metric_27, metric_28, metric_29, 
					metric_30, metric_31, metric_32, metric_33, metric_34, metric_35, metric_36, metric_37, metric_38, metric_39, 
					metric_40, metric_41, metric_42, metric_43, metric_44, metric_45, metric_46, metric_47, metric_48, metric_49, 
					metric_50, metric_51, metric_52, metric_53, metric_54, metric_55, metric_56, metric_57, metric_58, metric_59, 
					metric_60, metric_61, metric_62, metric_63,
	output wire [wordlength-1:0] 	w_metric_0_0, w_metric_1_0, w_metric_2_0, w_metric_3_0, w_metric_4_0, w_metric_5_0,
					w_metric_0_1, w_metric_1_1, w_metric_2_1, w_metric_3_1, w_metric_4_1, w_metric_5_1
);


//bit 0
MC S0_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_14),.i_metric_2(metric_15),.i_metric_3(metric_13),.i_metric_4(metric_28),.i_metric_5(metric_30),.i_metric_6(metric_31),.i_metric_7(metric_29),.i_metric_8(metric_24),.i_metric_9(metric_26),
    .i_metric_10(metric_27),.i_metric_11(metric_25),.i_metric_12(metric_8),.i_metric_13(metric_0),.i_metric_14(metric_16),.i_metric_15(metric_20),.i_metric_16(metric_4),.i_metric_17(metric_6),.i_metric_18(metric_22),.i_metric_19(metric_18),
    .i_metric_20(metric_2),.i_metric_21(metric_10),.i_metric_22(metric_11),.i_metric_23(metric_3),.i_metric_24(metric_19),.i_metric_25(metric_23),.i_metric_26(metric_7),.i_metric_27(metric_5),.i_metric_28(metric_21),.i_metric_29(metric_17),
    .i_metric_30(metric_1),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_0_0)

);

MC S0_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_60),.i_metric_1(metric_44),.i_metric_2(metric_46),.i_metric_3(metric_62),.i_metric_4(metric_63),.i_metric_5(metric_47),.i_metric_6(metric_45),.i_metric_7(metric_61),.i_metric_8(metric_56),.i_metric_9(metric_48),
    .i_metric_10(metric_52),.i_metric_11(metric_36),.i_metric_12(metric_38),.i_metric_13(metric_54),.i_metric_14(metric_50),.i_metric_15(metric_58),.i_metric_16(metric_59),.i_metric_17(metric_51),.i_metric_18(metric_55),.i_metric_19(metric_39),
    .i_metric_20(metric_37),.i_metric_21(metric_53),.i_metric_22(metric_49),.i_metric_23(metric_57),.i_metric_24(metric_40),.i_metric_25(metric_32),.i_metric_26(metric_34),.i_metric_27(metric_42),.i_metric_28(metric_43),.i_metric_29(metric_35),
    .i_metric_30(metric_33),.i_metric_31(metric_41),

    //output metric
    .o_metric(w_metric_0_1)

);

//bit1
MC S1_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_14),.i_metric_2(metric_15),.i_metric_3(metric_13),.i_metric_4(metric_44),.i_metric_5(metric_46),.i_metric_6(metric_47),.i_metric_7(metric_45),.i_metric_8(metric_36),.i_metric_9(metric_38),
    .i_metric_10(metric_39),.i_metric_11(metric_37),.i_metric_12(metric_8),.i_metric_13(metric_40),.i_metric_14(metric_32),.i_metric_15(metric_0),.i_metric_16(metric_4),.i_metric_17(metric_6),.i_metric_18(metric_2),.i_metric_19(metric_34),
    .i_metric_20(metric_42),.i_metric_21(metric_10),.i_metric_22(metric_11),.i_metric_23(metric_43),.i_metric_24(metric_35),.i_metric_25(metric_3),.i_metric_26(metric_7),.i_metric_27(metric_5),.i_metric_28(metric_1),.i_metric_29(metric_33),
    .i_metric_30(metric_41),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_1_0)

);

MC S1_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_28),.i_metric_1(metric_60),.i_metric_2(metric_62),.i_metric_3(metric_30),.i_metric_4(metric_31),.i_metric_5(metric_63),.i_metric_6(metric_61),.i_metric_7(metric_29),.i_metric_8(metric_24),.i_metric_9(metric_56),
    .i_metric_10(metric_48),.i_metric_11(metric_52),.i_metric_12(metric_54),.i_metric_13(metric_50),.i_metric_14(metric_58),.i_metric_15(metric_26),.i_metric_16(metric_27),.i_metric_17(metric_59),.i_metric_18(metric_51),.i_metric_19(metric_55),
    .i_metric_20(metric_53),.i_metric_21(metric_49),.i_metric_22(metric_57),.i_metric_23(metric_25),.i_metric_24(metric_16),.i_metric_25(metric_20),.i_metric_26(metric_22),.i_metric_27(metric_18),.i_metric_28(metric_19),.i_metric_29(metric_23),
    .i_metric_30(metric_21),.i_metric_31(metric_17),

    //output metric
    .o_metric(w_metric_1_1)

);

//bit2
MC S2_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_48),.i_metric_1(metric_52),.i_metric_2(metric_36),.i_metric_3(metric_38),.i_metric_4(metric_54),.i_metric_5(metric_50),.i_metric_6(metric_51),.i_metric_7(metric_55),.i_metric_8(metric_39),.i_metric_9(metric_37),
    .i_metric_10(metric_53),.i_metric_11(metric_49),.i_metric_12(metric_32),.i_metric_13(metric_0),.i_metric_14(metric_16),.i_metric_15(metric_20),.i_metric_16(metric_4),.i_metric_17(metric_6),.i_metric_18(metric_22),.i_metric_19(metric_18),
    .i_metric_20(metric_2),.i_metric_21(metric_34),.i_metric_22(metric_35),.i_metric_23(metric_3),.i_metric_24(metric_19),.i_metric_25(metric_23),.i_metric_26(metric_7),.i_metric_27(metric_5),.i_metric_28(metric_21),.i_metric_29(metric_17),
    .i_metric_30(metric_1),.i_metric_31(metric_33),

    //output metric
    .o_metric(w_metric_2_0)

);

MC S2_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_14),.i_metric_2(metric_15),.i_metric_3(metric_13),.i_metric_4(metric_28),.i_metric_5(metric_60),.i_metric_6(metric_44),.i_metric_7(metric_46),.i_metric_8(metric_62),.i_metric_9(metric_30),
    .i_metric_10(metric_31),.i_metric_11(metric_63),.i_metric_12(metric_47),.i_metric_13(metric_45),.i_metric_14(metric_61),.i_metric_15(metric_29),.i_metric_16(metric_24),.i_metric_17(metric_56),.i_metric_18(metric_58),.i_metric_19(metric_26),
    .i_metric_20(metric_27),.i_metric_21(metric_59),.i_metric_22(metric_57),.i_metric_23(metric_25),.i_metric_24(metric_8),.i_metric_25(metric_40),.i_metric_26(metric_42),.i_metric_27(metric_10),.i_metric_28(metric_11),.i_metric_29(metric_43),
    .i_metric_30(metric_41),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_2_1)

);

//bit3
MC S3_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_24),.i_metric_1(metric_56),.i_metric_2(metric_48),.i_metric_3(metric_50),.i_metric_4(metric_58),.i_metric_5(metric_26),.i_metric_6(metric_27),.i_metric_7(metric_59),.i_metric_8(metric_51),.i_metric_9(metric_49),
    .i_metric_10(metric_57),.i_metric_11(metric_25),.i_metric_12(metric_8),.i_metric_13(metric_40),.i_metric_14(metric_32),.i_metric_15(metric_0),.i_metric_16(metric_16),.i_metric_17(metric_18),.i_metric_18(metric_2),.i_metric_19(metric_34),
    .i_metric_20(metric_42),.i_metric_21(metric_10),.i_metric_22(metric_11),.i_metric_23(metric_43),.i_metric_24(metric_35),.i_metric_25(metric_3),.i_metric_26(metric_19),.i_metric_27(metric_17),.i_metric_28(metric_1),.i_metric_29(metric_33),
    .i_metric_30(metric_41),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_3_0)

);

MC S3_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_14),.i_metric_2(metric_15),.i_metric_3(metric_13),.i_metric_4(metric_28),.i_metric_5(metric_60),.i_metric_6(metric_44),.i_metric_7(metric_46),.i_metric_8(metric_62),.i_metric_9(metric_30),
    .i_metric_10(metric_31),.i_metric_11(metric_63),.i_metric_12(metric_47),.i_metric_13(metric_45),.i_metric_14(metric_61),.i_metric_15(metric_29),.i_metric_16(metric_52),.i_metric_17(metric_36),.i_metric_18(metric_38),.i_metric_19(metric_54),
    .i_metric_20(metric_55),.i_metric_21(metric_39),.i_metric_22(metric_37),.i_metric_23(metric_53),.i_metric_24(metric_20),.i_metric_25(metric_4),.i_metric_26(metric_6),.i_metric_27(metric_22),.i_metric_28(metric_23),.i_metric_29(metric_7),
    .i_metric_30(metric_5),.i_metric_31(metric_21),

    //output metric
    .o_metric(w_metric_3_1)

);

//bit4
MC S4_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_13),.i_metric_2(metric_28),.i_metric_3(metric_60),.i_metric_4(metric_44),.i_metric_5(metric_45),.i_metric_6(metric_61),.i_metric_7(metric_29),.i_metric_8(metric_24),.i_metric_9(metric_56),
    .i_metric_10(metric_48),.i_metric_11(metric_52),.i_metric_12(metric_36),.i_metric_13(metric_37),.i_metric_14(metric_53),.i_metric_15(metric_49),.i_metric_16(metric_57),.i_metric_17(metric_25),.i_metric_18(metric_8),.i_metric_19(metric_40),
    .i_metric_20(metric_32),.i_metric_21(metric_0),.i_metric_22(metric_16),.i_metric_23(metric_20),.i_metric_24(metric_4),.i_metric_25(metric_5),.i_metric_26(metric_21),.i_metric_27(metric_17),.i_metric_28(metric_1),.i_metric_29(metric_33),
    .i_metric_30(metric_41),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_4_0)

);

MC S4_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_14),.i_metric_1(metric_15),.i_metric_2(metric_46),.i_metric_3(metric_62),.i_metric_4(metric_30),.i_metric_5(metric_31),.i_metric_6(metric_63),.i_metric_7(metric_47),.i_metric_8(metric_38),.i_metric_9(metric_54),
    .i_metric_10(metric_50),.i_metric_11(metric_58),.i_metric_12(metric_26),.i_metric_13(metric_27),.i_metric_14(metric_59),.i_metric_15(metric_51),.i_metric_16(metric_55),.i_metric_17(metric_39),.i_metric_18(metric_6),.i_metric_19(metric_22),
    .i_metric_20(metric_18),.i_metric_21(metric_2),.i_metric_22(metric_34),.i_metric_23(metric_42),.i_metric_24(metric_10),.i_metric_25(metric_11),.i_metric_26(metric_43),.i_metric_27(metric_35),.i_metric_28(metric_3),.i_metric_29(metric_19),
    .i_metric_30(metric_23),.i_metric_31(metric_7),

    //output metric
    .o_metric(w_metric_4_1)

);

//bit5
MC S5_0(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_12),.i_metric_1(metric_14),.i_metric_2(metric_28),.i_metric_3(metric_60),.i_metric_4(metric_44),.i_metric_5(metric_46),.i_metric_6(metric_62),.i_metric_7(metric_30),.i_metric_8(metric_24),.i_metric_9(metric_56),
    .i_metric_10(metric_48),.i_metric_11(metric_52),.i_metric_12(metric_36),.i_metric_13(metric_38),.i_metric_14(metric_54),.i_metric_15(metric_50),.i_metric_16(metric_58),.i_metric_17(metric_26),.i_metric_18(metric_8),.i_metric_19(metric_40),
    .i_metric_20(metric_32),.i_metric_21(metric_0),.i_metric_22(metric_16),.i_metric_23(metric_20),.i_metric_24(metric_4),.i_metric_25(metric_6),.i_metric_26(metric_22),.i_metric_27(metric_18),.i_metric_28(metric_2),.i_metric_29(metric_34),
    .i_metric_30(metric_42),.i_metric_31(metric_10),

    //output metric
    .o_metric(w_metric_5_0)

);

MC S5_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    //input metric
    .i_metric_0(metric_15),.i_metric_1(metric_13),.i_metric_2(metric_31),.i_metric_3(metric_63),.i_metric_4(metric_47),.i_metric_5(metric_45),.i_metric_6(metric_61),.i_metric_7(metric_29),.i_metric_8(metric_27),.i_metric_9(metric_59),
    .i_metric_10(metric_51),.i_metric_11(metric_55),.i_metric_12(metric_39),.i_metric_13(metric_37),.i_metric_14(metric_53),.i_metric_15(metric_49),.i_metric_16(metric_57),.i_metric_17(metric_25),.i_metric_18(metric_11),.i_metric_19(metric_43),
    .i_metric_20(metric_35),.i_metric_21(metric_3),.i_metric_22(metric_19),.i_metric_23(metric_23),.i_metric_24(metric_7),.i_metric_25(metric_5),.i_metric_26(metric_21),.i_metric_27(metric_17),.i_metric_28(metric_1),.i_metric_29(metric_33),
    .i_metric_30(metric_41),.i_metric_31(metric_9),

    //output metric
    .o_metric(w_metric_5_1)

);

endmodule

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
