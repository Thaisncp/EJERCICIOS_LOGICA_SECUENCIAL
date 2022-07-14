--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont3_10 is
	Port (CLK, C : in  STD_LOGIC;
           S1, S2 : inout  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end cont3_10;

architecture Behavioral of cont3_10 is
signal QN : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	Q <= QN;
	process(CLK, C)
	begin
		if (CLK'event and CLK = '1') then
			if (C = '0') then
				if(QN = "1001") then
					QN <= "0000";
				else
					QN <= QN + 1;
				end if;
			else
				if(QN = "0000") then
					QN <= "1001";
				else
					QN <= QN - 1;
				end if;
			end if;
			if (C = '0' and QN(0) = '1') then
				S1 <= '1';
				S2 <= '0';
			elsif(C = '1' and QN (0) = '0') then
				S1 <= '0';
				S2 <= '1';
			else
				S1 <= '0';
				S2 <= '0';
			end if;
		end if;
	end process;
end Behavioral;

