

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delay_tb is 
	generic(WIDTH : positive:= 8;
			DELAY: 	positive:=4);
end delay_tb;



architecture TB of delay_tb is

	signal rst: 	std_logic := '0';
	signal en: 		std_logic := '0'; 
	signal clk: 	std_logic := '0';
	signal input:	std_logic_vector(WIDTH-1 downto 0) := (others=>'0');
	signal output: std_logic_vector(WIDTH-1 downto 0);
	signal done:	std_logic := '0';

begin

	UUT: entity work.delay 
		generic map (DELAY,WIDTH)
		port map (clk,rst,en,input,output);

	clk <= not clk and not done after 10 ns;

	process
	begin

	wait for 5 ns;
	rst <= '1';

	wait for 10 ns;
	rst <= '0';
	input <= (others=>'1');

	wait for 50 ns;

	en <= '1';

	for i in 0 to 255 loop
		wait until rising_edge(clk);
		input <= std_logic_vector(to_unsigned(i,input'length));
	end loop;

	done <= '1';

	wait;

	end process;

end architecture; -- TB



