--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_cont3_8 IS
END TB_cont3_8;
 
ARCHITECTURE behavior OF TB_cont3_8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont3_8
    PORT(
         X : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont3_8 PORT MAP (
          X => X,
          CLK => CLK,
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
      wait for clk_period;
		X <= '0';
		wait for clk_period*10;
		X <= '1';
      wait;
   end process;

END;
