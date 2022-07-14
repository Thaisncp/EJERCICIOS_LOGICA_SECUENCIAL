--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina3_20 is
	Port (CLK : in  STD_LOGIC;
			COIN : in  STD_LOGIC_VECTOR(4 downto 0);
			CAM : out  STD_LOGIC_VECTOR(3 downto 0));
end maquina3_20;

architecture Behavioral of maquina3_20 is
type estados is (inicial, coin5, coin10, coin20);
signal presente, futuro : estados;
begin
 procesoMaquina : process(presente, COIN) begin
	case presente is
		when inicial => CAM <= "0000";
			if COIN = "00101" then
				futuro <= coin5;
			elsif COIN = "01010" then
				futuro <= coin10;
			elsif COIN = "10100" then
				futuro <= coin20;
			else
				futuro <= inicial;
			end if;
		when coin5 => CAM <= "0000";
			futuro<= inicial;
		when coin10 => CAM <= "0101";
			futuro<= inicial;
		when coin20 => CAM <= "1111";
			futuro<= inicial;
	end case;
 end process procesoMaquina;

 process_1 : process(CLK) begin
	if CLK'event and CLK = '1' then
		presente <= futuro;
	end if;
 end process process_1;
end Behavioral;

