--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont3_9 is
	Port (CLK, X : in  STD_LOGIC;
           Z1, Z2 : inout  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3 downto 0));
end cont3_9;

architecture Behavioral of cont3_9 is
signal QN: std_logic_vector(3 downto 0) := "0000";
begin
	Q <= QN;
	process(CLK, X) 
	begin
	if(CLK'event and CLK = '1') then
		if(X = '0') then
			QN <= QN + 1;
		else
			QN <= QN - 1;
		end if;
		if(QN (0) = '0') then
			Z1 <= '1';
			Z2 <= '0';
		else
			Z1 <= '0';
			Z2 <= '1';
		end if;
	end if;
	end process;
end Behavioral;

