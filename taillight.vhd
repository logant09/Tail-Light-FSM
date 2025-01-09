library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity taillight is
port (clk, left_in, right_in, haz_in, rst : in std_logic;
	lights: out std_logic_vector(5 downto 0));
end taillight;

architecture rtl of taillight is

type state_t is (ALLOFF, ALLON, LEFT1, LEFT2, LEFT3, RIGHT1, RIGHT2, RIGHT3);
signal state, next_state : state_t;
signal light, light_d : std_logic_vector(5 downto 0);

begin
	next_state_logic_p : process(state)
	begin
		-- defaults
		next_state <= state;
		case state is
			when ALLOFF =>
				--lights <=(others=>'0');
--				if haz_in = '1' then
--					next_state <= ALLON;
--				else
--					next_state <= ALLOFF;
--				end if;
				next_state <= ALLON;
				--light_d <= (others => '1'); 
			when ALLON =>
				--lights <=(others=>'1');
				next_state <= ALLOFF;
				--light_d     <= (others => '0');
			when others =>
				--nothing
		end case;
	end process next_state_logic_p;
	
	taillight_p : process(clk, rst)
	begin
		if (rst = '0') then
			state <= ALLOFF;
			--light <= (others => '0');
		elsif (clk'event and clk = '1') then
			state <= next_state;
			--light <= light_d;
		end if;
	end process taillight_p;
	
	-- name change
	lights(0) <= clk;
end rtl;
