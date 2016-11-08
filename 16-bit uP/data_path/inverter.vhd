----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MohammedRafi
-- 
-- Create Date:    13:12:30 16/10/2016 
-- Design Name: 16-bit ALU
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity inverter is
	port(
	     a : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
end entity;
architecture behave of inverter is

begin
process(a)
begin
	for i in 0 to 15 loop
			alu_out(i) <= not a(i);
		end loop;
end process;
end behave;
