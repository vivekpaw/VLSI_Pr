library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_4bit is
    Port ( clk,rst : in  STD_LOGIC;
           enr,enw : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (3 downto 0);
           full,empty : out  STD_LOGIC);
end FIFO_4bit;

architecture Behavioral of FIFO_4bit is

type memory_type is array (0 to 7) of std_logic_vector(3 downto 0);

		signal memory : memory_type;

		signal readptr,writeptr : std_logic_vector(3 downto 0):="0000";  

		--signal cnt:std_logic_vector(24 downto 0);

		--signal clk1:std_logic;
begin

	FIFO_Process: process(clk)

		begin

		if(clk'event and clk='1' and enw ='1' and enr='0') then --WRITE OPERATION

					memory(conv_integer(writeptr)) <= datain;

					writeptr <= writeptr + '1';  

		end if;

		if(clk'event and clk='1' and enr ='1' and enw='0') then  --READ OPERATION

					dataout <= memory(conv_integer(readptr));

					readptr <= readptr + '1';      
		end if;

		if(readptr = "1000") then     

				empty<='1';

		else

				empty<='0';

		end if;

		if(writeptr = "1000") then       

				full <='1';

		else

				full <='0';
		end if;

	end process;  

end Behavioral;