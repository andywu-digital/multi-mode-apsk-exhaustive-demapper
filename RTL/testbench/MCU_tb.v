module MCU_tb();

//=======================================//
// Parameter                             //
//=======================================//

parameter wordlength = 18;
parameter system_clk_period = 10;

integer index = 0;
integer index_o = 0;

//=======================================//
// Wire & Reg                            //
//=======================================//

reg clk = 0;

wire [wordlength-1:0] i_re_h;
wire [wordlength-1:0] i_im_h;
wire [wordlength-1:0] i_re_u;
wire [wordlength-1:0] i_im_u; 

wire [(4*wordlength-1):0] CPE_INPUT;

//=======================================//
// Load Input File                       //
//=======================================//

reg [(5*wordlength-1):0] CPE_IMEM [1:16200];

initial begin

    $readmemb("C:/Users/user/Favorites/Desktop/ES/matlab/data/txt/CPE_input", CPE_IMEM);

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

always @ (posedge clk) begin

    if(index < 16200)
        index = index + 1;
    else
        $finish;

end

assign CPE_INPUT = CPE_IMEM[index];

assign i_re_h = CPE_INPUT[71:54];
assign i_im_h = CPE_INPUT[53:36];
assign i_re_u = CPE_INPUT[35:18];
assign i_im_u = CPE_INPUT[17:0];

assign rst_n = 1'b1;
assign en = 1'b1;

//=======================================//
// DUT                                   //
//=======================================//

CHIP C_1(

    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 
    .i_re_h(i_re_h), 
    .i_im_h(i_im_h), 
    .i_re_u(i_re_u), 
    .i_im_u(i_im_u) 

);

//=======================================//
// Verification                          //
//=======================================//


endmodule