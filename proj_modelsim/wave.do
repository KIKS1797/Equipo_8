onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_ADDyADDI/clk
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/ledr
add wave -noupdate /TB_ADDyADDI/sw
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_control
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_srcA_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/ALU_srcB_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Funct
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/IR_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Mem_reg_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Mem_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/PC_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Pc_src_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Reg_Dst_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/Reg_write
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/clock
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/lorD_mux
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/op
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/rst
add wave -noupdate /TB_ADDyADDI/DUV/fsm1/sec
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/reg_file/r9
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/reg_file/r10
add wave -noupdate -radix hexadecimal /TB_ADDyADDI/DUV/mi1/reg_file/r11
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {386 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1516 ns}
