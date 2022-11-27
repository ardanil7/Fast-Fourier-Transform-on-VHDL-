----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 03:32:00
-- Design Name: 
-- Module Name: lab_fft - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity lab_fft is
  Port (clk: in std_logic;
        start_fft: inout std_logic;
        
        
        ready_out: out  std_logic:='0' );
end lab_fft;

architecture Behavioral of lab_fft is

component fft_wrapper is
port(A_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
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
end component fft_wrapper;


signal A_0 : STD_LOGIC_VECTOR ( 29 downto 0 );
signal A_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
signal B_0 : STD_LOGIC_VECTOR ( 29 downto 0 );
signal B_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
signal P_0 :  STD_LOGIC_VECTOR ( 59 downto 0 );
signal P_1 :  STD_LOGIC_VECTOR ( 59 downto 0 );
signal fft_clk :  STD_LOGIC:='0';
signal adresb_window :  STD_LOGIC_VECTOR ( 8 downto 0 );
signal adresa_fft :  STD_LOGIC_VECTOR ( 7 downto 0 ):="00000000";
signal adresb_fft :   STD_LOGIC_VECTOR ( 7 downto 0 ):="00000000";
signal doutb_fft :   STD_LOGIC_VECTOR ( 31 downto 0 );
signal fft_reset :  STD_LOGIC:='0';
signal dina_fft :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal doutb_window :  STD_LOGIC_VECTOR ( 19 downto 0 );

signal event_data_in_channel_halt_0 :  STD_LOGIC;
signal event_frame_started_0 :  STD_LOGIC;
signal event_tlast_missing_0 :  STD_LOGIC;
signal event_tlast_unexpected_0 :  STD_LOGIC;
signal m_axis_data_tdata_0 : STD_LOGIC_VECTOR ( 63 downto 0 );
signal m_axis_data_tlast_0 : STD_LOGIC;
signal m_axis_data_tvalid_0 : STD_LOGIC;
signal s_axis_config_tdata_0 : STD_LOGIC_VECTOR ( 7 downto 0 ):="00000001";
signal s_axis_config_tready_0 : STD_LOGIC;
signal s_axis_config_tvalid_0 : STD_LOGIC:='1';
signal s_axis_data_tdata_0 :  STD_LOGIC_VECTOR ( 47 downto 0 ):=(others=>'0');
signal s_axis_data_tlast_0 :  STD_LOGIC:='0';
signal s_axis_data_tready_0 :  STD_LOGIC;
signal s_axis_data_tvalid_0 : STD_LOGIC:='1';
signal wea_fft :  STD_LOGIC_VECTOR ( 0 to 0 ):="0";
signal bos:std_logic_vector(27 downto 0):=(others=>'0');

signal clockcounter: std_logic_vector(1 downto 0):="00";


type states is(hazir,bekle,write,outbekle);
signal state: states:= hazir;


signal count: integer range 0 to 4:=0;
signal count1: integer range 0 to 15:=0;
signal count2: integer range 0 to 4:=0;
signal count3: integer range 0 to 4:=0;
signal datanumber: integer range 0 to 511;
signal rec_data: integer range 0 to 511;

signal a: signed(59 downto 0);
signal a1: signed(60 downto 0);

signal sil: std_logic:='0';
begin
fft_design:component fft_wrapper
 port map
(
    A_0(29 downto 0) => A_0(29 downto 0),
      A_1(29 downto 0) => A_1(29 downto 0),
      B_0(29 downto 0) => B_0(29 downto 0),
      B_1(29 downto 0) => B_1(29 downto 0),
      P_0(59 downto 0) => P_0(59 downto 0),
      P_1(59 downto 0) => P_1(59 downto 0),
      fft_clk => fft_clk,
      adresb_window(8 downto 0) => adresb_window(8 downto 0),
      adresa_fft(7 downto 0) => adresa_fft(7 downto 0),
      adresb_fft(7 downto 0) => adresb_fft(7 downto 0),
      fft_reset => fft_reset,
      clk => clk,
      dina_fft(31 downto 0) => dina_fft(31 downto 0),
      doutb_window(19 downto 0) => doutb_window(19 downto 0),
      doutb_fft(31 downto 0) => doutb_fft(31 downto 0),
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
      wea_fft(0) => wea_fft(0));



fft_clk<=clockcounter(1);


s_axis_config_tdata_0<="00000001";
s_axis_config_tvalid_0<='1';
s_axis_data_tvalid_0<='1';
s_axis_data_tlast_0<='0';
a1<=('0'& a);

process(clk)
begin

    
    if falling_edge(clk) then
        clockcounter<=clockcounter+1;
    end if;
    end process;

process(clk,start_fft)
begin

    
        
    if falling_edge(clk) and start_fft='1' and sil='0'  then
        case state is
            when hazir=>
                if count<3 then
                    count<=count+1;
                    state<=hazir;
                else 
                   count<=0;
                   fft_reset<='1';
                   state<=bekle;
               end if;     
                
            
            when  bekle =>
               if count1= 9 then
                 adresb_window<=(others=>'0');
                 count1<= count1+1;
                 state<=bekle;
               elsif count1 = 15 then 
                 s_axis_data_tdata_0<= (bos& doutb_window);
                 state<=write;
                 datanumber<=datanumber+1;
                 count1<=0;
               else 
                 count1<=count1+1;
                 state<=bekle;
                       
               end if;    
               
            when write=> 
                
                if datanumber<511 then
                   if count2=0 then 
                     adresb_window<=adresb_window+1; 
                     count2<=count2+1;
                     state<= write;
                   elsif count2=1 then
                     count2<=count2+1;
                     state<= write;   
                   elsif count2=2 then
                     s_axis_data_tdata_0<= (bos& doutb_window);
                     count2<=count2+1;
                     state<= write;
                   else 
                     count2<=0;
                     datanumber<=datanumber+1;
                     state<=write;
                    end if;
                else
                     if count2=0 then 
                     adresb_window<=adresb_window+1; 
                     count2<=count2+1;
                     state<= write;
                   elsif count2=1 then
                     count2<=count2+1;
                     state<= write;   
                   elsif count2=2 then
                     s_axis_data_tdata_0<= (bos& doutb_window);
                     count2<=count2+1;
                     state<= write;
                   else 
                     count2<=0;
                     state<=outbekle;
                     datanumber<=0;
                     end if;
                 end if;
                 
                 
            when outbekle=> 
                wea_fft<="1";
                if m_axis_data_tvalid_0<='0' then
                    state<= outbekle;
                else
                   if rec_data=0 then
                    if  count3 =0 then
                       A_0<=m_axis_data_tdata_0(29 downto 0);
                       B_0<=m_axis_data_tdata_0(29 downto 0);
                       A_1<=m_axis_data_tdata_0(61 downto 32);
                       B_1<=m_axis_data_tdata_0(61 downto 32);
                       count3<=count3+1;
                       state<=outbekle;
                       
                    elsif count3= 1 then
                        a<=signed(P_0)+signed(P_1);
                        count3<=count3+1;
                        state<=outbekle;  
                    elsif count3= 2 then 
                        adresa_fft<=(others=>'0');
                        dina_fft<=std_logic_vector(a1(56 downto 25));
                        count3<=count3+1;
                        state<=outbekle;
                    else
                        count3<=0;
                        
                        rec_data<=rec_data+1;
                        state<=outbekle; 
                        
                     end if;
                          
                     elsif rec_data>0 and rec_data<255 then
                    if  count3 =0 then
                       A_0<=m_axis_data_tdata_0(29 downto 0);
                       B_0<=m_axis_data_tdata_0(29 downto 0);
                       A_1<=m_axis_data_tdata_0(61 downto 32);
                       B_1<=m_axis_data_tdata_0(61 downto 32);
                       count3<=count3+1;
                       state<=outbekle;
                       
                    elsif count3= 1 then
                        a<=signed(P_0)+signed(P_1);
                        count3<=count3+1;
                        state<=outbekle;  
                    elsif count3= 2 then 
                        adresa_fft<=adresa_fft+1;
                        dina_fft<=std_logic_vector(a1(56 downto 25));
                        count3<=count3+1;
                        state<=outbekle;
                    else
                        count3<=0;
                        rec_data<=rec_data+1;
                        state<=outbekle; 
                        
                     end if;
                   
                        
                  
                 
                     else
                         if  count3 =0 then
                            A_0<=m_axis_data_tdata_0(29 downto 0);
                            B_0<=m_axis_data_tdata_0(29 downto 0);
                            A_1<=m_axis_data_tdata_0(61 downto 32);
                            B_1<=m_axis_data_tdata_0(61 downto 32);
                            count3<=count3+1;
                            state<=outbekle;
                       
                    elsif count3= 1 then
                            a<=signed(P_0)+signed(P_1);
                         
                            count3<=count3+1;
                            state<=outbekle;  
                    elsif count3= 2 then 
                            adresa_fft<=adresa_fft+1;
                            dina_fft<=std_logic_vector(a1(56 downto 25));
                            count3<=count3+1;
                            state<=outbekle;
                    else
                        
                        count3<=0;
                        rec_data<=0;
                        ready_out<='1';
                        sil<='1';
                        start_fft<='0';
                        fft_reset<='0';
                        state<=hazir; 
                        adresa_fft<=(others=>'0');
                     
                     end if;
                     end if;
                     end if;
                     end case;
                     end if;
                     end process;
                      
                   
                
                
            
            
            









end Behavioral;
