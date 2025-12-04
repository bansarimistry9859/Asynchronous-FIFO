transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/synchronizer.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/wptr_handler.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/rptr_handler.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/fifo_mem.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/asyncfifo.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/asyncfifo_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  asyncfifo_tb

add wave *
view structure
view signals
run -all
