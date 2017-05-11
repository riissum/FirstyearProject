--									*** TESTING OF MULTIPLIER CELLS ***
-- 							Needs 10 clocks to perform. (for some reason?).
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
																		-- **********************************
ENTITY test IS 													-- * DECLARINGS 							*
	PORT (															-- **********************************
			CLK : IN STD_LOGIC;									-- * Incoming Clock 		: KEY0		*
			a : IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );			-- * Incoming A			: SW[7:4]	*
			b : IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );			-- * Incoming B			: SW[3:0]	*
			result : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 )  -- * Outgoing result		: LEDR[7:0]	*
		);																-- **********************************
END test;

ARCHITECTURE mult4 OF test IS							-- *** Multplies 4 x 4 bits. Using 2 cells. ***
	SIGNAL FFb : STD_LOGIC_VECTOR( 1 DOWNTO 0 ); -- flops for Bs leftMostCell has 0, to right then 1-2-3.7
	SIGNAL nextB : STD_LOGIC;							-- The next incoming B for the right most cell
	SIGNAL Sum : STD_LOGIC_VECTOR( 1 DOWNTO 0 );	-- The sums from each of the cells, starting with 0 from the left. 
BEGIN
	-- from left to right... 0-1-2-3
	leftMostCell : WORK.mult_cell(mult2)
			PORT MAP ( A1 => a(3), 				-- Gets the two most significant bits of A
						  A2 => a(2), 
						  Bin => FFb(1), 			-- Gets the B inside the B-flipflop of the cell next door.
						  B => FFb(0),				-- Gets the B inside the B-flipflop of itself. This is also reassigned to be Bin at the end.
						  Sin => '0', 				-- Left most cell gets by standard 0.
						  Sout => Sum(0),			-- Outputs to its sum.
						  clk => CLK );			-- Clock
	secondCell : WORK.mult_cell(mult2)
			PORT MAP ( A1 => a(1),				-- Gets the two least significant bits of A
						  A2 => a(0),
						  Bin => nextB,			-- Gets the upcoming B which is inside NO B-flipflops.
						  B => FFb(1),				-- Gets the B inside the B-flipflop of itself. This is also reassigned to be Bin at the end.
						  Sin => Sum(0),			-- Gets the sum from the left most cell.
						  Sout => Sum(1),			-- Outputs its own sum
						  clk => CLK );			-- Clock

	BFF0 : WORK.shiftB(shift)
			PORT MAP ( Lin => b,					-- Inputs B as ingoing list.
						  CLK => CLK,				-- Clock
						  Bout => nextB );		-- The upcoming B of the right most cell.
						  
	RES0 : WORK.shift_register(shiftRight)
			PORT MAP ( d => Sum(1),				-- Shifts in the sum of the right most cell.
						CLK => CLK,					-- Clock
						RES => result );			-- Gets the result of the register of the sums.
END mult4;



--				*** MULTIPLIER CELL ***

LIBRARY ieee;
USE ieee.std_LOGIC_1164.all;
											-- *******************************
ENTITY mult_cell IS 					-- * DECLARINGS						*
	PORT (								-- *******************************
		A1,A2	: IN STD_LOGIC;		-- * Takes two As						*
		Bin 	: IN STD_LOGIC;		-- * Incoming B						*
		B 		: INOUT STD_LOGIC;	-- * B inside flipflop				*
		Sin 	: IN STD_LOGIC;		-- * Sum from neighbour 			*
		Sout	: OUT STD_LOGIC;		-- * Output result of this cell	*
		clk 	: IN STD_LOGIC			-- * Clock								*
	);										-- *******************************
END mult_cell;

ARCHITECTURE mult2 OF mult_cell IS 
	SIGNAL n1, n2, p1, p2, c1, c2, c1ff, c2ff : STD_LOGIC; 	-- Signals for containing "temporary" bits.
BEGIN

	n1 <= (A1 AND B);				-- Left AND gate
	n2 <= (A2 AND Bin);			-- Right AND gate

	flipflopB : work.dflipflop(flip)			-- Flips Bin into B at next clock.
			PORT MAP ( d => Bin,
						CLK => clk,
						  q => B );
					
	flipflopC1 : WORK.dflipflop(flip)		-- Flips c1 (see below) into c1-flipflop at next clock.
			PORT MAP ( d => c1,
						CLK => clk,
						  q => c1ff );
						  
	flipflopC2 : WORK.dflipflop(flip)		-- Flips c2 (see below) into c2-flipflop at next clock.
			PORT MAP ( d => c2,
						CLK => clk,
						  q => c2ff );
						  
	flipflopS : WORK.dflipflop(flip)			-- Flips p2 (see below) into Sout-flipflop at next clock.
			PORT MAP ( d => p2,
						CLK => clk,
						  q => Sout);
						  
	
	
	fullAdder1 : WORK.fullAdder(add)			-- Left full adder.
			PORT MAP ( a => n1,					-- Result of left AND gate.
						  b => Sin,					-- Sum from neighbour cell.
						  c_in => c1ff,			-- carry from last cycle.
						  s => p1,					-- Produces output product : p1 (going to right full adder).
						  c_out => c1 );			-- Produces output carry   : c1 (going to c1-flipflop above).
	fullAdder2 : WORK.fullAdder(add)
			PORT MAP ( a => n2,					-- Right full adder.
						  b => p1,					-- Result of the left full adder.
						  c_in => c2ff,			-- carry from last cycle.
						  s => p2,					-- Produces output product : p2 (going to Sout above).
						  c_out => c2 );			-- Produces output carry   : c2 (going to c2-flipflop above).
