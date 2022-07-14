--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont3_8 is
	Port (X, CLK : in  STD_LOGIC;
         Q : out  STD_LOGIC_VECTOR (1 downto 0));
end cont3_8;

architecture Behavioral of cont3_8 is
signal QN : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
	Q <= QN;
	process(CLK)
	begin
		if (CLK'event and CLK = '1') then
			if (X = '0') then
				QN <= QN + 1;
			else 
				QN <= QN - 1;
			end if;
		end if;
	end process;
end Behavioral;

