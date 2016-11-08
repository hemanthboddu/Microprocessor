library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_alu is
end entity;
architecture Behave of testbench_alu is

  signal a,b,alu_out: std_logic_vector(15 downto 0):= "0000000000000000";
  signal enable,c,z,eqflag: std_logic := '0';
  signal control : std_logic_vector(1 downto 0) := "00";

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
    File INFILE: text open read_mode is "TRACEFILE_alu.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_alu.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector0: bit; 
    variable input_vector1: bit_vector ( 15 downto 0);
    variable input_vector2: bit_vector ( 15 downto 0);
    variable input_vector3: bit_vector (1 downto 0);
    variable output_vector1: bit_vector( 15 downto 0);
    variable output_vector2: bit;
    variable output_vector3: bit;
    variable output_vector4: bit;
 
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector0);
          read (INPUT_LINE, input_vector1);
          read (INPUT_LINE, input_vector2);
          read (INPUT_LINE, input_vector3);
          read (INPUT_LINE, output_vector1);
          read (INPUT_LINE, output_vector2);
          read (INPUT_LINE, output_vector3);
          read (INPUT_LINE, output_vector4);

          --------------------------------------
          -- from input-vector to DUT inputs
    enable <= to_std_logic(input_vector0);      
	  a <= to_stdlogicvector(input_vector1);
    b <= to_stdlogicvector(input_vector2);
    control <= to_stdlogicvector(input_vector3);
          --------------------------------------


	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	  if (alu_out /= to_stdlogicvector(output_vector1)) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-out, line "));
      write(OUTPUT_LINE,to_bitvector(alu_out));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (c /= to_std_logic(output_vector2)) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-c, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (z /= to_std_logic(output_vector3)) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-z, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (eqflag /= to_std_logic(output_vector4)) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-eq, line "));
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

  dut: ALU 
     port map(enable,
      a,
      b,
      alu_out,
      control,
      c,
      z,
      eqflag);

end Behave;
