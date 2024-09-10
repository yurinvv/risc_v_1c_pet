//==================================================================================================
// (c) Copyright 1988 Yurins Family. All rights reserved.
//
//
//  Filename      : register_file.sv
//  Created On    : 2024-09-09
//  Last Modified : 2024-09-09
//  Revision      :
//  Author        : Vasiliy Yurin
//  Company       : Yurins Family
//  Email         : 
//  Description   : Demo RISC-V register file. 
//==================================================================================================

`ifndef RESET_TYPE
	`define RESET_TYPE(X) or posedge X
	`define RESET_LEVEL(X) X
`endif

module register_file#(
	localparam A_WIDTH = $clog(32),
	localparam D_WIDTH = 32
)(
  input  clk ,
  input  rst ,
  input  [A_WIDTH-1:0] addr,
  input  [D_WIDTH-1:0] we ,
  input  [D_WIDTH-1:0] wd ,
  output [D_WIDTH-1:0] rd1 ,
  output [D_WIDTH-1:0] rd2
);


// RISC-V Registers
  struct {
    logic [D_WIDTH-1:0] t6   ; //[31] Temporary Registers
    logic [D_WIDTH-1:0] t5   ; //[30] Temporary Registers
    logic [D_WIDTH-1:0] t4   ; //[29] Temporary Registers
    logic [D_WIDTH-1:0] t3   ; //[28] Temporary Registers
    logic [D_WIDTH-1:0] s11  ; //[27] Saved Registers
    logic [D_WIDTH-1:0] s10  ; //[26] Saved Registers
    logic [D_WIDTH-1:0] s9   ; //[25] Saved Registers
    logic [D_WIDTH-1:0] s8   ; //[24] Saved Registers
    logic [D_WIDTH-1:0] s7   ; //[23] Saved Registers
    logic [D_WIDTH-1:0] s6   ; //[22] Saved Registers
    logic [D_WIDTH-1:0] s5   ; //[21] Saved Registers
    logic [D_WIDTH-1:0] s4   ; //[20] Saved Registers
    logic [D_WIDTH-1:0] s3   ; //[19] Saved Registers
    logic [D_WIDTH-1:0] s2   ; //[18] Saved Registers
    logic [D_WIDTH-1:0] a7   ; //[17] Function Argument Registers
    logic [D_WIDTH-1:0] a6   ; //[16] Function Argument Registers
    logic [D_WIDTH-1:0] a5   ; //[15] Function Argument Registers
    logic [D_WIDTH-1:0] a4   ; //[14] Function Argument Registers
    logic [D_WIDTH-1:0] a3   ; //[13] Function Argument Registers
    logic [D_WIDTH-1:0] a2   ; //[12] Function Argument Registers
    logic [D_WIDTH-1:0] a1   ; //[11] Function Argument Registers
    logic [D_WIDTH-1:0] a0   ; //[10] Function Argument/Return Value Registers
    logic [D_WIDTH-1:0] s1   ; //[9]  Saved Register
    logic [D_WIDTH-1:0] s0   ; //[8]  Saved Register (fp - Frame Pointer)
    logic [D_WIDTH-1:0] t2   ; //[7]  Temporary Register
    logic [D_WIDTH-1:0] t1   ; //[6]  Temporary Register
    logic [D_WIDTH-1:0] t0   ; //[5]  Temporary/Alternate Link Register
    logic [D_WIDTH-1:0] tp   ; //[4]  Thread Pointer
    logic [D_WIDTH-1:0] gp   ; //[3]  Global Pointer
    logic [D_WIDTH-1:0] sp   ; //[2]  Stack Pointer
    logic [D_WIDTH-1:0] ra   ; //[1]  Return Address
    logic [D_WIDTH-1:0] zero ; //[0]  Hard-Wired Zero
  } x;

  /**************************
  * x0 - Zero
  **************************/
  
  assign x.zero = '0;

  /**************************
  * x1 - ra - Return Address
  **************************/

  always_ff @(posedge clk `RESET_TYPE(rst)) begin : ra_reg_proc
    if (`RESET_LEVEL(rst)) begin
      x.ra <= '0;
    end else begin
	  x.ra <= '0;
	end : ra_reg_proc


endmodule