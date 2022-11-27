library ieee;
use ieee.std_logic_1164.all;

entity tb_lab_fft is
end tb_lab_fft;

architecture tb of tb_lab_fft is

    component lab_fft
        port (clk       : in std_logic;
              start_fft : inout std_logic;
              ready_out : out std_logic);
    end component;

    signal clk       : std_logic;
    signal start_fft : std_logic;
    signal ready_out : std_logic;

begin

    dut : lab_fft
    port map (clk       => clk,
              start_fft => start_fft,
              ready_out => ready_out);

    stimuli : process(clk,start_fft)
    begin
        -- EDIT Adapt initialization as needed
      
        -- EDIT Add stimuli here

       
    end process;

end tb;