module MMCU#(

	parameter wordlength = 18,
	parameter LLR_wordlength = 19,
	parameter fraction = 10,
	parameter sym_num = 64,
	parameter bit_num = 6
)(
	input wire 			clk, rst_n,
	input wire [wordlength-1:0] 	w_u_re, w_u_im,
	input wire [wordlength-1:0] 	w_h,
	input wire [wordlength-1:0] 	LUT_real_0, LUT_real_1, LUT_real_2, LUT_real_3, LUT_real_4, LUT_real_5, LUT_real_6, LUT_real_7, LUT_real_8, LUT_real_9, 
					LUT_real_10, LUT_real_11, LUT_real_12, LUT_real_13, LUT_real_14, LUT_real_15, LUT_real_16, LUT_real_17, LUT_real_18, LUT_real_19, 
					LUT_real_20, LUT_real_21, LUT_real_22, LUT_real_23, LUT_real_24, LUT_real_25, LUT_real_26, LUT_real_27, LUT_real_28, LUT_real_29, 
					LUT_real_30, LUT_real_31, LUT_real_32, LUT_real_33, LUT_real_34, LUT_real_35, LUT_real_36, LUT_real_37, LUT_real_38, LUT_real_39, 
					LUT_real_40, LUT_real_41, LUT_real_42, LUT_real_43, LUT_real_44, LUT_real_45, LUT_real_46, LUT_real_47, LUT_real_48, LUT_real_49, 
					LUT_real_50, LUT_real_51, LUT_real_52, LUT_real_53, LUT_real_54, LUT_real_55, LUT_real_56, LUT_real_57, LUT_real_58, LUT_real_59, 
					LUT_real_60, LUT_real_61, LUT_real_62, LUT_real_63,

	input wire [wordlength-1:0] 	LUT_imag_0, LUT_imag_1, LUT_imag_2, LUT_imag_3, LUT_imag_4, LUT_imag_5, LUT_imag_6, LUT_imag_7, LUT_imag_8, LUT_imag_9, 
					LUT_imag_10, LUT_imag_11, LUT_imag_12, LUT_imag_13, LUT_imag_14, LUT_imag_15, LUT_imag_16, LUT_imag_17, LUT_imag_18, LUT_imag_19, 
					LUT_imag_20, LUT_imag_21, LUT_imag_22, LUT_imag_23, LUT_imag_24, LUT_imag_25, LUT_imag_26, LUT_imag_27, LUT_imag_28, LUT_imag_29, 
					LUT_imag_30, LUT_imag_31, LUT_imag_32, LUT_imag_33, LUT_imag_34, LUT_imag_35, LUT_imag_36, LUT_imag_37, LUT_imag_38, LUT_imag_39, 
					LUT_imag_40, LUT_imag_41, LUT_imag_42, LUT_imag_43, LUT_imag_44, LUT_imag_45, LUT_imag_46, LUT_imag_47, LUT_imag_48, LUT_imag_49, 
					LUT_imag_50, LUT_imag_51, LUT_imag_52, LUT_imag_53, LUT_imag_54, LUT_imag_55, LUT_imag_56, LUT_imag_57, LUT_imag_58, LUT_imag_59, 
					LUT_imag_60, LUT_imag_61, LUT_imag_62, LUT_imag_63,

	output wire [wordlength-1:0] 	metric_0, metric_1, metric_2, metric_3, metric_4, metric_5, metric_6, metric_7, metric_8, metric_9, 
					metric_10, metric_11, metric_12, metric_13, metric_14, metric_15, metric_16, metric_17, metric_18, metric_19, 
					metric_20, metric_21, metric_22, metric_23, metric_24, metric_25, metric_26, metric_27, metric_28, metric_29, 
					metric_30, metric_31, metric_32, metric_33, metric_34, metric_35, metric_36, metric_37, metric_38, metric_39, 
					metric_40, metric_41, metric_42, metric_43, metric_44, metric_45, metric_46, metric_47, metric_48, metric_49, 
					metric_50, metric_51, metric_52, metric_53, metric_54, metric_55, metric_56, metric_57, metric_58, metric_59, 
					metric_60, metric_61, metric_62, metric_63

);

