transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32 {C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32/RF_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32 {C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32/dff_pos.v}

vlog -vlog01compat -work work +incdir+C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32 {C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/RF_32/RF_32_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  RF_32_TB

add wave *
view structure
view signals
run -all
