library ieee;
USE ieee.std_logic_1164.all;
USE work.all;

entity toplevel is port(
	clk, left_in, right_in, haz_in, rst: in std_logic;
	lights: out std_logic_vector(5 downto 0));
end toplevel;


architecture structure of toplevel is

	component Counter_lab4
		port(CLK	: in std_logic; 
				RST : in std_logic;
				clk_out: out std_logic);
	end component;
	
	component taillight
		port (clk, left_in, right_in, haz_in, rst : in std_logic;
				lights: out std_logic_vector(5 downto 0));
	end component;
	
	signal slow_clk_net: std_logic;
	
	
begin
	
	COUNTER_1: Counter_lab4 port map (CLK => clk,
											RST => rst, 
											clk_out => slow_clk_net);
	
	TAILLIGHT_1: taillight port map (clk => slow_clk_net,
												rst => rst,
												left_in => left_in,
												right_in => right_in,
												haz_in => haz_in,
												lights => lights);
end structure;