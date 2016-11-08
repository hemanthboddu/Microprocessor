library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package Components_project is

component mux2_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     control : in std_logic_vector(0 downto 0);
	     c : out std_logic_vector(15 downto 0)
	);
end component;
component mux4_2 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     a2 : in std_logic_vector(15 downto 0);
	     a3 : in std_logic_vector(15 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(15 downto 0)
	);
end component;

   component sign_ex_10_16 is
	port(
	     a : in std_logic_vector(5 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
   end component;

   component ir_reg is
     port (
      data_in   : in  bit_vector(15 downto 0);
      data_out  : out bit_vector(15 downto 0);
      clock     : in  bit;
      enable   : in  bit;
      reset    : in  bit
	);
   end component;
  component reg is
    port (
      data_in  : in  bit_vector(15 downto 0);
      data_out : out bit_vector(15 downto 0);
      clock     : in  bit;
      enable   : in  bit;
      reset    : in  bit
	  );
  end component;
  component reg_file is
  port ( 
		 data_add1, data_add2, write_add : in std_logic_vector(2 downto 0);
		 data_out1, data_out2 : out std_logic_vector(15 downto 0);
		 write_data : in std_logic_vector(15 downto 0);
		 clk, flag : in bit
		 );
  end component;
  component memory is
    port(address : in std_logic_vector(15 downto 0);
	 data_in : in std_logic_vector(15 downto 0);
	 data_out : out std_logic_vector(15 downto 0);
	 write_enable,read_enable,clock: in std_logic);
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
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (15 downto 0);
           op_code : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC_VECTOR (0 downto 0);
           z : out  STD_LOGIC_VECTOR (0 downto 0);
           l : out  STD_LOGIC_VECTOR (0 downto 0));
   end component ALU;
   component bit_adder_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	     --c : out std_logic_vector(0 downto 0)
	);
   end component;
   component bit_sub_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	     --c : out std_logic_vector(0 downto 0)
	);
   end component;
   
end Components_project;

