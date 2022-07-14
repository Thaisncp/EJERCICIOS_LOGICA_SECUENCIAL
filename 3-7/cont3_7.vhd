--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont3_7 is
	Port (RST, CLK : in  STD_LOGIC;
          Q : out  STD_LOGIC_VECTOR (2 downto 0));
end cont3_7;

architecture Behavioral of cont3_7 is
signal QN :  STD_LOGIC_VECTOR (2 downto 0);
begin
	Q <= QN;
	process(CLK, RST)
	begin
		if (CLK'event and CLK = '1') then
			if (RST = '0' or QN = "111") then
				QN <= "000";
			else
				QN <= QN + 1;
			end if;
		end if;
	end process;
end Behavioral;

