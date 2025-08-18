module CPE_tb();

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
wire rst_n;
wire en;

wire [(wordlength-1):0] re_hi;
wire [(wordlength-1):0] im_hi;
wire [(wordlength-1):0] re_ui;
wire [(wordlength-1):0] im_ui;

wire valid;
wire [(wordlength-1):0] h_o;
wire [(wordlength-1):0] u_re_o;
wire [(wordlength-1):0] u_im_o;
wire [(wordlength-1):0] phase_o;

wire [(4*wordlength-1):0] CPE_INPUT;
wire [(5*wordlength-1):0] CPE_OUTPUT;

wire [(wordlength-1):0] h_o_v;
wire [(wordlength-1):0] u_re_o_v;
wire [(wordlength-1):0] u_im_o_v;
wire [(wordlength-1):0] phase_o_v;

wire [3:0]  correct_b;
wire        correct; 

//=======================================//
// Load Input File                       //
//=======================================//

reg [(4*wordlength-1):0] CPE_IMEM [1:16200];
reg [(5*wordlength-1):0] CPE_OMEM [1:16200];

initial begin

    $readmemb("C:/Users/user/Favorites/Desktop/ES/matlab/data/txt/CPE_input", CPE_IMEM);
    $readmemb("C:/Users/user/Favorites/Desktop/ES/matlab/data/txt/CPE_output", CPE_OMEM);

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

assign re_hi = CPE_INPUT[71:54];
assign im_hi = CPE_INPUT[53:36];
assign re_ui = CPE_INPUT[35:18];
assign im_ui = CPE_INPUT[17:0];

assign rst_n = 1'b1;
assign en = 1'b1;

//=======================================//
// DUT                                   //
//=======================================//

CPE CPE_1(

    //input
    .clk(clk), 
    .rst_n(rst_n), 
    .en(en), 
    .re_hi(re_hi), 
    .im_hi(im_hi), 
    .re_ui(re_ui), 
    .im_ui(im_ui),

    //output
    .valid(valid), 
    .h_o(h_o), 
    .u_re_o(u_re_o), 
    .u_im_o(u_im_o), 
    .phase_o(phase_o)

);

//=======================================//
// Verification                          //
//=======================================//

always @ (posedge clk) begin

    if((index < 16200)&&(valid==1'b1))
        index_o = index_o + 1;

end

assign CPE_OUTPUT = CPE_OMEM[index_o];

assign h_o_v = CPE_OUTPUT[89:72];
assign u_re_o_v = CPE_OUTPUT[53:36];
assign u_im_o_v = CPE_OUTPUT[35:18];
assign phase_o_v = CPE_OUTPUT[17:0];

assign correct_b[0] = (h_o == h_o_v) ? 1'b1 : 1'b0;
assign correct_b[1] = (u_re_o == u_re_o_v) ? 1'b1 : 1'b0;
assign correct_b[2] = (u_im_o == u_im_o_v) ? 1'b1 : 1'b0;
assign correct_b[3] = (phase_o == phase_o_v) ? 1'b1 : 1'b0;

assign correct = &correct_b;



endmodule