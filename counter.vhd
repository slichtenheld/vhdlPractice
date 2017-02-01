

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity counter is 
	generic (MAXCOUNT : positive := 15); 
	port (
		clk		: in std_logic;
		rst 	: in std_logic;
		up		: in std_logic;
		down 	: in std_logic;
		output	: out std_logic_vector( integer(floor(log2(real(MAXCOUNT)))) downto 0)
	);
end counter;


architecture BHV of counter is

	signal count : std_logic_vector( integer(floor(log2(real(MAXCOUNT)))) downto 0);

begin

	process(clk,rst)
	begin

		if (rst='1') then
			count <= (others=>'0');
		elsif (rising_edge(clk)) then
			if (up='1' and down='0') then
				count <= std_logic_vector( unsigned(count) + 1);
			end if;
			if (down='1' and up='0') then
				count <= std_logic_vector( unsigned(count) - 1);
			end if;
		end if;

	end process;

	output <= count;



end architecture ; -- BHV
