library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package Components_project is
   component sign_ex_10_16 is
		port(
		     a : in std_logic_vector(5 downto 0);
		     alu_out : out std_logic_vector(15 downto 0)
		);
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
   component PriorityEncoder is
	port ( x : in std_logic_vector(7 downto 0) ;
	s : out std_logic_vector(2 downto 0) ; 
	N : out std_logic ;
	y : out std_logic_vector(7 downto 0) ) ;
   end component ;
   
end Components_project;

