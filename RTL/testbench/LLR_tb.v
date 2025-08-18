module LLR_tb();

//=======================================//
// Parameter                             //
//=======================================//

parameter wordlength = 18;
parameter system_clk_period = 10;

integer index = 0;
integer index_o = 1;

//=======================================//
// Wire & Reg                            //
//=======================================//

reg clk = 0;

wire [wordlength-1:0] i_re_h;
wire [wordlength-1:0] i_im_h;
wire [wordlength-1:0] i_re_u;
wire [wordlength-1:0] i_im_u; 

reg [(4*wordlength-1):0] CPE_INPUT;
reg [(6*19-1):0] LLR_OUTPUT;

wire [19-1:0] LLR_v_0;
wire [19-1:0] LLR_v_1;
wire [19-1:0] LLR_v_2;
wire [19-1:0] LLR_v_3;
wire [19-1:0] LLR_v_4;
wire [19-1:0] LLR_v_5;

wire [19-1:0] LLR_0;
wire [19-1:0] LLR_1;
wire [19-1:0] LLR_2;
wire [19-1:0] LLR_3;
wire [19-1:0] LLR_4;
wire [19-1:0] LLR_5;


wire [5:0] correct_b;

reg [2:0] Mode;

reg rst;

wire pass;

integer correct_num_4;
integer correct_num_8;
integer correct_num_16;
integer correct_num_32;
integer correct_num_64;

reg signed [19-1:0] N0_2;

//=======================================//
// Load Input File                       //
//=======================================//

reg [(5*wordlength-1):0] CPE_IMEM_4 [1:32400];
reg [(6*19-1):0] LLR_OMEM_4 [1:32400];

reg [(5*wordlength-1):0] CPE_IMEM_8 [1:21600];
reg [(6*19-1):0] LLR_OMEM_8 [1:21600];

reg [(5*wordlength-1):0] CPE_IMEM_16 [1:16200];
reg [(6*19-1):0] LLR_OMEM_16 [1:16200];

reg [(5*wordlength-1):0] CPE_IMEM_32 [1:16200];
reg [(6*19-1):0] LLR_OMEM_32 [1:16200];

reg [(5*wordlength-1):0] CPE_IMEM_64 [1:16200];
reg [(6*19-1):0] LLR_OMEM_64 [1:16200];

initial begin


    //QPSK
    $readmemb("../../../../txt/4/CPE_input.txt", CPE_IMEM_4);
    $readmemb("../../../../txt/4/LLR_output.txt", LLR_OMEM_4);

    //8PSK
    $readmemb("../../../../txt/8/CPE_input.txt", CPE_IMEM_8);
    $readmemb("../../../../txt/8/LLR_output.txt", LLR_OMEM_8);

    //16-APSK
    $readmemb("../../../../txt/16/CPE_input.txt", CPE_IMEM_16);
    $readmemb("../../../../txt/16/LLR_output.txt", LLR_OMEM_16);

    //32-APSK
    $readmemb("../../../../txt/32/CPE_input.txt", CPE_IMEM_32);
    $readmemb("../../../../txt/32/LLR_output.txt", LLR_OMEM_32);

    //64-APSK
    $readmemb("../../../../txt/64/CPE_input.txt", CPE_IMEM_64);
    $readmemb("../../../../txt/64/LLR_output.txt", LLR_OMEM_64);

end

//=======================================//
// Clock                                 //
//=======================================//

always begin
    #(system_clk_period/2) clk = ~clk;
end

//=======================================//
// Input                                 //
//=======================================//

initial begin

    correct_num_4 <= 0;
    correct_num_8 <= 0;
    correct_num_16 <= 0;
    correct_num_32 <= 0;
    correct_num_64 <= 0;
    
    rst <= 1'b1;
    Mode <= 3'd0;
    #20000 rst <= 1'b0;
    Mode <= 3'd1;
    #400000 Mode <= 3'd0;
    #10000 Mode <= 3'd2;
    #300000 Mode <= 3'd0;
    #10000 Mode <= 3'd3;
    #200000 Mode <= 3'd0;
    #10000 Mode <= 3'd4;
    #200000 Mode <= 3'd0;
    #10000 Mode <= 3'd5;
    #200000 Mode <= 3'd0;
    #10000 
    $display("4PSK Verification");
    $display("test_num = 32400 pattern");
    $display("correct_num = %d pattern", correct_num_4);
    $display("8PSK Verification");
    $display("test_num = 21600 pattern");
    $display("correct_num = %d pattern", correct_num_8);
    $display("16-APSK Verification");
    $display("test_num = 16200 pattern");
    $display("correct_num = %d pattern", correct_num_16);
    $display("32-APSK Verification");
    $display("test_num = 12960 pattern");
    $display("correct_num = %d pattern", correct_num_32);
    $display("64-APSK Verification");
    $display("test_num = 10800 pattern");
    $display("correct_num = %d pattern", correct_num_64);
    $finish;

end


always @ (posedge clk) begin

    if((rst == 1'b1) || (Mode == 3'd0))
        index = 0;
    else if(index < 32400)
        index = index + 1;
        
end

