module dual_port_ram #(
  parameter DATA_WIDTH        = 8,
  parameter ADDR_WIDTH        = 5,
  parameter REGISTERED_OUTPUT = 0,
  parameter INIT_FILE         = ""
)(
  input                   wr_clk_i,
  input [ADDR_WIDTH-1:0]  wr_addr_i,
  input [DATA_WIDTH-1:0]  wr_data_i,
  input                   wr_i,
  input                   rd_clk_i,
  input  [ADDR_WIDTH-1:0] rd_addr_i,
  output [DATA_WIDTH-1:0] rd_data_o,
  input                   rd_i
);

logic [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
logic [DATA_WIDTH-1:0] rd_data;
logic [DATA_WIDTH-1:0] rd_data_reg = '0;

initial
  if( INIT_FILE != "" )
    $readmemh( INIT_FILE, ram );

always_ff @( posedge wr_clk_i )
  if( wr_i )
    ram[wr_addr_i] <= wr_data_i;

always_ff @( posedge rd_clk_i )
  if( rd_i )
    rd_data <= ram[rd_addr_i];

always_ff @( posedge rd_clk_i )
  rd_data_reg <= rd_data;

assign rd_data_o = ( REGISTERED_OUTPUT ) ? rd_data_reg : rd_data;

endmodule
