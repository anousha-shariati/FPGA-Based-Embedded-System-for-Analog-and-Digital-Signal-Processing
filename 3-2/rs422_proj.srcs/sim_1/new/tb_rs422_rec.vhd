----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2024 12:43:34 PM
-- Design Name: 
-- Module Name: tb_rs422_rec - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_rs422_rec is
--  Port ( );
end tb_rs422_rec;

architecture Behavioral of tb_rs422_rec is

component rs422_rec
generic(
           clk_baudrate : integer := 2605
           );
        port (clk_in   : in std_logic;
              rx_in    : in std_logic;
              rx_valid : out std_logic;
              rx_out   : out std_logic_vector (7 downto 0));
    end component;

    signal clk_in   : std_logic;
    signal rx_in    : std_logic;
    signal rx_valid : std_logic;
    signal rx_out   : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 20 ns; 
    constant rxPeriod : time := 60 ns; 

begin

dut : rs422_rec
    port map (clk_in   => clk_in,
              rx_in    => rx_in,
              rx_valid => rx_valid,
              rx_out   => rx_out);


    stimuli : process
    begin
     rx_in <= '0';
     wait for rxPeriod/4;
     rx_in <= '1';
     wait for rxPeriod/2;
     end process;
      
      clock_proc: process
      begin
      clk_in <= '0';
      wait for TbPeriod/2;
      clk_in <= '1';
      wait for TbPeriod/2;
      end process;
    
   
end Behavioral;
