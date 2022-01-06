onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DataPathTBfinal/CLK
add wave -noupdate /DataPathTBfinal/Reset
add wave -noupdate -radix hexadecimal /DataPathTBfinal/GPIO_I
add wave -noupdate -radix hexadecimal /DataPathTBfinal/GPIO_O
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/PCout
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/DataRegOut
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/Dat1Out
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/Dat2Out
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/InsRegOut
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/AluMOut
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/RegAout
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/RegBout
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/MuxRegFile
add wave -noupdate -radix hexadecimal /DataPathTBfinal/DP/DataRegOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1090 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {1076 ps} {1396 ps}
