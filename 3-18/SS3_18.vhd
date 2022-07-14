--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SS3_18 is
	Port (CLK, X : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end SS3_18;

architecture Behavioral of SS3_18 is
type estados is (A, B, C, D, E);
signal presente, futuro : estados;
begin
process_1 : process(presente, X) begin
	case presente is
		when A => Q <= '0';
			if X = '0' then
				futuro <= B;
			else
				futuro <= E;
			end if;
		when B => Q <= '1';
			if X = '0' then
				futuro <= A;
			else
				futuro <= C;
			end if;
		when C =>
			if X = '0' then
				futuro <= B;
				Q  <= '0';
			else
				futuro <= C;
				Q <= '1';
			end if;
		when D => Q <= '0'; 
			if X = '0' then
				futuro <= C;
			else
				futuro <= E;
			end if;
		when E => 
			if X = '0' then 
				futuro <= D;
				Q <= '1';
			else
				futuro <= A;
				Q <= '0';
			end if;
	end case;
end process process_1;

process_2 : process (CLK) begin
	if CLK'event and CLK = '1' then
		presente <= futuro;
	end if;
end process process_2;
end Behavioral;

