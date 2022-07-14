--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_cont3_9 IS
END TB_cont3_9;
 
ARCHITECTURE behavior OF TB_cont3_9 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont3_9
    PORT(
         CLK : IN  std_logic;
         X : IN  std_logic;
         Z1 : INOUT  std_logic;
         Z2 : INOUT  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal X : std_logic := '0';

	--BiDirs
   signal Z1 : std_logic;
   signal Z2 : std_logic;

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont3_9 PORT MAP (
          CLK => CLK,
          X => X,
          Z1 => Z1,
          Z2 => Z2,
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
		X <= '0';
      wait for clk_period*10;
		X <= '1';
      wait;
   end process;

END;
