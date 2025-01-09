-- author: Conor Carrigan
--file ounter.vhd
--comments: this is the Clock VHDL file for lab 4 Thunderbird 

library ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Counter_lab4 is
    Port (
        CLK   : in  std_logic;  -- 50 MHz input clock
        RST    : in  std_logic;  -- Asynchronous reset
        clk_out  : out std_logic   -- 2 Hz output clock
		  --LED_out : out std_logic -- test led 
    );
end Counter_lab4;


architecture rtl of Counter_lab4 is
	signal counter: integer;
    signal clk_reg: std_logic;
    constant N: integer := 25000000; -- Half the period count (25,000,000 cycles)
	 signal aaa : std_logic_vector(24 downto 0);
	 --signal LED : std_logic :='1';
begin

    process(CLK, RST)
	 variable cnt : unsigned(23 downto 0);
    begin
        if RST = '0' then
            counter <= 0;
            clk_reg <= '0';
				cnt := (others=>'0');
				--LED <= '0';
        elsif rising_edge(CLK) then
				cnt := cnt + 1;
            if counter = N - 1 then
                counter <= 0;
					 --LED <= not LED;
                clk_reg <= not clk_reg; -- Toggle the output clock
            else
                counter <= counter + 1;
            end if;
        end if;
		  clk_out <= cnt(23);
    end process Counter_lab4;
	 
	 --aaa <= conv_std_logic_vector(counter, 25);
	--clk_out <= aaa(24);
    --clk_out <= clk_reg;
	 --LED_out <= LED;
end rtl;