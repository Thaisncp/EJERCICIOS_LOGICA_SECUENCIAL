--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Reg3_3 IS
END TB_Reg3_3;
 
ARCHITECTURE behavior OF TB_Reg3_3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg3_3
    PORT(
         L : IN  std_logic;
         R : IN  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic;
         S : IN  std_logic_vector(0 to 1);
         Q : OUT  std_logic_vector(0 to 3);
         D : IN  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal L : std_logic := '0';
   signal R : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal S : std_logic_vector(0 to 1) := (others => '0');
   signal D : std_logic_vector(0 to 3) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(0 to 3);
	
  -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg3_3 PORT MAP (
          CLK => CLK,
          RST => RST,
          L => L,
          R => R,
          S => S,
          D => D,
          Q => Q
        );

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
      D <= "0101";
		L <= '1';
		R <= '0';
		S <= "10";
      --wait for 100 ns;	
      wait for clk_period;
		S <= "01";
		wait for clk_period;
		S <= "11";
		wait for clk_period;
		S <= "00";
		wait for clk_period;
		RST <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
