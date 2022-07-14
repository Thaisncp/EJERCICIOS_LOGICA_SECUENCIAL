--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DE3_14 is
	Port (CLK, X : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (0 to 2));
end DE3_14;

architecture Behavioral of DE3_14 is
	type estados is (A, B, C ,D, E, F, G, H);
	signal edo_presente, edo_futuro: estados;
begin
	process_1 : process(edo_presente, X) begin
		case edo_presente is
			when A => Q <= "000";
				if X = '1' then
					edo_futuro <= B;
				else
					edo_futuro <= H;
				end if;
			when B => Q <= "001";
				if X = '1' then 
					edo_futuro <= C;
				else
					edo_futuro <= A;
				end if;
			when C => Q <= "011";
				if X = '1' then
					edo_futuro <= D;
				else
					edo_futuro <= B;
				end if;
			when D => Q <= "010";
				if x = '1' then
					edo_futuro <= E;
				else
					edo_futuro <= C;
				end if;
			when E => Q <= "110";
				if x = '1' then
					edo_futuro <= F;
				else
					edo_futuro <= D;
				end if;
			when F => Q <= "111";
				if X = '1' then
					edo_futuro <= G;
				else
					edo_futuro <= E;
				end if;
			when G => Q <= "101";
				if X = '1' then
					edo_futuro <= H;
				else
					edo_futuro <= F;
				end if;
			when H => Q <= "110";
				if X = '1' then
					edo_futuro <= A;
				else
					edo_futuro <= G;
				end if;
			end case;
		end process process_1;
	process_2: process (CLK) begin
		if(CLK'event and CLK = '1') then
			edo_presente <= edo_futuro;
		end if;
	end process process_2;	
end Behavioral;

