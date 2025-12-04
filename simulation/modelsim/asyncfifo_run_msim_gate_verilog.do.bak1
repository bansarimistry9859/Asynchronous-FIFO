transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {asyncfifo.vo}

vlog -vlog01compat -work work +incdir+D:/intelFPGA/ASYNC\ FIFO\ D {D:/intelFPGA/ASYNC FIFO D/asyncfifo_tb.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L cyclonev_ver -L lpm_ver -L sgate_ver -L cyclonev_hssi_ver -L altera_mf_ver -L cyclonev_pcie_hip_ver -L gate_work -L work -voptargs="+acc"  asyncfifo_tb

add wave *
view structure
view signals
run -all
