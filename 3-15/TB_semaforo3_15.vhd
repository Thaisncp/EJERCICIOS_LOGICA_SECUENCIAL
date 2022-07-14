--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_semaforo3_15 IS
END TB_semaforo3_15;
 
ARCHITECTURE behavior OF TB_semaforo3_15 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT semaforo3_15
    PORT(
         CLK : IN  std_logic;
         AUX : IN  std_logic;
         OE : OUT  std_logic_vector(0 to 2);
         SN : OUT  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal AUX : std_logic := '0';

 	--Outputs
   signal OE : std_logic_vector(0 to 2);
   signal SN : std_logic_vector(0 to 2);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: semaforo3_15 PORT MAP (
          CLK => CLK,
          AUX => AUX,
          OE => OE,
          SN => SN
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		AUX <= '0';
      wait for 100 ns;	
		AUX <= '1';
      wait;
   end process;

END;
