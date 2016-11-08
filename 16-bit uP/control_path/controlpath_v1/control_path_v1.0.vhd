library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Components_project.all;
use IEEE.numeric_STD.ALL;

entity control_path is
port(
	carry : in std_logic;
	Z : in std_logic;
	
--	instruction : in bit_vector(15 downto 0);
--	op_15 : in bit;
--	op_14_13 : in bit_vector(1 downto 0);
	op_code : in bit_vector(3 downto 0);
	op_1_0 : in bit_vector(1 downto 0);
	clock: in std_logic;
	reset : in std_logic;
	-------------------------------------------------------
	---Control Signals
	pcWrite : out std_logic;
	rfWrite : out std_logic;
	irWrite : out std_logic;
	memRead : out std_logic;
	memWrite : out std_logic;
	alu_op : out std_logic_vector(1 downto 0);
	--------------------------------------------------------
	---MUX Signals
	mux_mem_data : out std_logic;
	mux_mem_addr : out std_logic_vector(1 downto 0);
	mux_a3 : out std_logic;
	mux_a2 : out std_logic;
	mux_a : out std_logic_vector(1 downto 0);
	mux_b : out std_logic_vector(1 downto 0);
	mux_d3 : out std_logic_vector(1 downto 0);
	mux_pc : out std_logic_vector(1 downto 0);
	mux_a1 : out std_logic_vector(1 downto 0);
	mux_pe : out std_logic;	
	--------------------------------------------------------------------------
	------Enable pins
	enable_a : out std_logic;
	enable_b : out std_logic;
	enable_c : out std_logic;
	enable_pe_tmp : out std_logic;
	enable_pe3 : out std_logic;
	enable_pe1 : out std_logic;
	se_6_16 : out std_logic;
	se_9_16 : out std_logic;
	prior_enc : out std_logic;
	ze_9_16 : out std_logic
	
	);
end entity;

architecture logic of control_path is
	type mystates is (rst,fetch,dec_0,add_0,nand_0,breq,lw_0,sw_0,breq_1,priority,lm_0,lm_1,sm_0,wb_0,wb_1);
	signal state_signal : mystates; 
begin
      next_state : process (clock,state_signal,reset,op_code,carry,op_1_0,Z)

	variable next_state_var : mystates;

--	variable op_1_0 : bit_vector(1 downto 0);
--	variable op_14_13 : bit_vector(14 downto 13);
--	variable op_15_12 : bit_vector(15 downto 12);
--	variable op_14_12 : bit_vector(14 downto 12); 
begin
	next_state_var := state_signal;

