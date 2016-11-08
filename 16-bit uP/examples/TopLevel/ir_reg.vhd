library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity ir_reg is
  port (
    data_in   : in  std_logic_vector(15 downto 0);
    data_out1, data_out2, data_out3  : out std_logic_vector(2 downto 0);
    cz : out std_logic_vector(1 downto 0);
    opcode : out std_logic_vector(3 downto 0);
    im6 : out std_logic_vector(5 downto 0);
    im9 : out std_logic_vector(8 downto 0);
    im8 : out std_logic_vector(7 downto 0);
    clock     : in  std_logic;
    enable   : in  std_logic;
    reset    : in  std_logic
	);
end ir_reg;

architecture behave of ir_reg is
begin
process(clock, reset)
begin
	if(clock'event and clock = '1') then
		if(reset = '1') then
			--data_out1 <= "000";
		else 
			data_out1 <= data_in(11 downto 9);
			data_out2 <= data_in(8 downto 6);
			data_out3 <= data_in(5 downto 3);
			cz <= data_in(1 downto 0);
			opcode <= data_in(15 downto 12);
			im6 <= data_in(5 downto 0);
			im8 <= data_in(7 downto 0);
			im9 <= data_in(8 downto 0);
		end if;
	end if;
end process;
end behave;
