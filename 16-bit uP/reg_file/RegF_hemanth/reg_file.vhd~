library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity reg_file is
port ( 
		 data_add1, data_add2, write_add : in std_logic_vector(2 downto 0);
		 data_out1, data_out2 : out std_logic_vector(15 downto 0);
		 write_data : in std_logic_vector(15 downto 0);
		 flag : in std_logic;
		 pc_in : in std_logic_vector(15 downto 0);
		 pc_out : out std_logic_vector(15 downto 0);
		 pcWrite, clk : in std_logic
		 );
end entity reg_file;

architecture main of reg_file is

type register_array is array (7 downto 0) of std_logic_vector (15 downto 0);
signal temp : register_array := ((others =>(others => '0'))) ;
constant cons_7 : std_logic_vector(2 downto 0) := "111";
begin
process ( clk, pcWrite )
begin
if(clk'event and clk='1') then
	data_out1 <= temp(to_integer(unsigned(data_add1)));
	data_out2 <= temp(to_integer(unsigned(data_add2)));
	pc_out <= temp(to_integer(unsigned(cons_7)));
	if ( flag = '1') then
		temp(to_integer(unsigned(write_add))) <= write_data;
	end if;
	if(pcWrite = '1') then 
		temp(to_integer(unsigned(cons_7))) <= pc_in;
	end if;
end if;
--if (pcWrite = '1') then
--	temp(to_integer(unsigned("111"))) <= pc_in;
--end if;
end process;
end main;
	
