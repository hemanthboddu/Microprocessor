library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package Components_project is

component mux2_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     control : in std_logic;
	     c : out std_logic_vector(15 downto 0)
	);
end component;
component mux2_1_1 is
	port(
	     a0 : in std_logic_vector(2 downto 0);
	     a1 : in std_logic_vector(2 downto 0);
	     control : in std_logic;
	     c : out std_logic_vector(2 downto 0)
	);
end component;
component mux2_1_2 is
	port(
	     a0 : in std_logic_vector(7 downto 0);
	     a1 : in std_logic_vector(7 downto 0);
	     control : in std_logic;
	     c : out std_logic_vector(7 downto 0)
	);
end component;
component mux4_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     a2 : in std_logic_vector(15 downto 0);
	     a3 : in std_logic_vector(15 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(15 downto 0)
	);
end component;
component mux3_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     a2 : in std_logic_vector(15 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(15 downto 0)
	);
end component;
component mux3_1_1 is
	port(
	     a0 : in std_logic_vector(2 downto 0);
	     a1 : in std_logic_vector(2 downto 0);
	     a2 : in std_logic_vector(2 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(2 downto 0)
	);
end component;

   component sign_ex_9_16 is
	port(
	     a : in std_logic_vector(8 downto 0);
	     alu_out : out std_logic_vector(15 downto 0);
	     enable : std_logic
	);
   end component;
   component sign_ex_6_16 is
	port(
	     a : in std_logic_vector(5 downto 0);
	     alu_out : out std_logic_vector(15 downto 0);
	     enable : std_logic
	);
   end component;
   component zero_ex_16_9 is
	port(
	     a : in std_logic_vector(8 downto 0);
	     alu_out : out std_logic_vector(15 downto 0);
	     enable : in std_logic
	);
   end component;

   component ir_reg is
  port (
    data_in   : in  std_logic_vector(15 downto 0);
    data_out1, data_out2, data_out3  : out std_logic_vector(2 downto 0);
    cz : out std_logic_vector(1 downto 0);
    opcode : out std_logic_vector(3 downto 0);
    im6 : out std_logic_vector(5 downto 0);
    im8 : out std_logic_vector(7 downto 0);
    im9 : out std_logic_vector(8 downto 0);
    clock     : in  std_logic;
    enable   : in  std_logic
    --reset    : in  std_logic
	);
   end component;
  component reg is
    port (
      data_in  : in  std_logic_vector(15 downto 0);
      data_out : out std_logic_vector(15 downto 0);
      clock     : in std_logic;
      enable   : in std_logic
     -- reset    : in  bit
	  );
  end component;
  component reg_8 is
  port (
    data_in  : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0);
    clock     : in  std_logic;
    enable   : in  std_logic
   -- reset    : in  bit
	);
  end component reg_8;
  component reg_3 is
    port (
      data_in  : in std_logic_vector(2 downto 0);
      data_out : out std_logic_vector(2 downto 0);
      clock     : in  std_logic;
      enable   : in  std_logic
   -- reset    : in  bit
	);
  end component reg_3;
  component reg_1 is
   port (
     data_in  : in std_logic;
     data_out : out std_logic;
     clock     : in  std_logic;
     enable   : in  std_logic
   -- reset    : in  bit
	);
  end component reg_1;
  component reg_file is
  port ( 
		 data_add1, data_add2, write_add : in std_logic_vector(2 downto 0);
		 data_out1, data_out2 : out std_logic_vector(15 downto 0);
		 write_data : in std_logic_vector(15 downto 0);
		 flag : in std_logic;
		 pc_in : in std_logic_vector(15 downto 0);
		 pc_out : out std_logic_vector(15 downto 0);
		 pcWrite, clk : in std_logic
		 );
  end component;
  component memory is
    port(address : in std_logic_vector(15 downto 0);
	 data_in : in std_logic_vector(15 downto 0);
	 data_out : out std_logic_vector(15 downto 0);
	 write_enable,read_enable,clock : in std_logic);
  end component;

   component equality is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     --alu_out : out std_logic_vector(15 downto 0);
	     --c : out std_logic_vector(0 downto 0);
	     z : out std_logic
	);
   end component;
   component inverter is
	port(
	     a : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
   end component;
   component nand_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
   end component;
   component ALU is
    Port ( enable : in std_logic;
    	   a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (15 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC;
           z : out  STD_LOGIC;
           eqflag : out  STD_LOGIC);
   end component ALU;
   component PriorityEncoder is
	port ( x : in std_logic_vector(7 downto 0) ;
	enable : in std_logic;
	s : out std_logic_vector(2 downto 0) ; 
	N : out std_logic ;
	y : out std_logic_vector(7 downto 0) ) ;
   end component PriorityEncoder ;
   component bit16adder is
   port(
   		x,y : in std_logic_vector(15 downto 0);
		s : out std_logic_vector(15 downto 0);
		carry : out std_logic
		);
   end component;
   component fulladder is --*we define the i/o's for fulladder
   port ( A,B,Cin : in std_logic;
         sum,Cout : out std_logic);
   end component fulladder;
   component halfadder is --*we are defining the inputs and outputs for halfadder
	port( A,B : in std_logic;
	 sum,Cout : out std_logic);
   end component halfadder;
   component bit_sub_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	     --c : out std_logic_vector(0 downto 0)
	);
   end component;
   component data_path is
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
   end component;
   component control_path is
   port(
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
	mux_a1 : out std_logic_vector(1 downto 0);
	mux_a : out std_logic;
	mux_b : out std_logic_vector(1 downto 0);
	mux_d3 : out std_logic_vector(1 downto 0);
	mux_pc : out std_logic_vector(1 downto 0);
	mux_pe_tmp : out std_logic;
	mux_before_a : out std_logic;
	--------------------------------------------------------------------------
	------Enable pins
	enable_alu : out std_logic;
	enable_a : out std_logic;
	enable_b : out std_logic;
	enable_c : out std_logic;
	enable_mdr : out std_logic;
	enable_pe_tmp : out std_logic;
	enable_pe_out : out std_logic;
	enable_pe_flag : out std_logic;
	enable_eqflag : out std_logic;
--	enable_pe3 : out std_logic;
	enable_carry_flag : out std_logic;
	enable_Z_flag : out std_logic;
	enable_pe : out std_logic;
	enable_pe_1_3 : out std_logic;	
	se_6_16 : out std_logic;
	se_9_16 : out std_logic;
	ze_9_16 : out std_logic;
	--------------------------------------------------------------------
	
	carry : in std_logic;
	Z : in std_logic;
	eqflag :in std_logic;
	pe_flag :in std_logic;
--	instruction : in bit_vector(15 downto 0);
--	op_15 : in bit;
--	op_14_13 : in bit_vector(1 downto 0);
	op_code : in std_logic_vector(3 downto 0);
	CZ : in std_logic_vector(1 downto 0)
	
	);
   end component;
end Components_project;

