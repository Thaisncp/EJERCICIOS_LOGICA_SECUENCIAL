--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_cont3_6 IS
END TB_cont3_6;
 
ARCHITECTURE behavior OF TB_cont3_6 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont3_6
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont3_6 PORT MAP (
          RST => RST,
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
      RST <= '0';
      wait for clk_period;
		RST <= '1';
      wait;
   end process;

END;
