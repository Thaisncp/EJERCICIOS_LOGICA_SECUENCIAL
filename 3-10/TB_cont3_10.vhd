--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_cont3_10 IS
END TB_cont3_10;
 
ARCHITECTURE behavior OF TB_cont3_10 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont3_10
    PORT(
         CLK : IN  std_logic;
         C : IN  std_logic;
         S1 : INOUT  std_logic;
         S2 : INOUT  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal C : std_logic := '0';

	--BiDirs
   signal S1 : std_logic;
   signal S2 : std_logic;

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont3_10 PORT MAP (
          CLK => CLK,
          C => C,
          S1 => S1,
          S2 => S2,
          Q => Q
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
      -- hold reset state for 100 ns.
		wait for clk_period*20;
		C <= '0';
      wait for clk_period*20;
		C <= '1';
      wait;
   end process;

END;
