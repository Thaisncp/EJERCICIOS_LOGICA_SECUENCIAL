--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFJK is
    Port ( J, K, CLK : in  STD_LOGIC;
           Q, QN : out  STD_LOGIC);
end FFJK;

architecture Behavioral of FFJK is
	signal AUX : STD_LOGIC;
begin
	Q <= AUX;
	QN <= not AUX;
	process(J, K, CLK)
	begin
		if (CLK'event and CLK ='1') then
			if(J = '0' and K='0') then
				AUX <= AUX;
			elsif (J = '0' and K = '1') then
				AUX <= '0';
			elsif (J = '1' and K = '0') then
				AUX <= '1';
			else
				AUX <= not AUX;
			end if;
		end if;
	end process;
end Behavioral;	