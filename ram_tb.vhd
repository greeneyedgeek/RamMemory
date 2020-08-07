-- File Name: ram_tb.vhd
-- Project Name: RAM VHDL IMPLEMENTATION
--
-- This is a simple test bench for the ram entity
--
-- Author: Gabriel Fontaine-Escobar	
-- Date Created: Aug. 05, 2020
-- Date Modified: Aug. 06, 2020
--																										
-- References 
--																					
-- Estudio FPGA.(August 2020)
-- https://www.youtube.com/channel/UCF5kM3jOzi0LzEfwQTYXkDg
--
-- Stack Overflow.(August 2020)
-- https://stackoverflow.com/questions/17904514/

library ieee;
use ieee.std_logic_1164.all;

entity ram_tb is
end ram_tb;

architecture sim of ram_tb is
	constant half_period : time := 1 ns;
	signal clk     : std_logic := '0';
   signal wren    : std_logic;
   signal address : std_logic_vector(9 downto 0);
   signal wdata   : std_logic_vector(7 downto 0);
   signal rdata   : std_logic_vector(7 downto 0);
   
	component ram 
	port(
        clk     : in std_logic;
        wren    : in std_logic;
        address : in std_logic_vector(9 downto 0);
        wdata   : in std_logic_vector(7 downto 0);
        rdata   : out std_logic_vector(7 downto 0) );
	end component;
begin     
	clk <= not clk after half_period;
	
	uut : ram port map (
		clk => clk,
		wren => wren,
		address => address,
		wdata => wdata,
		rdata => rdata
	);
	
	process
	begin
		address <= "00" & x"00";
		wren <= '0';
		wait until(rising_edge(clk));
		address <= "00" & x"01";
		wdata <= x"CA";
		wren <= '1';
		wait until(rising_edge(clk));
		address <= "00" & x"00";
		wren <= '0';
		wait until(rising_edge(clk));
		address <= "00" & x"01";
		wren <= '0';
		wait until(rising_edge(clk));
		address <= "00" & x"02";
		wren <= '0';
		wait until(rising_edge(clk));
		address <= "00" & x"01";
		wren <= '0';
		wait;
	end process;
end sim; -- of ram_tb