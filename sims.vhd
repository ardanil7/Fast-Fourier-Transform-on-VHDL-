library ieee;
use ieee.std_logic_1164.all;
USE STD.TEXTIO.ALL;



entity ab_fft is
end ab_fft;

architecture tb of ab_fft is

    component lab_fft
        port (clk       : in std_logic;
              start_fft : inout std_logic;
              ready_out : out std_logic);
    end component;

    signal clk       : std_logic;
    signal start_fft : std_logic;
    signal ready_out : std_logic;
    signal count: integer range 0 to 2:=0;
begin

    dut : lab_fft
    port map (clk       => clk,
              start_fft => start_fft,
              ready_out => ready_out);


    
    
    
    










    

end tb;