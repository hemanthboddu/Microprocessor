transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {control_path_6_1200mv_85c_slow.vo}

vcom -93 -work work {/home/rafi/Dropbox/project_1/vhdl codes/control_path_final/simulation/modelsim/testbench_control.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  testbench_control

add wave *
view structure
view signals
run -all
