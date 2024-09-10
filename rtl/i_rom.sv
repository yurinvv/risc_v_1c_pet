//==================================================================================================
// (c) Copyright 1988 Yurins Family. All rights reserved.
//
//
//  Filename      : register_file.sv
//  Created On    : 2024-09-10
//  Last Modified : 2024-09-10
//  Revision      :
//  Author        : Vasiliy Yurin
//  Company       : Yurins Family
//  Email         : 
//  Description   : Demo RISC-V instruction rom. 
//==================================================================================================

`ifndef I_ROM
  `define I_ROM

`ifndef RESET_TYPE
	`define RESET_TYPE(X) or posedge X
	`define RESET_LEVEL(X) X
`endif

module i_rom#(
  parameter D_WIDTH = 32,
  parameter A_WIDTH = 32
)(
  input  [A_WIDTH-1:0] a,
  output [D_WIDTH-1:0] rd 
);

  reg [D_WIDTH-1:0] rom [$bits(A_WIDTH)-1:0];
  
  initial begin
    $display("Loading i_rom...");
    $readmemh("i_rom_image.mem", rom);
  end

  assign rd = rom[a[D_WIDTH-1:2]]; // word alined

endmodule