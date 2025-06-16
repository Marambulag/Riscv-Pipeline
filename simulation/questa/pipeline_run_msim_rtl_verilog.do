transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/program_counter.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/adder.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/mux2.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/fetch.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/control_unit.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/imm_gen.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/register_file.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/decode.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/if_id_register.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/riscv_pipeline.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/id_ex_register.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/alu_control.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/alu.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/mem_wb_register.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/data_memory.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/ex_mem_register.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/mux4.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/hazard_unit.v}
vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/instruction_memory.v}

vlog -vlog01compat -work work +incdir+/home/manuel/rvpipeline {/home/manuel/rvpipeline/ex_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  ex_tb

add wave *
view structure
view signals
run -all
