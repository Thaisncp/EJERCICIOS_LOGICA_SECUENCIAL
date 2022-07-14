--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DE3_13 is
	Port (CLK, X: in  STD_LOGIC;
			Q : out STD_LOGIC);
end DE3_13;

architecture Behavioral of DE3_13 is
	type estados is (A, B, C ,D);
	signal edo_presente, edo_futuro: estados := A;
begin
	process_1 : process (edo_presente, X) begin
		case edo_presente is
			when A => Q <= '0';
				if X = '0' then
					edo_futuro <= D;
				else
					edo_futuro <= B;
				end if;
			when B => Q <= '0';
				if X = '0' then
					edo_futuro <= D;
				else
					edo_futuro <= C;
				end if;
			when C => Q <= '0';
				if X = '0' then
					edo_futuro <= D;
				else
					edo_futuro <= B;
				end if;
			when D =>
				if X = '0' then
					edo_futuro <=D;
					Q <= '0';
				else
					edo_futuro <= A;
					Q <= '1';
				end if;
		end case;
	end process process_1;
process_2: process (CLK) begin
	if(CLK'event and CLK = '1') then
		edo_presente <= edo_futuro;
	end if;
end process process_2;
end Behavioral;

