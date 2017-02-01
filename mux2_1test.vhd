library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2_1test is
end mux2_1test;

architecture TB of mux2_1test is 

	-- zero <= (others=>0)
	signal sel: std_logic;
	signal in0,in1,output: std_logic_vector(31 downto 0);

begin

	UUT: entity work.mux2_1
		port map(sel,in0,in1,output);

	process 
	begin

		sel <= '0';
		in0 <= (others=>'0');
		in1 <= (others=>'1');
		wait for 10 ns;
		sel <= '1';
		wait for 10 ns;

		wait;

	end process;

end TB;