always @ (posedge clk) begin

    case (Mode)

        3'd1 : CPE_INPUT <= CPE_IMEM_4[index];
        3'd2 : CPE_INPUT <= CPE_IMEM_8[index];
        3'd3 : CPE_INPUT <= CPE_IMEM_16[index];
        3'd4 : CPE_INPUT <= CPE_IMEM_32[index];
        3'd5 : CPE_INPUT <= CPE_IMEM_64[index];
        default : CPE_INPUT <= 72'd0;
                                                   
    endcase

end


assign i_re_h = CPE_INPUT[71:54];
assign i_im_h = CPE_INPUT[53:36];
assign i_re_u = CPE_INPUT[35:18];
assign i_im_u = CPE_INPUT[17:0];

assign rst_n = 1'b1;
assign en = 1'b1;

//N0
always @ (posedge clk) begin

    case (Mode)

        3'd1 : N0_2 <= 19'b0000001001001001000;
        3'd2 : N0_2 <= 19'b0000010101101011100;
        3'd3 : N0_2 <= 19'b0000011111000011001;
        3'd4 : N0_2 <= 19'b0000101101111011010;
        3'd5 : N0_2 <= 19'b0010000110100110101;
        default : N0_2 <= 19'd0;
    endcase
    
end

//=======================================//
// DUT                                   //
//=======================================//

CHIP CHIP(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 

    .Mode(Mode),

    .i_re_h(i_re_h), 
    .i_im_h(i_im_h), 
    .i_re_u(i_re_u), 
    .i_im_u(i_im_u),
    .i_N0_2(N0_2),

    .valid(valid),

    .o_LLR_0(LLR_0),
    .o_LLR_1(LLR_1),
    .o_LLR_2(LLR_2),
    .o_LLR_3(LLR_3),
    .o_LLR_4(LLR_4),
    .o_LLR_5(LLR_5)

);

//=======================================//
// Verification                          //
//=======================================//

always @ (posedge clk) begin

    if(index > 8)
        index_o = index_o + 1;
    else
        index_o = 0;

end

always @ (posedge clk) begin

    if(index > 8) begin

        $display("mode = %d", Mode);
        $display("index = %d", index_o);

        $display("LLR_0 = %b", LLR_0);
        $display("LLR_1 = %b", LLR_1);
        $display("LLR_2 = %b", LLR_2);
        $display("LLR_3 = %b", LLR_3);
        $display("LLR_4 = %b", LLR_4);
        $display("LLR_5 = %b", LLR_5);

        $display("LLR_v_0 = %b", LLR_v_0);
        $display("LLR_v_1 = %b", LLR_v_1);
        $display("LLR_v_2 = %b", LLR_v_2);
        $display("LLR_v_3 = %b", LLR_v_3);
        $display("LLR_v_4 = %b", LLR_v_4);
        $display("LLR_v_5 = %b", LLR_v_5);

        if(pass == 'b1) begin
            $display("correct");
            if(Mode == 'd1)
                correct_num_4 <= correct_num_4 + 1;
            else if(Mode == 'd2)
                correct_num_8 <= correct_num_8 + 1;
            else if(Mode == 'd3)
                correct_num_16 <= correct_num_16 + 1;
            else if(Mode == 'd4)
                correct_num_32 <= correct_num_32 + 1;
            else if(Mode == 'd5)
                correct_num_64 <= correct_num_64 + 1;
            else begin
            end

        end
        else
            $display("uncorrect");

    end
    else begin
        index_o = 0;    
    end

end

always @ (posedge clk) begin

    case (Mode)
    
        3'd1 : LLR_OUTPUT <= LLR_OMEM_4[index_o];
        3'd2 : LLR_OUTPUT <= LLR_OMEM_8[index_o];
        3'd3 : LLR_OUTPUT <= LLR_OMEM_16[index_o];
        3'd4 : LLR_OUTPUT <= LLR_OMEM_32[index_o];
        3'd5 : LLR_OUTPUT <= LLR_OMEM_64[index_o];
        default : LLR_OUTPUT <= 114'd0;

    endcase

end

assign LLR_v_0 = LLR_OUTPUT[113:95];
assign LLR_v_1 = LLR_OUTPUT[94:76];
assign LLR_v_2 = LLR_OUTPUT[75:57];
assign LLR_v_3 = LLR_OUTPUT[56:38];
assign LLR_v_4 = LLR_OUTPUT[37:19];
assign LLR_v_5 = LLR_OUTPUT[18:0];

assign correct_b[0] = (LLR_v_0==LLR_0) ? 1'b1 : 1'b0;
assign correct_b[1] = (LLR_v_1==LLR_1) ? 1'b1 : 1'b0;
assign correct_b[2] = (LLR_v_2==LLR_2) ? 1'b1 : 1'b0;
assign correct_b[3] = (LLR_v_3==LLR_3) ? 1'b1 : 1'b0;
assign correct_b[4] = (LLR_v_4==LLR_4) ? 1'b1 : 1'b0;
assign correct_b[5] = (LLR_v_5==LLR_5) ? 1'b1 : 1'b0;

assign pass = (correct_b == 6'b111111) ? 1'b1 : 1'b0;


endmodule