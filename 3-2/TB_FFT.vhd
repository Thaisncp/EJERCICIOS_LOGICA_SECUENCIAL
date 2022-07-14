--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_FFT IS
END TB_FFT;
 
ARCHITECTURE behavior OF TB_FFT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFT
    PORT(
         T : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
 --Inputs
   signal T : std_logic := '0';
   signal CLK : std_logic := '0';

	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFT PORT MAP (
          T => T,
          CLK => CLK,
          Q => Q,
          QN => QN);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		T <= '0';
      wait for clk_period*10;
		T <= '1';
      wait;
   end process;
END;
