library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
library std;
use std.textio.all;

entity testbench_reg_file is
end entity;
architecture Behave of testbench_reg_file is

  signal data_add1,data_add2,write_add: std_logic_vector(2 downto 0):="000";
  signal flag,clk : std_logic := '0';
  signal data_out1, data_out2,write_data : std_logic_vector(15 downto 0):="0000000000000000";
  
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
    File INFILE: text open read_mode is "TRACEFILE_reg_file.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_reg_file.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector1: bit_vector ( 2 downto 0);
    variable input_vector2: bit_vector ( 2 downto 0);
    variable input_vector3: bit_vector ( 2 downto 0);
    variable input_vector4: bit_vector ( 15 downto 0);
    variable output_vector1: bit_vector( 15 downto 0);
    variable output_vector2: bit_vector( 15 downto 0);
    variable clk1,flag1 : bit;
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
          read (INPUT_LINE, input_vector3);
          read (INPUT_LINE, input_vector4);
          read (INPUT_LINE, output_vector1);
          read (INPUT_LINE, output_vector2);
	    read (INPUT_LINE , clk1);
	    read (INPUT_LINE , flag1);
          --------------------------------------
          -- from input-vector to DUT inputs
	  data_add1 <= to_stdlogicvector(input_vector1);
	  data_add2 <= to_stdlogicvector(input_vector2);
	  write_add <= to_stdlogicvector(input_vector3);
	  write_data <= to_stdlogicvector(input_vector4);
	  clk <= to_std_logic(clk1);
  	  flag <= to_std_logic(flag1);
          --------------------------------------

	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	if (to_bitvector(data_out1) /= (output_vector1)) then
      write(OUTPUT_LINE,to_string("ERROR: in data_out1, line "));
      write(OUTPUT_LINE,to_bitvector(data_out1));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    	end if;
    	if (to_bitvector(data_out2) /= (output_vector2)) then
      write(OUTPUT_LINE,to_string("ERROR: in data_out2, line "));
      write(OUTPUT_LINE,to_bitvector(data_out2));
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

  dut: reg_file
     port map(data_add1,
              data_add2,
              write_add,
              data_out1,
              data_out2,
              write_data,
              clk,
              flag
              );

end Behave;
