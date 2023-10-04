library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Serial_Adder is
generic (N : INTEGER:=4); -- N-bit Serial Adder/Subtractor
port(
    A: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input A
    B: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input B
    CLK: in STD_LOGIC; -- Clock Signal
    Control: in STD_LOGIC; -- Addition (0) Subtraction (1) Control
    Load: in STD_LOGIC; -- Parallel Load Control
	 Extract: in STD_LOGIC; -- Extract Control
    Output: out STD_LOGIC_VECTOR(N-1 downto 0); -- Output
	 Borrow_Out : out STD_LOGIC;
	 Carry_Out: out STD_LOGIC
	 );
end Serial_Adder;

architecture Behavioral of Serial_Adder is
signal CarryOut: STD_LOGIC; -- Carry Out
signal A_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0'); -- Register A
signal B_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0'); -- Register B
signal Output_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0');
signal BorrowOut: STD_LOGIC; -- Positive (0) or Negative (1)

begin
-- Sequential Process
process(CLK)
variable Sum: STD_LOGIC;
begin
if(rising_edge(CLK)) then
    if (Load = '1') then
       A_Reg <= A;
        if (Control = '0') then
            -- Addition
            B_Reg <= B;
            CarryOut <= '0';
				BorrowOut <= '0';
        else  
				-- Subtraction
            B_Reg <= not(B); -- 1's complement
            CarryOut <= '1'; -- 2's Complement
				
				if A < B then -- Indicate Negative Sign (Have to Borrow)
					BorrowOut <= '1';
				end if;
        end if;
    else
        -- Right Shift Register B_Reg
        B_Reg <= (B_Reg(0) & B_Reg(N-1 downto 1));
		  
        -- Full-Adder Output Assign to Sum
        Sum := (A_Reg(0) xor B_Reg(0)) xor (CarryOut);
		  
        -- Assign Full-Adder Output to MSB of Register A_Reg
        A_Reg <= (Sum & A_Reg(N-1 downto 1));
		  
        -- Carry Out Stored and Send to Next Loop
        CarryOut <= (((A_Reg(0) xor B_Reg(0)) and CarryOut)) or (A_Reg(0) and B_Reg(0));
    end if;
end if;

if (Extract = '1') then
	Output_Reg <= A_Reg;
end if;

end process;

-- Combinational Process
Output <= Output_Reg;
Carry_Out <= CarryOut;
Borrow_Out <= BorrowOut;

end Behavioral;
