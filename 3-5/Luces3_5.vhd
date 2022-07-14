--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Luces3_5 is
	Port (CLK : in  STD_LOGIC;
          Q : out  STD_LOGIC_VECTOR (3 downto 0);
          SN, EO : inout  STD_LOGIC_VECTOR (0 to 2));
end Luces3_5;

architecture Behavioral of Luces3_5 is
signal QN : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	Q <= QN;
	process(CLK)
		begin
			if (CLK'event and CLK = '0') then
					QN <= not((QN (3) or QN (2)) or QN (1)) & QN (3 downto 1);
				if(QN = "1000") then
					SN <= "100";
					EO <= "001";
				elsif (QN = "0100") then
					EO <= "010";
				elsif (QN = "0010") then
					SN <= "001";
					EO <= "100";
				elsif (QN = "0001") then
					SN <= "010";
				end if;
			end if;
	end process;
end Behavioral;

