--Thais Cartuche
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semaforo3_15 is
	Port (CLK, AUX : in  STD_LOGIC;
         OE, SN : out  STD_LOGIC_VECTOR(0 to 2));
end semaforo3_15;

architecture Behavioral of semaforo3_15 is
type estados is (INICIO, EO_AMBAR, INICIO_INV, NS_AMBAR);
	
	signal futuro, presente: estados:= INICIO;
	signal verde: STD_LOGIC_VECTOR(0 to 2):="001";
	signal ambar: STD_LOGIC_VECTOR(0 to 2):="010";
	signal rojo: STD_LOGIC_VECTOR(0 to 2):="100";
	
begin
process_1 : process(presente, AUX) begin
	case presente is
		when INICIO =>
			if AUX = '1' then
				futuro <= EO_AMBAR;
			end if;
		when EO_AMBAR => futuro <= INICIO_INV;
		when  INICIO_INV => futuro <= NS_AMBAR;
		when NS_AMBAR => futuro <= INICIO;
	end case;
end process process_1;
	
process_2: process(presente) begin
	case presente is
		when INICIO =>
			SN <= rojo;
			OE <= verde;
		when EO_AMBAR =>
			SN <= rojo;
			OE <= ambar;
		when INICIO_INV =>
			SN <= verde;
			OE <= rojo;
		when NS_AMBAR =>
			SN <= ambar;
			OE <= rojo;
	end case;
end process process_2;

process_3: process(CLK) begin
	if(CLK'event and CLK = '1') then
		presente <= futuro;
	end if;
end process process_3;
end Behavioral;

