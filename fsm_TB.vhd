
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_TB is 
end fsm_TB;

architecture TB of fsm_TB is

	signal clk,rst,en 	: std_logic := '0';
	signal output		: std_logic_vector(3 downto 0);
	signal done 		: std_logic := '0';

begin
	
	UUT: entity work.fsm 
		port map(clk,rst,en,output);

	clk <= not clk and not done after 10 ns;

	process
	begin

	wait for 10 ns;
	en <= '1';
	wait for 10 ns;
	rst <= '1';
	wait for 20 ns;
	rst<= '0';
	wait for 120 ns;
	en <= '0';
	wait for 120 ns;
	en <= '1';
	wait for 120 ns;
	done <= '1';
	wait;
	end process;

end architecture ; -- TB