--	op_1_0 := instruction(1 downto 0);
--	op_14_13 := instruction(14 downto 13);
--	op_15_12 := instruction(15 downto 12);
--	op_14_12 := instruction(14 downto 12);
	-------------------------------------------------------------------------
	-----Control Signals
	pcWrite <= '0';
	rfWrite <= '0';
	irWrite <= '0';
	memWrite <= '0';
	memRead <= '0';
	alu_op <= "00";

	-------------------------------------------------------------------------
	------Mux ctrl signal
	mux_a <= "00";
	mux_b <= "00";
	mux_pc <= "00";
	mux_d3 <= "00";
	mux_mem_data <= '0';
	mux_mem_addr <= "00";
	mux_a1 <= "00";
	mux_a2 <= '0';
	mux_a3 <= '0';

	--------------------------------------------------------------------------
	------Enable pins
	se_6_16 <= '0';
	se_9_16 <= '0';
	prior_enc <= '0';
	ze_9_16 <= '0';
 
	
	if reset='1' then
		next_state_var:=rst;
	else
		case state_signal is
			when rst =>
				next_state_var := fetch;
			when fetch =>
				next_state_var := dec_0;
				memRead <= '1';
				irWrite <= '1';
			when dec_0 =>
				if op_code = "0000" then
					if op_1_0="00" then
						next_state_var := add_0;
						pcWrite <= '1';
					elsif ((op_1_0="10") and to_bit(carry)='1') then
						next_state_var := add_0;
						pcWrite <= '1';
					elsif ((op_1_0="01") and to_bit(Z)='1') then
						next_state_var := add_0;
						pcWrite <= '1';
					else
						next_state_var := fetch;
						pcWrite <= '1';
					end if;
				elsif op_code = "0001" then
					next_state_var := add_0;
					pcWrite <= '1';
				elsif op_code = "0100" then
					next_state_var := add_0;
					pcWrite <= '1';
				elsif op_code = "0101" then
					next_state_var := add_0;
					pcWrite <= '1';
				elsif op_code="0010" then
					if op_1_0="00" then
						next_state_var := nand_0;
						pcWrite <= '1';
					elsif ((op_1_0="10") and to_bit(carry)='1') then
						next_state_var := nand_0;
						pcWrite <= '1';
					elsif ((op_1_0="01") and to_bit(carry)='1') then
						next_state_var := nand_0;
						pcWrite <= '1';
					else
						next_state_var := fetch;
						pcWrite <= '1';
					end if;
				elsif op_code = "0110" or op_code = "0111"  then
					next_state_var := priority;
					mux_a1 <= "01";
					mux_mem_addr <= "10";
					enable_a <='1';
					mux_pe <='0';
					enable_pe_tmp <= '1';
				elsif op_code = "1100" then
					next_state_var := breq;
					mux_pc <= "01";
					mux_a2 <= '1';
				elsif op_code = "1000" then
					next_state_var := add_0;
					mux_pc <= "01";
				elsif op_code = "1001" then
					next_state_var := wb_0;
					mux_pc <= "10";
					pcWrite <= '1';		
				end if;
			when nand_0 =>
				next_state_var := wb_0;
				alu_op <= "01"; --aluOp = nand
				mux_a <= "01"; -- a to alu_a
				mux_b <= "01"; -- b to alu_b
			when add_0 =>
				if op_code = "0100" then
					next_state_var := lw_0;
					mux_a <= "01";
					se_6_16 <= '1';
					mux_b <= "10";
				elsif op_code = "0101" then
					next_state_var := sw_0;
					mux_a <= "01";
					se_6_16 <= '1';
					mux_b <= "10";
				elsif op_code = "0001" then
					next_state_var := wb_0;
					mux_a <= "01";
					se_6_16 <= '1';
					mux_b <= "10";
				elsif op_code = "1000" then
					next_state_var := wb_0;
					se_9_16 <= '1';
					mux_b <= "11";	
				else 
					next_state_var := wb_0;
					mux_a <= "01"; -- a to alu_a
					mux_b <= "01"; -- b to alu_b
				end if;				
			when lw_0 =>
				next_state_var := wb_0;	
				mux_mem_addr <= "01";
				memRead <= '1';
			when sw_0 =>
				next_state_var := wb_0;
				mux_mem_addr <= "01";
				mux_a1 <= "01";
				memWrite <= '1';
				mux_mem_data <= '1';
			when breq_1 =>
				next_state_var := fetch;
				se_6_16 <= '1';
				mux_b <= "10"; 	
				pcWrite <= '1';
			when priority =>
				if op_code = "0110" then
					next_state_var := lm_0;
				else
					next_state_var := sm_0;	
				end if;
				mux_a <= "01";
				mux_b <= "00";
				enable_c <= '1';
				mux_pe <= '1';
			when lm_0 =>
				next_state_var := lm_1;
				enable_pe3 <= '1';
				mux_d3 <= "01";
				mux_pe <= '1';
			when lm_1 =>
				next_state_var := priority;
				mux_mem_addr <= "01";
			when sm_0 =>
				next_state_var := lm_1;
				enable_pe1 <= '0';
				mux_mem_data <= '1';
			when wb_0 =>
				next_state_var := fetch;
				rfWrite <= '1';
				if(op_code = "0100") then
				mux_d3 <= "01";
				elsif(op_code = "0011") then
				ze_9_16 <= '1';
				mux_d3 <= "10";
				end if;
			when wb_1 =>
				next_state_var := fetch;
				mux_pc <= "01";
				pcWrite <= '1';
			when others =>
				next_state_var := fetch;
		end case;
	end if;

	if(clock ='1' and clock'event ) then
      state_signal <= next_state_var;
    end if;

    	
end process;
end logic;
