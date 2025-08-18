`define WORDLENGTH 18 //Q8.10
`define FRACTION 10

module MCU(clk, rst_n, u_re_i, u_im_i, h_i, s_re_i, s_im_i, metric_o);

// =============== //
// IO
// =============== //
input clk;
input rst_n;
input   signed  [`WORDLENGTH-1:0]   u_re_i, u_im_i, h_i, s_re_i, s_im_i;
output  reg signed  [`WORDLENGTH-1:0]   metric_o;

// ================== //
// h*s
// ================== //
// ----- Signal ----- //
wire    is_inf;
wire[`WORDLENGTH-1:0] full_bits;
wire    signed  [2*`WORDLENGTH-1:0] hs_re_t, hs_im_t;
wire    signed  [`WORDLENGTH-1:0]   hs_re, hs_im;
// ------------------ //
assign full_bits = { `WORDLENGTH{1'b1} };
assign is_inf = (s_re_i==full_bits)&&(s_im_i==full_bits);

assign hs_re_t = h_i*s_re_i;
assign hs_re = (hs_re_t[`FRACTION +`WORDLENGTH - 1:`FRACTION]);               
assign hs_im_t = h_i*s_im_i;
assign hs_im = (hs_im_t[`FRACTION +`WORDLENGTH - 1:`FRACTION]);

// ================== //
// u - h*s
// ================== //
// ----- Signal ----- //
wire    signed  [`WORDLENGTH-1:0]   m_sub_re, m_sub_im;
// ------------------ //
assign m_sub_re = u_re_i - hs_re;
assign m_sub_im = u_im_i - hs_im;

// ================== //
// square
// ================== //
// ----- Signal ----- //
wire    signed  [2*`WORDLENGTH-1:0] m_squ_re_t, m_squ_im_t;
wire    signed  [`WORDLENGTH-1:0]   m_squ_re, m_squ_im;
// ------------------ //
assign m_squ_re_t = m_sub_re*m_sub_re;
assign m_squ_re = $signed(m_squ_re_t[`FRACTION +`WORDLENGTH - 1:`FRACTION]);
assign m_squ_im_t = m_sub_im*m_sub_im;
assign m_squ_im = $signed(m_squ_im_t[`FRACTION +`WORDLENGTH - 1:`FRACTION]);

// ================== //
// addition
// ================== //
wire [`WORDLENGTH-1:0] inf_metric;
wire [`WORDLENGTH-1:0] w_metric_o;
assign inf_metric= {1'b0, {(`WORDLENGTH-1){1'b1}} };
assign w_metric_o =(is_inf)? inf_metric:(m_squ_re + m_squ_im);

// ================== //
// Output Reg
// ================== //

always @ (posedge clk) begin

    if(!rst_n)
        metric_o <= 18'b0;
    else
        metric_o <= w_metric_o;
end

endmodule
