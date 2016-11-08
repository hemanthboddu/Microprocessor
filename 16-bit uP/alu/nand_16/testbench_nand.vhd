library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_nand is
end entity;
architecture Behave of testbench_nand is
  component nand_16 is
   port(a,b: in std_logic_vector(15 downto 0);
        alu_out: out std_logic_vector(15 downto 0));
  end component;

  signal x,y,s: std_logic_vector(15 downto 0):="0000000000000000";

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
    File INFILE: text open read_mode is "TRACEFILE_nand.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_nand.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector1: bit_vector ( 15 downto 0);
    variable input_vector2: bit_vector ( 15 downto 0);
    variable output_vector: bit_vector( 15 downto 0);
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

          --------------------------------------
          -- from input-vector to DUT inputs
	  x <= to_stdlogicvector(input_vector1);
	  y <= to_stdlogicvector(input_vector2);
          --------------------------------------


	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	  if (s /= to_stdlogicvector(output_vector)) then
      write(OUTPUT_LINE,to_string("ERROR: in s0, line "));
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

  dut: nand_16 
     port map(a => x,
              b => y,
              alu_out => s);

end Behave;
