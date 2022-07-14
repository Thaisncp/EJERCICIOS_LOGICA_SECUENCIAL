--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont3_6 is
	Port (RST, CLK : in  STD_LOGIC;
         Q : out  STD_LOGIC_VECTOR (2 downto 0));
end cont3_6;

architecture Behavioral of cont3_6 is
signal QN : STD_LOGIC_VECTOR (2 downto 0);
begin
	Q <= QN;
	process(CLK, RST)
	begin
		if (CLK'event and CLK = '1') then
			if(RST = '0' or QN = "101") then
				QN <= "000";
			elsif(QN = "000") then
				QN <= QN + 1;
			else
				QN <= QN + 2;
			end if;
		end if;
	end process;
end Behavioral;

