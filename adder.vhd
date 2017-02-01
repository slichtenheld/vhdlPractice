library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity adder is 
	generic (width : positive := 32);
	port(
		in0		: in std_logic_vector(width - 1 downto 0);
		in1 	: in std_logic_vector(width - 1 downto 0);
		sum 	: out std_logic_vector(width - 1 downto 0);
		carry	: out std_logic
	);
end adder;



architecture BHV1 of adder is 

	signal temp	: unsigned(width downto 0);


begin
	
	temp 	<= resize(unsigned(in1),width+1)+resize(unsigned(in0),width+1);
	sum 	<= std_logic_vector(temp(width-1 downto 0));
	carry 	<= std_logic(temp(width));

end BHV1;


architecture BHV2 of adder is

begin
	process (in0,in1)
		variable temp: unsigned(width downto 0); --temps updated immediately
	begin
		temp 	:= unsigned("0"&in1) + unsigned("0"&in0);
		sum 	<= std_logic_vector(temp(width-1 downto 0));
		carry 	<= std_logic(temp(width));
	end process;

end BHV2;

