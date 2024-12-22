transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/bkadder {C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/bkadder/bkadder.v}

vlog -vlog01compat -work work +incdir+C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/bkadder {C:/Users/kajal/OneDrive/Desktop/EDL/Verilog/bkadder/bkadder_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  bkadder_TB

add wave *
view structure
view signals
run -all
