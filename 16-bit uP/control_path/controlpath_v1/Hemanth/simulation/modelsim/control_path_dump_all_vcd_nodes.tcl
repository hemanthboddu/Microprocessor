# Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus Prime License Agreement,
# the Altera MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Altera and sold by Altera or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.


# ***************************************************************************
# ***************************************************************************
# 
# File:		/home/rafi/Dropbox/project_1/vhdl codes/controlpath/Hemanth/simulation/modelsim/control_path_dump_all_vcd_nodes.tcl
# 
# Description:	Script for ModelSim-Altera (Verilog) VCD File Dumping
# 		This script is used to direct ModelSim-Altera (Verilog) to dump
# 		all nodes in the design to a VCD output file
# 
# Usages:	/home/rafi/Dropbox/project_1/vhdl codes/controlpath/Hemanth/simulation/modelsim/control_path_dump_all_vcd_nodes.tcl
# 
# Generated by:	Quartus Prime
# 		Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition
# 
# Date:		Mon Nov  7 23:56:04 2016
# 
# Design:	control_path
# 
# ***************************************************************************
# ***************************************************************************

# ----------------------------------------------------------------
#
proc add_vcd_signals { hierarchy vcd_filename } {
#
# Description:	This function directs ModelSim-Altera (Verilog) to print out the
#		appropriate VCD signals, with the hierarchy level
#		prepended to each signal name
#
# ----------------------------------------------------------------

   catch { vcd add "$hierarchy/state_signal_awb_1_aq" }
   catch { vcd add "$hierarchy/state_signal_awb_0_aq" }
   catch { vcd add "$hierarchy/state_signal_afetch_aq" }
   catch { vcd add "$hierarchy/state_signal_apriority_aq" }
   catch { vcd add "$hierarchy/state_signal_abreq_1_aq" }
   catch { vcd add "$hierarchy/state_signal_adec_0_aq" }
   catch { vcd add "$hierarchy/pcWrite_a0_combout" }
   catch { vcd add "$hierarchy/pcWrite_a1_combout" }
   catch { vcd add "$hierarchy/state_signal_alm_0_aq" }
   catch { vcd add "$hierarchy/rfWrite_a0_combout" }
   catch { vcd add "$hierarchy/irWrite_a0_combout" }
   catch { vcd add "$hierarchy/Equal0_a0_combout" }
   catch { vcd add "$hierarchy/state_signal_alw_0_aq" }
   catch { vcd add "$hierarchy/memRead_a0_combout" }
   catch { vcd add "$hierarchy/memRead_a1_combout" }
   catch { vcd add "$hierarchy/state_signal_asw_0_aq" }
   catch { vcd add "$hierarchy/state_signal_asm_0_aq" }
   catch { vcd add "$hierarchy/memWrite_a0_combout" }
   catch { vcd add "$hierarchy/state_signal_anand_0_aq" }
   catch { vcd add "$hierarchy/alu_op_a0_combout" }
   catch { vcd add "$hierarchy/state_signal_abreq_0_aq" }
   catch { vcd add "$hierarchy/alu_op_a1_combout" }
   catch { vcd add "$hierarchy/mux_mem_addr_a8_combout" }
   catch { vcd add "$hierarchy/mux_a1_a0_combout" }
   catch { vcd add "$hierarchy/enable_pe_out_a0_combout" }
   catch { vcd add "$hierarchy/mux_a3_a0_combout" }
   catch { vcd add "$hierarchy/Equal0_a1_combout" }
   catch { vcd add "$hierarchy/mux_a2_a0_combout" }
   catch { vcd add "$hierarchy/Selector7_a0_combout" }
   catch { vcd add "$hierarchy/mux_a1_a1_combout" }
   catch { vcd add "$hierarchy/state_signal_aadd_0_aq" }
   catch { vcd add "$hierarchy/mux_a_a0_combout" }
   catch { vcd add "$hierarchy/Equal0_a2_combout" }
   catch { vcd add "$hierarchy/mux_a_a1_combout" }
   catch { vcd add "$hierarchy/Equal0_a3_combout" }
   catch { vcd add "$hierarchy/Equal0_a4_combout" }
   catch { vcd add "$hierarchy/Equal0_a5_combout" }
   catch { vcd add "$hierarchy/mux_d3_a2_combout" }
   catch { vcd add "$hierarchy/mux_pc_a2_combout" }
   catch { vcd add "$hierarchy/mux_pc_a3_combout" }
   catch { vcd add "$hierarchy/next_state_var_a2_combout" }
   catch { vcd add "$hierarchy/Equal0_a6_combout" }
   catch { vcd add "$hierarchy/mux_before_a_a0_combout" }
   catch { vcd add "$hierarchy/enable_alu_a0_combout" }
   catch { vcd add "$hierarchy/enable_alu_a1_combout" }
   catch { vcd add "$hierarchy/Equal0_a7_combout" }
   catch { vcd add "$hierarchy/enable_a_a2_combout" }
   catch { vcd add "$hierarchy/enable_b_a2_combout" }
   catch { vcd add "$hierarchy/enable_alu_a2_combout" }
   catch { vcd add "$hierarchy/enable_c_a0_combout" }
   catch { vcd add "$hierarchy/enable_pe_tmp_a0_combout" }
   catch { vcd add "$hierarchy/enable_carry_flag_a2_combout" }
   catch { vcd add "$hierarchy/a_anext_state_anext_state_var_abreq_1_a0_combout" }
   catch { vcd add "$hierarchy/Selector3_a0_combout" }
   catch { vcd add "$hierarchy/Selector2_a0_combout" }
   catch { vcd add "$hierarchy/next_state_var_a3_combout" }
   catch { vcd add "$hierarchy/Selector2_a1_combout" }
   catch { vcd add "$hierarchy/Selector2_a2_combout" }
   catch { vcd add "$hierarchy/state_signal_arst_aq" }
   catch { vcd add "$hierarchy/Selector0_a0_combout" }
   catch { vcd add "$hierarchy/Selector0_a1_combout" }
   catch { vcd add "$hierarchy/Selector0_a2_combout" }
   catch { vcd add "$hierarchy/Selector0_a3_combout" }
   catch { vcd add "$hierarchy/Selector0_a4_combout" }
   catch { vcd add "$hierarchy/Selector0_a5_combout" }
   catch { vcd add "$hierarchy/Selector0_a6_combout" }
   catch { vcd add "$hierarchy/Selector1_a0_combout" }
   catch { vcd add "$hierarchy/Equal0_a8_combout" }
   catch { vcd add "$hierarchy/next_state_var_a4_combout" }
   catch { vcd add "$hierarchy/next_state_var_a5_combout" }
   catch { vcd add "$hierarchy/mux_b_a29_combout" }
   catch { vcd add "$hierarchy/mux_d3_a3_combout" }
   catch { vcd add "$hierarchy/mux_pc_a4_combout" }
   catch { vcd add "$hierarchy/enable_b_a3_combout" }
   catch { vcd add "$hierarchy/enable_carry_flag_a3_combout" }
   catch { vcd add "$hierarchy/se_6_16_a2_combout" }
   catch { vcd add "$hierarchy/se_9_16_a2_combout" }
   catch { vcd add "$hierarchy/a_anext_state_anext_state_var_alm_0_a2_combout" }
   catch { vcd add "$hierarchy/mux_b_a30_combout" }
   catch { vcd add "$hierarchy/mux_b_a31_combout" }
   catch { vcd add "$hierarchy/a_anext_state_anext_state_var_asm_0_a2_combout" }
   catch { vcd add "$hierarchy/a_anext_state_anext_state_var_anand_0_a2_combout" }
   catch { vcd add "$hierarchy/next_state_var_a6_combout" }
   catch { vcd add "$hierarchy/mux_mem_addr_a9_combout" }
   catch { vcd add "$hierarchy/mux_b_a32_combout" }
   catch { vcd add "$hierarchy/enable_Z_flag_a8_combout" }
   catch { vcd add "$hierarchy/enable_a_a3_combout" }
   catch { vcd add "$hierarchy/mux_b_a33_combout" }
   catch { vcd add "$hierarchy/mux_b_a17_combout" }
   catch { vcd add "$hierarchy/state_signal_arst_a0_combout" }
   catch { vcd add "$hierarchy/pcWrite_aoutput_o" }
   catch { vcd add "$hierarchy/rfWrite_aoutput_o" }
   catch { vcd add "$hierarchy/irWrite_aoutput_o" }
   catch { vcd add "$hierarchy/memRead_aoutput_o" }
   catch { vcd add "$hierarchy/memWrite_aoutput_o" }
   catch { vcd add "$hierarchy/alu_op_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/alu_op_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_mem_data_aoutput_o" }
   catch { vcd add "$hierarchy/mux_mem_addr_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_mem_addr_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_a3_aoutput_o" }
   catch { vcd add "$hierarchy/mux_a2_aoutput_o" }
   catch { vcd add "$hierarchy/mux_a1_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_a1_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_b_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_b_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_d3_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_d3_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_pc_a0_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_pc_a1_a_aoutput_o" }
   catch { vcd add "$hierarchy/mux_pe_tmp_aoutput_o" }
   catch { vcd add "$hierarchy/mux_before_a_aoutput_o" }
   catch { vcd add "$hierarchy/enable_alu_aoutput_o" }
   catch { vcd add "$hierarchy/enable_a_aoutput_o" }
   catch { vcd add "$hierarchy/enable_b_aoutput_o" }
   catch { vcd add "$hierarchy/enable_c_aoutput_o" }
   catch { vcd add "$hierarchy/enable_mdr_aoutput_o" }
   catch { vcd add "$hierarchy/enable_pe_tmp_aoutput_o" }
   catch { vcd add "$hierarchy/enable_pe_out_aoutput_o" }
   catch { vcd add "$hierarchy/enable_pe_flag_aoutput_o" }
   catch { vcd add "$hierarchy/enable_eqflag_aoutput_o" }
   catch { vcd add "$hierarchy/enable_carry_flag_aoutput_o" }
   catch { vcd add "$hierarchy/enable_Z_flag_aoutput_o" }
   catch { vcd add "$hierarchy/enable_pe_aoutput_o" }
   catch { vcd add "$hierarchy/enable_pe_1_3_aoutput_o" }
   catch { vcd add "$hierarchy/se_6_16_aoutput_o" }
   catch { vcd add "$hierarchy/se_9_16_aoutput_o" }
   catch { vcd add "$hierarchy/ze_9_16_aoutput_o" }
   catch { vcd add "$hierarchy/op_code_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/op_code_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/op_code_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/reset_ainput_o" }
   catch { vcd add "$hierarchy/op_code_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/eqflag_ainput_o" }
   catch { vcd add "$hierarchy/clock_ainput_o" }
   catch { vcd add "$hierarchy/pe_flag_ainput_o" }
   catch { vcd add "$hierarchy/CZ_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/CZ_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/carry_ainput_o" }
   catch { vcd add "$hierarchy/Z_ainput_o" }
   catch { vcd add "$hierarchy/clock_ainputclkctrl_outclk" }
}

# ----------------------------------------------------------------
#
proc main { argv } {
#
# Description:	Main entry point to script.  Iterate over all
#		hierarchy levels specified, and direct ModelSim-Altera (Verilog)
#		to print the relevant signals under each level
#
# ----------------------------------------------------------------

   set vcd_filename "control_path.vcd"
   set hierarchy "dut"

   vcd file "$vcd_filename"
   vcd on

   add_vcd_signals $hierarchy $vcd_filename
}

main $argv
