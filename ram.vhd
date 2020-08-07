-- File Name: ram.vhd
-- Project Name: RAM VHDL IMPLEMENTATION
--
-- This is the top level entity for a RAM implementation on a Cyclone II
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
use ieee.numeric_std.all;

entity ram is   
    port (
        clk     : in std_logic;
        wren    : in std_logic;
        address : in std_logic_vector(9 downto 0);
        wdata   : in std_logic_vector(7 downto 0);
        rdata   : out std_logic_vector(7 downto 0) );
 end ram;
 
architecture rtl of ram is
    type ram_type is array (0 to 1023) of std_logic_vector(7 downto 0);
    signal memory_sp : ram_type;
begin
    process (clk)
    begin
        if (rising_edge(clk)) then  
            if (wren = '1') then    
                memory_sp(to_integer(unsigned(address))) <= wdata;
            end if;
            rdata <= memory_sp(to_integer(unsigned(address)));
        end if;
    end process;
end rtl; -- of ram               