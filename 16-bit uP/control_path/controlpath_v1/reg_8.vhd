library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity reg_8 is
  port (
    data_in  : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0);
    clock     : in  std_logic;
    enable   : in  std_logic
   -- reset    : in  bit
	);
end reg_8;

architecture behave of reg_8 is

begin
process(clock,enable)
begin 
  if(clock'event and clock = '1') then
    --if(reset = '1') then
      --data_out <= (others => '0');
    if enable = '1' then
      data_out <= data_in;
    end if;
  end if;
end process;
end behave;

