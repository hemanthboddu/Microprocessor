library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_memory is
end entity;
architecture Behave of testbench_memory is

  signal address,data_in,data_out: std_logic_vector(15 downto 0):="0000000000000000";
  signal write_enable,clock,read_enable : std_logic := '0';
  
  function to_std_logic(x: bit) return std_logic is
      variable ret_val: std_logic;
  begin  
      if (x = '1') then
        ret_val := '1';
      else 
        ret_val := '0';
      end if;
      return(ret_val);
  end to_std_logic;

  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE_memory.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_memory.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector1: bit_vector ( 15 downto 0);
    variable input_vector2: bit_vector ( 15 downto 0);
    variable output_vector: bit_vector( 15 downto 0);
    variable write_enable1,clock1,read_enable1 : bit;
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector1);
          read (INPUT_LINE, input_vector2);
          read (INPUT_LINE, output_vector);
	    read (INPUT_LINE , write_enable1);
	    read (INPUT_LINE , read_enable1);
	    read (INPUT_LINE , clock1);
          --------------------------------------
          -- from input-vector to DUT inputs
          write_enable <= to_std_logic(write_enable1);
  	  read_enable <= to_std_logic(read_enable1);
  	  clock <= to_std_logic(clock1);
  	           
	  address <= to_stdlogicvector(input_vector1);
	 
          
	  data_in <= to_stdlogicvector(input_vector2);
	 
          loop6:
	  --address <= to_stdlogicvector(input_vector1);
	  --data_in <= to_stdlogicvector(input_vector2);
	  

	  -- let circuit respond.
          wait for 5 ns;

	  -- check outputs.
	if (data_out /= to_stdlogicvector (output_vector)) then
      write(OUTPUT_LINE,to_string("ERROR: in data_out, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      write(OUTPUT_LINE,to_bitvector(data_out));
  --    write(OUTPUT_LINE, input_vector1);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    	end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  dut: memory 
     port map(address,
              data_in,
              data_out,
              write_enable,
              read_enable,
              clock);

end Behave;
