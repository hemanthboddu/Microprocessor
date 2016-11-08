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
           l : out  STD_LOGIC);
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
   
end Components_project;

