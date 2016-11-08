library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity memory is
port( 	address : in std_logic_vector(15 downto 0);
	data_in : in std_logic_vector(15 downto 0);
	data_out : out std_logic_vector(15 downto 0);
	write_enable,read_enable,clock: in std_logic);
end memory;

architecture design of memory is

type mem is array (32767 downto 0) of std_logic_vector(15 downto 0);
signal memory_block : mem;
--signal address_int :integer range 32767 downto 0;
begin

--address_int <= to_integer(unsigned(address));

	process(clock,read_enable,write_enable,address,memory_block,data_in) is
	begin
	--if(clock'event and clock='1') then
		if(write_enable = '1') then
		--	if(writebyte = '1') then
			memory_block(to_integer(unsigned(address))) <= data_in(15 downto 0);
		--	else
		--		memory_block(address_int) <= data_in(7 downto 0);
		--		memory_block(address_int +1) <= data_in(15 downto 8);
		--	end if;
		elsif (read_enable = '1') then
		--if(readbyte = '1')then
			data_out(15 downto 0) <= memory_block(to_integer(unsigned(address)));
				
				--case memory_block(address_int)(7 downto 7) is
				--	when "0" =>
				--		data_out(15 downto 8) <= "00000000";
				--	when "1" =>
				--		data_out(15 downto 8) <= "11111111";
				--	when others =>
				--	end case;
			--else
			--	data_out(15 downto 8) <= memory_block(address_int +1) ;
			--	data_out(7 downto 0) <= memory_block(address_int);
			--end if;
		end if;
--	end if;
	end process;
end architecture;

