--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_maquina3_20 IS
END TB_maquina3_20;
 
ARCHITECTURE behavior OF TB_maquina3_20 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maquina3_20
    PORT(
         CLK : IN  std_logic;
         COIN : IN  std_logic_vector(4 downto 0);
         CAM : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal COIN : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal CAM : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maquina3_20 PORT MAP (
          CLK => CLK,
          COIN => COIN,
          CAM => CAM
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
      COIN <= "00101";
      wait for 100 ns;
		COIN <= "01010";
		wait for 100 ns;
		COIN <= "10100";
		wait for 100 ns;
		COIN <= "00000";		
      wait;
   end process;

END;
