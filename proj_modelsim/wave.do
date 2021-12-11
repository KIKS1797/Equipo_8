onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mips_milti_rb/clk
add wave -noupdate /Mips_milti_rb/reset
add wave -noupdate /Mips_milti_rb/PC_write
add wave -noupdate /Mips_milti_rb/Mem_write
add wave -noupdate /Mips_milti_rb/lorD_mux
add wave -noupdate /Mips_milti_rb/IR_write
add wave -noupdate /Mips_milti_rb/Reg_Dst_mux
add wave -noupdate /Mips_milti_rb/Mem_reg_mux
add wave -noupdate /Mips_milti_rb/Reg_write
add wave -noupdate /Mips_milti_rb/ALU_srcA_mux
add wave -noupdate /Mips_milti_rb/ALU_srcB_mux
add wave -noupdate /Mips_milti_rb/ALU_control
add wave -noupdate /Mips_milti_rb/Pc_src_mux
add wave -noupdate /Mips_milti_rb/Branch
add wave -noupdate /Mips_milti_rb/gpio_o
add wave -noupdate /Mips_milti_rb/Funct
add wave -noupdate /Mips_milti_rb/Op
add wave -noupdate /Mips_milti_rb/Funcyop
add wave -noupdate /Mips_milti_rb/signimm_test
add wave -noupdate /Mips_milti_rb/signimm_test1
add wave -noupdate /Mips_milti_rb/signimm_test2
add wave -noupdate /Mips_milti_rb/r0
add wave -noupdate /Mips_milti_rb/r1
add wave -noupdate /Mips_milti_rb/r2
add wave -noupdate /Mips_milti_rb/r3
add wave -noupdate /Mips_milti_rb/r4
add wave -noupdate /Mips_milti_rb/r5
add wave -noupdate /Mips_milti_rb/r6
add wave -noupdate /Mips_milti_rb/r7
add wave -noupdate /Mips_milti_rb/r8
add wave -noupdate /Mips_milti_rb/r9
add wave -noupdate /Mips_milti_rb/r10
add wave -noupdate /Mips_milti_rb/r11
add wave -noupdate /Mips_milti_rb/r12
add wave -noupdate /Mips_milti_rb/r13
add wave -noupdate /Mips_milti_rb/r14
add wave -noupdate /Mips_milti_rb/r15
add wave -noupdate /Mips_milti_rb/r16
add wave -noupdate /Mips_milti_rb/r17
add wave -noupdate /Mips_milti_rb/r18
add wave -noupdate /Mips_milti_rb/r19
add wave -noupdate /Mips_milti_rb/r20
add wave -noupdate /Mips_milti_rb/r21
add wave -noupdate /Mips_milti_rb/r22
add wave -noupdate /Mips_milti_rb/r23
add wave -noupdate /Mips_milti_rb/r24
add wave -noupdate /Mips_milti_rb/r25
add wave -noupdate /Mips_milti_rb/r26
add wave -noupdate /Mips_milti_rb/r27
add wave -noupdate /Mips_milti_rb/r28
add wave -noupdate /Mips_milti_rb/r29
add wave -noupdate /Mips_milti_rb/r30
add wave -noupdate /Mips_milti_rb/r31
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {5 ns} {102 ns}
