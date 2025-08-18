module cu#(
	parameter wordlength = 18,
	parameter LLR_wordlength = 19,
	parameter fraction = 10,
	parameter sym_num = 64,
	parameter bit_num = 6
)(
	input wire clk, rst_n, en,
	input wire [wordlength-1:0] 	metric[0], metric[1], metric[2], metric[3], metric[4], metric[5], metric[6], metric[7], metric[8], metric[9], 
					metric[10], metric[11], metric[12], metric[13], metric[14], metric[15], metric[16], metric[17], metric[18], metric[19], 
					metric[20], metric[21], metric[22], metric[23], metric[24], metric[25], metric[26], metric[27], metric[28], metric[29], 
					metric[30], metric[31], metric[32], metric[33], metric[34], metric[35], metric[36], metric[37], metric[38], metric[39], 
					metric[40], metric[41], metric[42], metric[43], metric[44], metric[45], metric[46], metric[47], metric[48], metric[49], 
					metric[50], metric[51], metric[52], metric[53], metric[54], metric[55], metric[56], metric[57], metric[58], metric[59], 
					metric[60], metric[61], metric[62], metric[63],
	input wire [wordlength-1:0] 	w_metric_0_0, w_metric_1_0, w_metric_2_0, w_metric_3_0, w_metric_4_0, w_metric_5_0,
					w_metric_0_1, w_metric_1_1, w_metric_2_1, w_metric_3_1, w_metric_4_1, w_metric_5_1
);


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

endmodule
