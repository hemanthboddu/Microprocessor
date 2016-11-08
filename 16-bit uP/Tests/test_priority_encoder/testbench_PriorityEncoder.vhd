library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_PriorityEncoder is
end entity;
architecture Behave of testbench_PriorityEncoder is


  signal x,y: std_logic_vector(7 downto 0):="00000000";
  signal s: std_logic_vector(2 downto 0) := "000";
  signal N: std_logic := '0';

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
    File INFILE: text open read_mode is "TRACEFILE_PriorityEncoder.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_PriorityEncoder.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector: bit_vector ( 7 downto 0);
    variable output_vector1: bit_vector( 2 downto 0);
    variable output_vector2: bit;
    variable output_vector3: bit_vector( 7 downto 0);
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector);
          read (INPUT_LINE, output_vector1);
          read (INPUT_LINE, output_vector2);
          read (INPUT_LINE, output_vector3);

          --------------------------------------
          -- from input-vector to DUT inputs
	  x <= to_stdlogicvector(input_vector);
          --------------------------------------


	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	  if (s /= to_stdlogicvector(output_vector1)) then
      write(OUTPUT_LINE,to_string("ERROR: in s, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
	  if (N /= to_std_logic(output_vector2)) then
      write(OUTPUT_LINE,to_string("ERROR: in N, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
	  if (y /= to_stdlogicvector(output_vector3)) then
      write(OUTPUT_LINE,to_string("ERROR: in y, line "));
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

  dut: PriorityEncoder
     port map(x,
              s,
	      N,
		y);

end Behave;
