transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/test_FIFO/test_fifo {D:/FPGA/test_FIFO/test_fifo/test_fifo.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/test_FIFO/test_fifo {D:/FPGA/test_FIFO/test_fifo/fifo_module.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/test_FIFO/test_fifo {D:/FPGA/test_FIFO/test_fifo/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
