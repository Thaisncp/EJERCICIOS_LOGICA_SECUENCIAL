--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont3_19 is
	 Port (CLK, X : in  STD_LOGIC;
          Q : out  STD_LOGIC_VECTOR (2 downto 0));
end cont3_19;

architecture Behavioral of cont3_19 is
type estados is (N0,N1,N2,N3,N4,N5,N6,N7);
signal presente, futuro : estados;
begin
	process_1 : process(presente, X) begin
		case presente is
			when N0 =>
				if X = '0' then
					futuro <= N1;
				end if;
			when N1 =>
				if X = '0' then 
					futuro <= N2;
				else
					futuro <= N4;
				end if;
			when N2 =>
				if X = '0' then
					futuro <= N3;
				else
					futuro <= N5;
				end if;
			when N3 =>
				if X = '0' then
					futuro <= N4;
				else
					futuro <= N1;
				end if;
			when N4 => 
				if X = '0' then 
					futuro <= N5;
				else
					futuro <= N2;
				end if;
			when N5 => futuro <= N6;
			when N6 => futuro <= N7;
			when N7 =>
				if X = '0' then
					futuro <= N0;
				else
					futuro <= N3;
				end if;
		end case;
	end process process_1;
	
	process_2 : process(presente) begin
		case presente is
			when N0 => Q <= "000";
			when N1 => Q <= "001";
			when N2 => Q <= "010";
			when N3 => Q <= "011";
			when N4 => Q <= "100";
			when N5 => Q <= "101";
			when N6 => Q <= "110";
			when N7 => Q <= "111";
		end case;
	end process process_2;
	
	process_3 : process(CLK) begin	
		if CLK'event and CLK = '1' then
			presente <= futuro;
		end if;
	end process process_3;
end Behavioral;

