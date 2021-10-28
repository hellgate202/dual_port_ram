module dual_port_ram #(
  parameter int DATA_WIDTH        = 8,
  parameter int ADDR_WIDTH        = 5,
  parameter int USE_LUTS          = 0,
  parameter     INIT_FILE         = ""
)(
  input                       wr_clk_i,
  input [ADDR_WIDTH - 1 : 0]  wr_addr_i,
  input [DATA_WIDTH - 1 : 0]  wr_data_i,
  input                       wr_i,
  input                       rd_clk_i,
  input  [ADDR_WIDTH - 1 : 0] rd_addr_i,
  output [DATA_WIDTH - 1 : 0] rd_data_o,
  input                       rd_i
);

logic [DATA_WIDTH - 1 : 0]                          ram_block [2 ** ADDR_WIDTH - 1 : 0];
logic [2 ** ADDR_WIDTH - 1 : 0][DATA_WIDTH - 1 : 0] ram_lut;
logic [DATA_WIDTH - 1 : 0]                          rd_data;

generate
  if( !USE_LUTS )
    begin : block
      initial
        if( INIT_FILE != "" )
          $readmemh( INIT_FILE, ram_block );

      always_ff @( posedge wr_clk_i )
        if( wr_i )
          ram_block[wr_addr_i] <= wr_data_i;
      
      always_ff @( posedge rd_clk_i )
        if( rd_i )
          rd_data <= ram_block[rd_addr_i];
    end
  else
    begin : lut
      always_ff @( posedge wr_clk_i )
        if( wr_i )
          ram_lut[wr_addr_i] <= wr_data_i;
      
      always_ff @( posedge rd_clk_i )
        if( rd_i )
          rd_data <= ram_lut[rd_addr_i];
    end
endgenerate

assign rd_data_o = rd_data;

endmodule
