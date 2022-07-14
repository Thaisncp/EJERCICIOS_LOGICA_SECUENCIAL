--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FFT is
    Port ( T, CLK : in  STD_LOGIC;
           Q, QN : out  STD_LOGIC);
end FFT;

architecture Behavioral of FFT is
signal AUX : STD_LOGIC := '0';
begin
	Q <= AUX;
	QN <= not AUX;
	process(T, CLK)
	begin
		if (CLK'event and CLK = '1') then
			if (T = '1') then
				AUX <= not AUX;
			end if;
		end if;
	end process;
end Behavioral;