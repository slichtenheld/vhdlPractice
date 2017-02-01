
library ieee;
use ieee.std_logic_1164.all;



entity fsm is 
	
	port (
		clk, rst, en 	: in std_logic;
		output			: out std_logic_vector(3 downto 0)
	);

end fsm;

architecture BHV of fsm is
	

	type STATE_TYPE is (STATE_0, STATE_1, STATE_2, STATE_3);
	signal state,next_state : STATE_TYPE;

begin

	process(rst,clk)
	begin

		if (rst='1') then
			state <= STATE_0;
		elsif (rising_edge(clk)) then
			if (en='1') then
				state <= next_state;
			end if;
		end if;
	end process;

	process (state)
	begin
		case state is 
 
			when STATE_0 =>
				output <= "0001";
				next_state <= STATE_1;
			when STATE_1 =>
				output <= "0010";
				next_state <= STATE_2;
			when STATE_2 =>
				output <= "0100";
				next_state <= STATE_3;
			when STATE_3 =>
				output <= "1000";
				next_state <= STATE_0;
			when others => null;
		end case;
	end process;

end architecture ; -- BHV
	


