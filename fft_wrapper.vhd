--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Tue Nov 22 05:55:46 2022
--Host        : Arda running 64-bit major release  (build 9200)
--Command     : generate_target fft_wrapper.bd
--Design      : fft_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fft_wrapper is
  port (
    A_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    A_1 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    B_1 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    P_0 : out STD_LOGIC_VECTOR ( 59 downto 0 );
    P_1 : out STD_LOGIC_VECTOR ( 59 downto 0 );
    fft_clk : in STD_LOGIC;
    adresb_window : in STD_LOGIC_VECTOR ( 8 downto 0 );
    adresa_fft : in STD_LOGIC_VECTOR ( 7 downto 0 );
    adresb_fft : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fft_reset : in STD_LOGIC;
   
    clk : in STD_LOGIC;
    dina_fft : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb_window : out STD_LOGIC_VECTOR ( 19 downto 0 );
    doutb_fft : out STD_LOGIC_VECTOR ( 31 downto 0 );
    event_data_in_channel_halt_0 : out STD_LOGIC;
    event_frame_started_0 : out STD_LOGIC;
    event_tlast_missing_0 : out STD_LOGIC;
    event_tlast_unexpected_0 : out STD_LOGIC;
    m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_data_tlast_0 : out STD_LOGIC;
    m_axis_data_tvalid_0 : out STD_LOGIC;
    s_axis_config_tdata_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_config_tready_0 : out STD_LOGIC;
    s_axis_config_tvalid_0 : in STD_LOGIC;
    s_axis_data_tdata_0 : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axis_data_tlast_0 : in STD_LOGIC;
    s_axis_data_tready_0 : out STD_LOGIC;
    s_axis_data_tvalid_0 : in STD_LOGIC;
    wea_fft : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end fft_wrapper;

architecture STRUCTURE of fft_wrapper is
  component fft is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clka_0 : in STD_LOGIC;
    douta_0 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    aclk_0 : in STD_LOGIC;
    aresetn_0 : in STD_LOGIC;
    event_data_in_channel_halt_0 : out STD_LOGIC;
    event_frame_started_0 : out STD_LOGIC;
    event_tlast_missing_0 : out STD_LOGIC;
    event_tlast_unexpected_0 : out STD_LOGIC;
    m_axis_data_tdata_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_data_tlast_0 : out STD_LOGIC;
    m_axis_data_tvalid_0 : out STD_LOGIC;
    s_axis_data_tdata_0 : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axis_data_tlast_0 : in STD_LOGIC;
    s_axis_data_tready_0 : out STD_LOGIC;
    s_axis_data_tvalid_0 : in STD_LOGIC;
    s_axis_config_tdata_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_config_tready_0 : out STD_LOGIC;
    s_axis_config_tvalid_0 : in STD_LOGIC;
    A_1 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    B_1 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    P_1 : out STD_LOGIC_VECTOR ( 59 downto 0 );
    P_0 : out STD_LOGIC_VECTOR ( 59 downto 0 );
    A_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    addra_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clka_1 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clkb_0 : in STD_LOGIC;
    doutb_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component fft;
begin
fft_i: component fft
     port map (
      A_0(29 downto 0) => A_0(29 downto 0),
      A_1(29 downto 0) => A_1(29 downto 0),
      B_0(29 downto 0) => B_0(29 downto 0),
      B_1(29 downto 0) => B_1(29 downto 0),
      P_0(59 downto 0) => P_0(59 downto 0),
      P_1(59 downto 0) => P_1(59 downto 0),
      aclk_0 => fft_clk,
      addra_0(8 downto 0) => adresb_window(8 downto 0),
      addra_1(7 downto 0) => adresa_fft(7 downto 0),
      addrb_0(7 downto 0) => adresb_fft(7 downto 0),
      aresetn_0 => fft_reset,
      clka_0 => clk,
      clka_1 => clk,
      clkb_0 => clk,
      dina_0(31 downto 0) => dina_fft(31 downto 0),
      douta_0(19 downto 0) => doutb_window(19 downto 0),
      doutb_0(31 downto 0) => doutb_fft(31 downto 0),
      event_data_in_channel_halt_0 => event_data_in_channel_halt_0,
      event_frame_started_0 => event_frame_started_0,
      event_tlast_missing_0 => event_tlast_missing_0,
      event_tlast_unexpected_0 => event_tlast_unexpected_0,
      m_axis_data_tdata_0(63 downto 0) => m_axis_data_tdata_0(63 downto 0),
      m_axis_data_tlast_0 => m_axis_data_tlast_0,
      m_axis_data_tvalid_0 => m_axis_data_tvalid_0,
      s_axis_config_tdata_0(7 downto 0) => s_axis_config_tdata_0(7 downto 0),
      s_axis_config_tready_0 => s_axis_config_tready_0,
      s_axis_config_tvalid_0 => s_axis_config_tvalid_0,
      s_axis_data_tdata_0(47 downto 0) => s_axis_data_tdata_0(47 downto 0),
      s_axis_data_tlast_0 => s_axis_data_tlast_0,
      s_axis_data_tready_0 => s_axis_data_tready_0,
      s_axis_data_tvalid_0 => s_axis_data_tvalid_0,
      wea_0(0) => wea_fft(0)
    );
end STRUCTURE;
