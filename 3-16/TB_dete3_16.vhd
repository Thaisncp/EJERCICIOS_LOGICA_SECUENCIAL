--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_dete3_16 IS
END TB_dete3_16;
 
ARCHITECTURE behavior OF TB_dete3_16 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dete3_16
    PORT(
         CLK : IN  std_logic;
         X : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dete3_16 PORT MAP (
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
      -- hold reset state for 100 ns.
		X <= '1';
		wait for clk_period;
		X <= '1'	;
      wait for clk_period;
		X <= '0'	;
		wait for clk_period;
		X <= '0'	;
		wait for clk_period;
		X <= '1'	;
		wait for clk_period;
		X <= '1'	;
      wait;
   end process;

END;
