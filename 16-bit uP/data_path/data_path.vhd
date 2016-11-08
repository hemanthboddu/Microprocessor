library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity data_path is
port(
	clock : in std_logic;
	
	--ctrl pins
	pcWrite, rfWrite, irWrite, memWrite, memRead : in std_logic;
	alu_op : in std_logic_vector(1 downto 0);
	
	--mux_sel
	mux_mem_data : in std_logic;
	mux_mem_addr : in std_logic_vector(1 downto 0);
	mux_a3, mux_a2 : in std_logic;
	mux_a1 : in std_logic_vector(1 downto 0);
	mux_a : in std_logic;
	mux_b, mux_d3, mux_pc : in std_logic_vector(1 downto 0);
	mux_pe_tmp, mux_before_a : in std_logic;
	
	--enable
	enable_alu, enable_a, enable_b, enable_c : in std_logic;
	enable_mdr   : in std_logic;
	enable_pe_tmp, enable_pe_out, enable_pe_flag : in std_logic;
	enable_eqflag, enable_carry_flag, enable_Z_flag : in std_logic;
	enable_pe : in std_logic;
	enable_pe_1_3 : in std_logic; --
	se_6_16, se_9_16, ze_9_16 : in std_logic;
	
	--reset
	
	--outputs
	carry, Z, eqflag, pe_flag : out std_logic;
	opcode : out std_logic_vector(3 downto 0);
	CZ : out std_logic_vector(1 downto 0)
     );
end entity;

architecture behave of data_path is
	constant cons_1 : std_logic_vector(15 downto 0) := "0000000000000001";
												--signals
	signal alu_in1, alu_in2, alu_o : std_logic_vector(15 downto 0);
	signal a_rego, b_rego, c_rego : std_logic_vector (15 downto 0);
	signal pc_in : std_logic_vector(15 downto 0);
	signal rf_d1, rf_d2,rf_d3, a_regi  : std_logic_vector(15 downto 0);
	signal rfa1, rfa2, rfa3 : std_logic_vector(2 downto 0);
	signal mem_ar, mem_dw, mem_out : std_logic_vector(15 downto 0);
	signal im6 : std_logic_vector(5 downto 0);
	signal im9 : std_logic_vector(8 downto 0);
	signal se6o, se9o, ze9o : std_logic_vector(15 downto 0);
	signal mdro,pc_o : std_logic_vector(15 downto 0);
	signal data_out1, a2, a3, pe_out_1,pe_out : std_logic_vector(2 downto 0);
	signal pe_in, pe_out_tmp, im8, pe_ireg, petmp : std_logic_vector(7 downto 0);
	signal pe_flagin, carry_alu, Z_alu, eqflag_alu : std_logic;
begin
	muxmdr_d3 : mux3_1 port map(c_rego, mdro, ze9o, mux_d3, rf_d3); --
	muxmem_ar : mux3_1 port map(pc_o, c_rego, a_rego, mux_mem_addr, mem_ar); -- rf_d1??
	pc_in1    : mux3_1 port map(alu_o, c_rego, rf_d1, mux_pc, pc_in); --
	muxir_a1  : mux3_1_1 port map(a2, pe_out, data_out1, mux_a1, rfa1); --
	
	muxb_alu_b: mux4_1 port map(cons_1, b_rego, se6o, se9o, mux_b, alu_in2); --
	
	muxmem_dw : mux2_1 port map(c_rego, rf_d1, mux_mem_data, mem_dw); --
	muxir_a3  : mux2_1_1 port map(data_out1, pe_out, mux_a3, rfa3); --
	muxir_a2  : mux2_1_1 port map(a3, data_out1, mux_a2, rfa2); --
	muxa_alu_a: mux2_1 port map(pc_o, a_rego, mux_a, alu_in1); --
	muxd1_a   : mux2_1 port map(rf_d1, c_rego, mux_before_a, a_regi);
	muxpe     : mux2_1_2 port map(im8, petmp, mux_pe_tmp, pe_ireg);
	
	alu1 : alu port map(enable_alu, alu_in1, alu_in2, alu_o,alu_op, carry_alu,Z_alu,eqflag_alu );
	PE   : PriorityEncoder port map(pe_in, enable_pe, pe_out_1, pe_flagin, pe_out_tmp);
	
	reg_peo   : reg_3 port map(pe_out_1, pe_out, clock, enable_pe_1_3);
	reg_carry : reg_1 port map(carry_alu, carry, clock, enable_carry_flag);
	reg_Z     : reg_1 port map(Z_alu, Z, clock, enable_Z_flag);
	reg_eqf   : reg_1 port map(eqflag_alu, eqflag, clock, enable_eqflag);
	reg8_pein : reg_8 port map(pe_ireg, pe_in, clock, enable_pe_tmp);
	reg_8petmp: reg_8 port map(pe_out_tmp, petmp, clock, enable_pe_out );
	regpef    : reg_1 port map(pe_flagin, pe_flag, clock, enable_pe_flag);
	rega      : reg port map(a_regi, a_rego, clock, enable_a);
	regb      : reg port map(rf_d2, b_rego, clock, enable_b);
	regc      : reg port map(alu_o, c_rego, clock, enable_c);
	mdr       : reg port map(mem_out, mdro, clock, enable_mdr);
	ir_reg_1  : ir_reg port map(mem_out, data_out1, a2, a3, CZ, opcode, im6, im8, im9, clock, irWrite);
	reg_file_1: reg_file port map(rfa1, rfa2, rfa3, rf_d1, rf_d2, rf_d3, rfWrite, pc_in, pc_o, pcWrite, clock);
	
	memory_1  : memory port map(mem_ar, mem_dw, mem_out, memWrite, memRead, clock);
	
	zeroext   : zero_ex_16_9 port map(im9, ze9o, ze_9_16);
	signext9  : sign_ex_9_16 port map(im9, se9o, se_9_16);
	signext6  : sign_ex_6_16 port map(im6,se6o, se_6_16);
end behave;
