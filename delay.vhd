
library ieee;
use ieee.std_logic_1164.all;


entity delay is 
	generic(delayAmt: positive:= 4;
			regWidth: positive:=32);
	port(
		clk		: in std_logic;
		rst 	: in std_logic;
		en 		: in std_logic;
		input	: in std_logic_vector(regWidth-1 downto 0);
		output	: out std_logic_vector(regWidth-1 downto 0)
	);
end delay;


architecture BHV of delay is 

--need signals to connect registers
type sig_array is array(0 to delayAmt) of std_logic_vector(regWidth-1 downto 0);
signal regs: sig_array;

begin

	regs(0) <= input;
	
	U_DELAY_REGS: for i in 0 to delayAmt-1 generate
		U_DEL 	: entity work.reg
			generic map(width => regWidth)
			port map( clk =>clk,
					rst => rst,
					en 	=> en,
					input => regs(i),
					output => regs(i+1));
	end generate U_DELAY_REGS;

	output <= regs(delayAmt);


end BHV;