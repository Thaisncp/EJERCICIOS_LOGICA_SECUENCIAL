--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ejer3_4 is
	Port (CLK: in  STD_LOGIC;
         Q: out  STD_LOGIC_VECTOR (3 downto 0));
end Ejer3_4;

architecture Behavioral of Ejer3_4 is
signal QN : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	Q <= QN;
	process(CLK)
		begin
			if (CLK'event and CLK = '0') then
					QN <= not((QN (3) or QN (2)) or QN (1)) & QN (3 downto 1);
			end if;
	end process;
end Behavioral;

