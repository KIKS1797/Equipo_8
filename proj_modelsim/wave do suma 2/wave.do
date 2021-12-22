onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_ADDyADDI/clk
add wave -noupdate -radix unsigned /TB_ADDyADDI/ledr
add wave -noupdate /TB_ADDyADDI/sw
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_control
add wave -noupdate -radix unsigned /TB_ADDyADDI/DUV/fsm1/sec
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Funct
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/op
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/PC/one_register_o
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_reg_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_srcA_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_srcB_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Branch
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/IR_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/PC_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Pc_src_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Reg_write
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/reg_file/r16
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/reg_file/r17
add wave -noupdate -radix binary /TB_ADDyADDI/DUV/mi1/reg_file/r18
add wave -noupdate /TB_ADDyADDI/DUV/mi1/reg_file/r19
add wave -noupdate /TB_ADDyADDI/DUV/mi1/alu1/Z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {608 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 55
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2399 ns}
