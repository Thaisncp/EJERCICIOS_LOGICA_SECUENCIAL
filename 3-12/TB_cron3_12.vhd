--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_cron3_12 IS
END TB_cron3_12;
 
ARCHITECTURE behavior OF TB_cron3_12 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cron3_12
    PORT(
         CLK : IN  std_logic;
         D1 : OUT  std_logic_vector(0 to 6);
         D2 : OUT  std_logic_vector(0 to 6);
         D3 : OUT  std_logic_vector(0 to 6);
         Q1 : OUT  std_logic_vector(0 to 3);
         Q2 : OUT  std_logic_vector(0 to 3);
         Q3 : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal D1 : std_logic_vector(0 to 6);
   signal D2 : std_logic_vector(0 to 6);
   signal D3 : std_logic_vector(0 to 6);
   signal Q1 : std_logic_vector(0 to 3);
   signal Q2 : std_logic_vector(0 to 3);
   signal Q3 : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cron3_12 PORT MAP (
          CLK => CLK,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3
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
      wait for clk_period;
      wait;
   end process;

END;
