onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rom/DUT/wr_clk_i
add wave -noupdate -radix hexadecimal /tb_rom/DUT/wr_addr_i
add wave -noupdate -radix hexadecimal /tb_rom/DUT/wr_data_i
add wave -noupdate /tb_rom/DUT/wr_i
add wave -noupdate /tb_rom/DUT/rd_clk_i
add wave -noupdate -radix hexadecimal /tb_rom/DUT/rd_addr_i
add wave -noupdate -radix hexadecimal /tb_rom/DUT/rd_data_o
add wave -noupdate /tb_rom/DUT/rd_i
add wave -noupdate -radix hexadecimal /tb_rom/DUT/rd_data
add wave -noupdate -radix hexadecimal /tb_rom/DUT/rd_data_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {372000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 559
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1203285 ps}
