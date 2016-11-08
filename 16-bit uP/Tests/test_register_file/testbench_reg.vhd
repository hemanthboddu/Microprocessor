library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_reg is
end entity;
architecture Behave of testbench_reg is

  signal data_in,data_out: bit_vector(15 downto 0):="0000000000000000";
  signal reset,clock,enable : std_logic := '0';
  
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
    File INFILE: text open read_mode is "TRACEFILE_reg.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_reg.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector1: bit_vector ( 15 downto 0);
    variable output_vector: bit_vector( 15 downto 0);
    variable clock1,reset1,enable1 : bit;
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector1);
          read (INPUT_LINE, output_vector);
	    read (INPUT_LINE , clock1);
	    read (INPUT_LINE , enable1);
	    read (INPUT_LINE , reset1);
          --------------------------------------
          -- from input-vector to DUT inputs
	  data_in <= (input_vector1);
	  clock <= to_std_logic(clock1);
  	  reset <= to_std_logic(reset1);
  	  enable <= to_std_logic(enable1);
          --------------------------------------

	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	if (data_out /= (output_vector)) then
      write(OUTPUT_LINE,to_string("ERROR: in data_out, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    	end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  dut: reg 
     port map(data_in,
              data_out,
              clock,
              enable,
              reset);

end Behave;