END mult2;





LIBRARY ieee;
USE ieee.std_logic_1164.all;
														-- **********************************
ENTITY fullAdder IS								-- * DECLARINGS							*
	PORT (											-- **********************************
			a 			: IN STD_LOGIC;			-- * Takes two inputs A and B.		*
			b 			: IN STD_LOGIC;			--	*											*			
			c_in 		: IN STD_LOGIC;			-- * Takes a carry from last cycle.	*
			s 			: OUT STD_LOGIC;			-- * Produces a sum						*
			c_out 	: OUT STD_LOGIC			-- * and a carry for next cycle.		*
		);												-- **********************************
END fullAdder;

ARCHITECTURE add OF fullAdder IS
BEGIN 
	s <= ((a XOR b) XOR c_in);								-- Sum
	c_out <= (a AND b) OR (c_in AND (a XOR B));		-- carry
END add;




LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
																					-- ****************************
ENTITY shift_register IS													-- * DECLARINGS					*
    PORT ( 																		-- ****************************
			  d			: IN 	STD_LOGIC;									-- * Takes a bit d				*
			  CLK 		: IN  STD_LOGIC;									-- * Clock							*
           RES		   : OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 )		-- * Produces a shiftregister *
			 );																	-- ****************************
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
	SIGNAL shift_reg : STD_LOGIC_VECTOR( 7 DOWNTO 0 );				-- Defines a working vector for the register.
BEGIN														-- *** EVERYTHING BELOW HAPPENS AT THE SAME TIME!!! ***

		flip0 : WORK.dflipflop(flip)				-- Uses a flipflop to assign left most flipflop (index 7) of register, at next cycle, to incoming value d.
		PORT MAP ( CLK => CLK,
						 d => d,
						 q => shift_reg(7) );
						 
		floop : FOR i IN 6 DOWNTO 0 GENERATE	-- Uses a for loop to shift the 
					FFi : WORK.dflipflop(flip)
							PORT MAP ( d => shift_reg( i+1 ), -- Takes value from previous flipflop
										CLK => CLK,
										  q => shift_reg( i ) ); -- Puts it in the working flopflop at next cycle.
				  END GENERATE;
				  
	RES <= shift_reg;												 -- Copies the shiftregister to the output RES.
END shiftRight;



--				*** Entity to get the next B for the right most cell ***

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
																		-- ****************************************
ENTITY ListB IS													-- * DECLARINGS									*
	PORT ( 															-- ****************************************
			 Lin 	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );	-- * Takes a list, B from top-level input	*
			 Bout : OUT STD_LOGIC;								-- * Spits out a bit 							*
			 CLK : IN STD_LOGIC									-- * Clock											*
			);															-- ****************************************
END ListB;

ARCHITECTURE getB of ListB IS
	SIGNAL Ltemp : STD_LOGIC_VECTOR( 3 DOWNTO 0 ) := Lin;		-- Signal for storing B-vector
	SIGNAL i : integer := 0;											-- Signal for indexing B-vector
BEGIN
	PROCESS IS
	BEGIN
		IF ( i < 4 ) THEN													-- If cycle index < 4 (in range of B-vector)
			Bout <= Ltemp(i);												-- Bout is assigned to Ltemp of index i.
		ELSE
			Bout <= '0';													-- Otherwise Bout is assigned to 0 (for the last cycles).
		END IF;
		
		WAIT UNTIL RISING_EDGE(CLK);									-- Waits until next cycle to increment i
			i <= i + 1;
	END PROCESS;
END getB;



-- 			*** D-FlipFlop ***

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
												-- *******************************
ENTITY dflipflop IS						-- * DECLARINGS						*
	PORT ( 									-- *******************************
		d, clk : IN std_logic;			-- * Takes an input d and clock 	*
		q : OUT std_logic					-- * Outputs to q						*
		);										-- *******************************
END dflipflop;

ARCHITECTURE flip OF dflipflop IS
BEGIN
	PROCESS IS
	BEGIN
		WAIT UNTIL ( rising_edge(clk) );			-- Waits until next clock
			q <= d;										-- Then outputs d into q
	END PROCESS;
END ARCHITECTURE flip;