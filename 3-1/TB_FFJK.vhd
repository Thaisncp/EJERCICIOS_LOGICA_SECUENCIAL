--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_FFJK IS
END TB_FFJK;
 
ARCHITECTURE behavior OF TB_FFJK IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFJK
    PORT(J, K, CLK : in  STD_LOGIC;
           Q, QN : out  STD_LOGIC);
    END COMPONENT;
 --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal CLK : std_logic := '0';

	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFJK PORT MAP (
          J => J,
          K => K,
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
      -- hold reset state for 100 ns.
      wait for clk_period*10;
		J <= '0';
		K <= '1';
		wait for clk_period*10;
		J <= '0';
		K <= '0';
		wait for clk_period*10;
		J <= '1';
		K <= '0';
		wait for clk_period*10;
		J <= '1';
		K <= '1';
      wait;
   end process;

END;