MCU M0(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_0), .s_im_i(LUT_imag_0), .metric_o(metric_0));
MCU M1(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_1), .s_im_i(LUT_imag_1), .metric_o(metric_1));
MCU M2(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_2), .s_im_i(LUT_imag_2), .metric_o(metric_2));
MCU M3(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_3), .s_im_i(LUT_imag_3), .metric_o(metric_3));
MCU M4(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_4), .s_im_i(LUT_imag_4), .metric_o(metric_4));
MCU M5(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_5), .s_im_i(LUT_imag_5), .metric_o(metric_5));
MCU M6(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_6), .s_im_i(LUT_imag_6), .metric_o(metric_6));
MCU M7(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_7), .s_im_i(LUT_imag_7), .metric_o(metric_7));
MCU M8(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_8), .s_im_i(LUT_imag_8), .metric_o(metric_8));
MCU M9(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_9), .s_im_i(LUT_imag_9), .metric_o(metric_9));
MCU M10(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_10), .s_im_i(LUT_imag_10), .metric_o(metric_10));
MCU M11(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_11), .s_im_i(LUT_imag_11), .metric_o(metric_11));
MCU M12(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_12), .s_im_i(LUT_imag_12), .metric_o(metric_12));
MCU M13(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_13), .s_im_i(LUT_imag_13), .metric_o(metric_13));
MCU M14(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_14), .s_im_i(LUT_imag_14), .metric_o(metric_14));
MCU M15(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_15), .s_im_i(LUT_imag_15), .metric_o(metric_15));
MCU M16(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_16), .s_im_i(LUT_imag_16), .metric_o(metric_16));
MCU M17(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_17), .s_im_i(LUT_imag_17), .metric_o(metric_17));
MCU M18(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_18), .s_im_i(LUT_imag_18), .metric_o(metric_18));
MCU M19(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_19), .s_im_i(LUT_imag_19), .metric_o(metric_19));
MCU M20(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_20), .s_im_i(LUT_imag_20), .metric_o(metric_20));
MCU M21(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_21), .s_im_i(LUT_imag_21), .metric_o(metric_21));
MCU M22(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_22), .s_im_i(LUT_imag_22), .metric_o(metric_22));
MCU M23(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_23), .s_im_i(LUT_imag_23), .metric_o(metric_23));
MCU M24(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_24), .s_im_i(LUT_imag_24), .metric_o(metric_24));
MCU M25(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_25), .s_im_i(LUT_imag_25), .metric_o(metric_25));
MCU M26(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_26), .s_im_i(LUT_imag_26), .metric_o(metric_26));
MCU M27(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_27), .s_im_i(LUT_imag_27), .metric_o(metric_27));
MCU M28(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_28), .s_im_i(LUT_imag_28), .metric_o(metric_28));
MCU M29(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_29), .s_im_i(LUT_imag_29), .metric_o(metric_29));
MCU M30(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_30), .s_im_i(LUT_imag_30), .metric_o(metric_30));
MCU M31(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_31), .s_im_i(LUT_imag_31), .metric_o(metric_31));
MCU M32(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_32), .s_im_i(LUT_imag_32), .metric_o(metric_32));
MCU M33(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_33), .s_im_i(LUT_imag_33), .metric_o(metric_33));
MCU M34(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_34), .s_im_i(LUT_imag_34), .metric_o(metric_34));
MCU M35(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_35), .s_im_i(LUT_imag_35), .metric_o(metric_35));
MCU M36(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_36), .s_im_i(LUT_imag_36), .metric_o(metric_36));
MCU M37(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_37), .s_im_i(LUT_imag_37), .metric_o(metric_37));
MCU M38(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_38), .s_im_i(LUT_imag_38), .metric_o(metric_38));
MCU M39(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_39), .s_im_i(LUT_imag_39), .metric_o(metric_39));
MCU M40(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_40), .s_im_i(LUT_imag_40), .metric_o(metric_40));
MCU M41(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_41), .s_im_i(LUT_imag_41), .metric_o(metric_41));
MCU M42(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_42), .s_im_i(LUT_imag_42), .metric_o(metric_42));
MCU M43(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_43), .s_im_i(LUT_imag_43), .metric_o(metric_43));
MCU M44(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_44), .s_im_i(LUT_imag_44), .metric_o(metric_44));
MCU M45(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_45), .s_im_i(LUT_imag_45), .metric_o(metric_45));
MCU M46(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_46), .s_im_i(LUT_imag_46), .metric_o(metric_46));
MCU M47(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_47), .s_im_i(LUT_imag_47), .metric_o(metric_47));
MCU M48(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_48), .s_im_i(LUT_imag_48), .metric_o(metric_48));
MCU M49(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_49), .s_im_i(LUT_imag_49), .metric_o(metric_49));
MCU M50(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_50), .s_im_i(LUT_imag_50), .metric_o(metric_50));
MCU M51(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_51), .s_im_i(LUT_imag_51), .metric_o(metric_51));
MCU M52(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_52), .s_im_i(LUT_imag_52), .metric_o(metric_52));
MCU M53(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_53), .s_im_i(LUT_imag_53), .metric_o(metric_53));
MCU M54(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_54), .s_im_i(LUT_imag_54), .metric_o(metric_54));
MCU M55(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_55), .s_im_i(LUT_imag_55), .metric_o(metric_55));
MCU M56(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_56), .s_im_i(LUT_imag_56), .metric_o(metric_56));
MCU M57(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_57), .s_im_i(LUT_imag_57), .metric_o(metric_57));
MCU M58(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_58), .s_im_i(LUT_imag_58), .metric_o(metric_58));
MCU M59(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_59), .s_im_i(LUT_imag_59), .metric_o(metric_59));
MCU M60(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_60), .s_im_i(LUT_imag_60), .metric_o(metric_60));
MCU M61(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_61), .s_im_i(LUT_imag_61), .metric_o(metric_61));
MCU M62(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_62), .s_im_i(LUT_imag_62), .metric_o(metric_62));
MCU M63(.rst_n(rst_n), .clk(clk), .u_re_i(w_u_re), .u_im_i(w_u_im), .h_i(w_h), .s_re_i(LUT_real_63), .s_im_i(LUT_imag_63), .metric_o(metric_63));

endmodule
