--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cron3_11 is
	Port (CLK : in  STD_LOGIC;
         D1, D2 : out  STD_LOGIC_VECTOR (0 to 6);
         Q1, Q2 : out  STD_LOGIC_VECTOR (0 to 3));
end cron3_11;

architecture Behavioral of cron3_11 is
signal QN1: STD_LOGIC_VECTOR(0 to 3) := "0000";
	signal QN2 : STD_LOGIC_VECTOR(0 to 3) := "0000";
begin
	Q1 <= QN1;
	Q2 <= QN2;
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			QN1 <= QN1 + 1;
			if(QN1 = "1001") then
				QN1 <= "0000";
				QN2 <= QN2 + 1;
			end if;
			if (QN2 = "1001" and QN1 = "1001") then
				QN2 <= "0000";
			end if;
			case QN1 is
				when "0000" => D1 <= "0000001";
				when "0001" => D1 <= "1001111";
				when "0010" => D1 <= "0010010";
				when "0011" => D1 <= "0000110";
				when "0100" => D1 <= "1001100";
				when "0101" => D1 <= "0100100";
				when "0110" => D1 <= "0100000";
				when "0111" => D1 <= "0001110";
				when "1000" => D1 <= "0000000";
				when "1001" => D1 <= "0000100";
				when others => D1 <= "1111111";
			end case;
			case QN2 is
				when "0000" => D2 <= "0000001";
				when "0001" => D2 <= "1001111";
				when "0010" => D2 <= "0010010";
				when "0011" => D2 <= "0000110";
				when "0100" => D2 <= "1001100";
				when "0101" => D2 <= "0100100";
				when "0110" => D2 <= "0100000";
				when "0111" => D2 <= "0001110";
				when "1000" => D2 <= "0000000";
				when "1001" => D2 <= "0000100";
				when others => D2 <= "1111111";
			end case;
		end if;
	end process;
end Behavioral;

