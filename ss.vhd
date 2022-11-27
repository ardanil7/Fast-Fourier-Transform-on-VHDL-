library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
USE STD.TEXTIO.ALL;
use ieee.std_logic_unsigned.all;


entity lab_fft_tb is
end;

architecture bench of lab_fft_tb is

  component lab_fft
    Port (clk: in std_logic;
          start_fft: inout std_logic;
          
          ready_out: out  std_logic:='0' );
  end component;

  signal clk: std_logic;
  signal start_fft: std_logic:='1';
  
 signal ready_out: std_logic:='0';
  
  
  
  
  

begin

  uut: lab_fft port map ( clk        => clk,
                          start_fft  => start_fft,
                          
                          ready_out  => ready_out );


  

end;