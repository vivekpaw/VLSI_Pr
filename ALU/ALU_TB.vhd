LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_4bit PORT MAP (
          a => a,
          b => b,
          sel => sel,
          y => y
        );

    -- Stimulus process
   stim_proc: process
   begin		
      a <= "1010";
		b <= "0101";
		sel <= "000";
		wait for 10 ns;	
		sel <= "001";  
		wait for 10 ns;	
		sel <= "010";
		wait for 10 ns;	
		sel <= "011";
		wait for 10 ns;	
		sel <= "100";
		wait for 10 ns;	
		sel <= "101";
		wait for 10 ns;	
		sel <= "110";
		wait for 10 ns;	
		sel <= "111";
		wait for 10 ns;	

   end process;

END;
