
library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is
	generic(width : positive :=32);
	port (
		sel 	: in std_logic;
		in0		: in std_logic_vector(width-1 downto 0);
		in1		: in std_logic_vector(width-1 downto 0);
		output	: out std_logic_vector(width-1 downto 0)
	);

end mux2_1;

architecture BHV of mux2_1 is
begin
	process (sel,in0,in1)
	begin
		if (sel='0') then
			output <= in0;
		else 
			output <= in1;
		end if;
	end process;
end BHV;

