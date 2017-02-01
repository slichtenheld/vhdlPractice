

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_tb is
generic(WIDTH: positive := 8);
end reg_tb;


architecture TB of reg_tb is

	signal input: std_logic_vector(WIDTH-1 downto 0) := (others=>'0');
	signal output: std_logic_vector(WIDTH-1 downto 0);
	signal en 	: std_logic := '0';
	signal rst 	: std_logic := '1';
	signal clk 	: std_logic := '0';
	signal done : std_logic := '0';
begin

	UUT: entity work.reg
		generic map (WIDTH)
		port map(clk,rst,en,input,output);

	clk <= not clk and not done after 10 ns;

	process 
	begin

		wait for 20 ns;
		rst <= '0';

		wait for 10 ns;
		input <= (others=>'1');

		wait for 30 ns;
		en <= '1';

		for i in 0 to 255 loop
			wait until rising_edge(clk);
			input <= std_logic_vector( to_unsigned(i,input'length) + 1);
		end loop;

		wait for 10 ns;

		done <= '1';

		wait;

	end process;


end TB;