--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_DE3_14 IS
END TB_DE3_14;
 
ARCHITECTURE behavior OF TB_DE3_14 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DE3_14
    PORT(
         CLK : IN  std_logic;
         X : IN  std_logic;
         Q : OUT  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(0 to 2);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DE3_14 PORT MAP (
          CLK => CLK,
          X => X,
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
      wait for clk_period*10;
      wait;
   end process;

END;
