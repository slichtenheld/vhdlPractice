

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter_tb is 
	
end counter_tb;


architecture TB of counter_tb is

	signal clk 	: std_logic := '0';
	signal rst 	: std_logic := '1';
	signal up	: std_logic := '0';
	signal down : std_logic := '0';
	signal output: std_logic_vector(3 downto 0);
	signal done : std_logic := '0';

begin

	UUT: entity work.counter 
		port map (clk,rst,up,down,output);

	clk <= not clk and not done after 10 ns;

	process
	begin

		wait for 20 ns;
		rst <= '0';
		wait for 400 ns;
		up <= '1';
		wait for 400 ns;
		down <= '1';
		wait for 400 ns;
		up <='0';
		wait for 400 ns;
		done <= '1';

		wait;

	end process;



end architecture ; -- TB