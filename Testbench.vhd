library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench is
generic (N : INTEGER:=4); -- N-bit
end Testbench;

architecture Behavioral of Testbench is

component Serial_Adder is

port (
	 A: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input A
    B: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input B
    CLK: in STD_LOGIC;
    Control: in STD_LOGIC;
    Load: in STD_LOGIC;
	 Extract: in STD_LOGIC;
    Output: out STD_LOGIC_VECTOR(N-1 downto 0);
	 Borrow_Out : out STD_LOGIC;
	 Carry_Out: out STD_LOGIC
	);
end component;


signal CarryOut: STD_LOGIC;
signal A_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0');
signal B_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0');
signal Output_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0');
signal BorrowOut: STD_LOGIC;

signal A: STD_LOGIC_VECTOR (N-1 downto 0);
signal B: STD_LOGIC_VECTOR (N-1 downto 0);
signal CLK: STD_LOGIC;
signal Control: STD_LOGIC;
signal Load: STD_LOGIC;
signal Extract: STD_LOGIC;
signal Output: STD_LOGIC_VECTOR(N-1 downto 0);
signal Borrow_Out : STD_LOGIC;
signal Carry_Out: STD_LOGIC;

begin
	SerialAdder: Serial_Adder PORT MAP (
		A, B, CLK, Control, Load, Extract, Output, Borrow_Out, Carry_Out
	);
	process
	begin
		A <= "0001";
		B <= "1010";
		CLK <= '0';
		Control <= '0'; -- Adder
		Load <= '0';
		wait for 0.5 ns;
		Load <= '1';
		wait for 0.5 ns;
		CLK <= '1';
		wait for 0.5 ns;
		Load <= '0';
		wait for 0.5 ns;
		CLK <= '0';
		
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		Extract <= '1';
		wait for 1 ns;
		CLK <= '0';
		Extract <= '0';
		
		A <= "0101";
		B <= "0010";
		CLK <= '0';
		Load <= '0';
		wait for 0.5 ns;
		Control <= '1'; -- Subtractor
		Load <= '1';
		wait for 0.5 ns;
		CLK <= '1';
		wait for 0.5 ns;
		Load <= '0';
		wait for 0.5 ns;
		CLK <= '0';
		
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		Extract <= '1';
		wait for 1 ns;
		CLK <= '0';
		Extract <= '0';
		
		A <= "1111";
		B <= "1111";
		CLK <= '0';
		Load <= '0';
		wait for 0.5 ns;
		Control <= '0'; -- Adder
		Load <= '1';
		wait for 0.5 ns;
		CLK <= '1';
		wait for 0.5 ns;
		Load <= '0';
		wait for 0.5 ns;
		CLK <= '0';
		
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		Extract <= '1';
		wait for 1 ns;
		CLK <= '0';
		Extract <= '0';
		
		A <= "0000";
		B <= "1111";
		CLK <= '0';
		Load <= '0';
		wait for 0.5 ns;
		Control <= '1'; -- Subtractor
		Load <= '1';
		wait for 0.5 ns;
		CLK <= '1';
		wait for 0.5 ns;
		Load <= '0';
		wait for 0.5 ns;
		CLK <= '0';
		
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		wait for 1 ns;
		CLK <= '0';
		wait for 1 ns;
		CLK <= '1';
		Extract <= '1';
		wait for 1 ns;
		CLK <= '0';
		Extract <= '0';
		
		
	end process;
end Behavioral;
