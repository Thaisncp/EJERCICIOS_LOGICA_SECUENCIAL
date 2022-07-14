--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dete3_17 is
	Port (CLK, X : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(0 to 6));
end dete3_17;

architecture Behavioral of dete3_17 is
type estados is (A,B,C,D,E,F,G,H);
signal presente, futuro : estados;
begin
process_1 : process (presente, X) begin
	case presente is
		when A => Q <= "0000000";
			if X = '0' then
				futuro <= B;
			end if;
		when B => Q <= "0000000";
			if X = '1' then
				futuro <= C;
			end if;
		when C => Q <= "0000000";
			if X = '1' then
				futuro <= D;
			end if;
		when D => Q <= "0000000";
			if X = '0' then
				futuro <= E;
			end if;
		when E => Q <= "0000000";
			if X = '1' then
				futuro <= F;
			end if;
		when F => Q <= "0000000";
			if X = '0' then
				futuro <= G;
			end if;
		when G => Q <= "0000000";
			if  X = '1' then
				futuro <= H;
			end if;
		when H =>
			if X = '0' then 
				futuro <= A;
				Q <= "1101111";
			else
				Q <= "0000000";
			end if;
	end case;
end process process_1;

process_2 : process(CLK) begin
	if CLK'event and CLK = '1' then
		presente <= futuro;
	end if;
end process process_2;
end Behavioral;

