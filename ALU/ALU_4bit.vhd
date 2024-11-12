library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU_4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_4bit;

architecture Behavioral of ALU_4bit is

begin
process (a, b, sel)
begin
case sel is
	when "000" => y <= a + b;
	when "001" => y <= a - b;
	when "010" => y <= b - a;
	when "011" => y <= a and b;
	when "100" => y <= a or b;
	when "101" => y <= a nand b;
	when "110" => y <= a xor b;
	when "111" => y <= a nor b;
	when others => null;
end case;
end process;
end Behavioral;

