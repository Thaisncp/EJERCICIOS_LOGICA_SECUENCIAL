--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg3_3 is
	Port (L, R, CLK, RST: in  STD_LOGIC;
			  S : in STD_LOGIC_VECTOR(0 to 1);
			  Q : out  STD_LOGIC_VECTOR (0 to 3);
           D : in  STD_LOGIC_VECTOR (0 to 3));
           
end Reg3_3;

architecture Behavioral of Reg3_3 is
signal QN : STD_LOGIC_VECTOR (0 to 3);
begin
	Q <= QN;
	process(RST, CLK, R, S, L, D)
	begin
		if (CLK'event and CLK = '1') then
			if (RST = '1') then
				QN <= "0000";
			elsif (S = "01" ) then
				QN <= QN( 1 to 3) & L;
			elsif (S = "11") then
				QN <= R & QN(0 to 2);
			elsif (S = "10") then
				QN <= D;
			else
				QN <= QN;
			end if;
		end if;
	end process;
end Behavioral;

