--Thais Cartuche
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Luces3_5 IS
END TB_Luces3_5;
 
ARCHITECTURE behavior OF TB_Luces3_5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Luces3_5
    PORT(
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         SN : INOUT  std_logic_vector(0 to 2);
         EO : INOUT  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

	--BiDirs
   signal SN : std_logic_vector(0 to 2);
   signal EO : std_logic_vector(0 to 2);

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Luces3_5 PORT MAP (
          CLK => CLK,
          Q => Q,
          SN => SN,
          EO => EO
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
		if(Q = "1000") then
			wait for 20 sec;
		elsif (Q = "0100") then
			wait for 5 sec;
		elsif (Q = "0010") then
			wait for 20 sec;
		elsif (Q = "0001") then
			wait for 5 sec;
		end if;
      wait;
   end process;
END;
