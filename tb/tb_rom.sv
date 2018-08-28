`timescale 1 ps / 1 ps
module tb_rom;

parameter DATA_WIDTH        = 8;
parameter ADDR_WIDTH        = 5;
parameter REGISTERED_OUTPUT = 1;
parameter INIT_FILE         = "./init.txt";

parameter CLK_T = 10000;

logic                  clk;
logic [ADDR_WIDTH-1:0] rd_addr;
logic [DATA_WIDTH-1:0] rd_data;

initial
  begin
    clk     = 1'b0;
    rd_addr = '0;
  end

task automatic clk_gen;
  forever
    begin
      #( CLK_T / 2 );
      clk <= ~clk;
    end
endtask

dual_port_ram #(
  .DATA_WIDTH        ( DATA_WIDTH        ),
  .ADDR_WIDTH        ( ADDR_WIDTH        ),
  .REGISTERED_OUTPUT ( REGISTERED_OUTPUT ),
  .INIT_FILE         ( INIT_FILE         )
) DUT (
  .wr_clk_i          ( clk               ),
  .wr_addr_i         ( 5'd0              ),
  .wr_data_i         ( 8'd0              ),
  .wr_i              ( 1'b0              ),
  .rd_clk_i          ( clk               ),
  .rd_addr_i         ( rd_addr           ),
  .rd_data_o         ( rd_data           ),
  .rd_i              ( 1'b1              )
);

initial
  begin
    fork
      clk_gen;
    join_none
    repeat(100)
    @( posedge clk );
    for( bit [4:0] i = 0; i < 5'd31; i++ )
      begin
        rd_addr <= i;
        @( posedge clk );
      end
    repeat( 10 )
      @( posedge clk );
    $stop;
  end

endmodule
