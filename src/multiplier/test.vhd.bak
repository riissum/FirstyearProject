LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--LIBRARY WORK;
--USE WORK.ALL;

ENTITY test IS
	PORT (
		CLK : IN STD_LOGIC;
		a : IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );
		b : IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );
		result : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 )
	);
END test;

ARCHITECTURE mult4 OF test IS
	SIGNAL FFb : STD_LOGIC_VECTOR( 1 DOWNTO 0 ); -- flops for Bs leftMostCell has 0, to right then 1-2-3.7
	SIGNAL nextB : STD_LOGIC;
	SIGNAL Sum : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
BEGIN
	-- from left to right... 0-1-2-3
	leftMostCell : WORK.mult_cell(mult2)
			PORT MAP ( A1 => a(3), 
						  A2 => a(2), 
						  Bin => FFb(1), 
						  B => FFb(0),
						  Sin => '0', 
						  Sout => Sum(0),
						  clk => CLK );
	secondCell : WORK.mult_cell(mult2)
			PORT MAP ( A1 => a(1),
						  A2 => a(0),
						  Bin => nextB,
						  B => FFb(1),
						  Sin => Sum(0),
						  Sout => Sum(1),
						  clk => CLK );

	BFF0 : WORK.shiftB(shift)
			PORT MAP ( Lin => b,
						  CLK => CLK,
						  Bout => nextB );
						  
	RES0 : WORK.shift_register(shiftRight)
			PORT MAP ( d => Sum(1),
						CLK => CLK,
						RES => result );
	
END mult4;


LIBRARY ieee;
USE ieee.std_LOGIC_1164.all;

ENTITY mult_cell IS
	PORT (
		A1,A2	: IN STD_LOGIC;
		Bin 	: IN STD_LOGIC;
		B 		: INOUT STD_LOGIC;
		Sin 	: IN STD_LOGIC;
		Sout	: OUT STD_LOGIC;
		clk 	: IN STD_LOGIC
		
	);
END mult_cell;

ARCHITECTURE mult2 OF mult_cell IS 
	SIGNAL n1, n2, p1, p2, c1, c2, c1ff, c2ff : STD_LOGIC;
BEGIN

	n1 <= (A1 AND B);
	n2 <= (A2 AND Bin);

	flipflopB : work.dflipflop(flip)
			PORT MAP ( d => Bin,
						CLK => clk,
						  q => B );
					
	flipflopC1 : WORK.dflipflop(flip)
			PORT MAP ( d => c1,
						CLK => clk,
						  q => c1ff );
						  
	flipflopC2 : WORK.dflipflop(flip)
			PORT MAP ( d => c2,
						CLK => clk,
						  q => c2ff );
						  
	flipflopS : WORK.dflipflop(flip)
			PORT MAP ( d => p2,
						CLK => clk,
						  q => Sout);
						  
	
	
	fullAdder1 : WORK.fullAdder(add)
			PORT MAP ( a => n1,
						  b => Sin,
						  c_in => c1ff,
						  s => p1,
						  c_out => c1 );
	fullAdder2 : WORK.fullAdder(add)
			PORT MAP ( a => n2,
						  b => p1,
						  c_in => c2ff,
						  s => p2,
						  c_out => c2 );
END mult2;





LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS
PORT (
	a 			: IN STD_LOGIC;
	b 			: IN STD_LOGIC;
	c_in 		: IN STD_LOGIC;
	s 			: OUT STD_LOGIC;
	c_out 	: OUT STD_LOGIC
	);
END fullAdder;

ARCHITECTURE add OF fullAdder IS
BEGIN 
	s <= ((a XOR b) XOR c_in);
	c_out <= (a AND b) OR (c_in AND (a XOR B));
END add;




LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_register IS
    PORT ( d			: IN 	STD_LOGIC;
			  CLK 		: IN  STD_LOGIC;
           RES		   : OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 )
			 );
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
	SIGNAL shift_reg : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
BEGIN
		flip0 : WORK.dflipflop(flip)
		PORT MAP ( CLK => CLK,
						 d => d,
						 q => shift_reg(7) );
						 
		floop : FOR i IN 6 DOWNTO 0 GENERATE
					FFi : WORK.dflipflop(flip)
							PORT MAP ( d => shift_reg( i+1 ),
										CLK => CLK,
										  q => shift_reg( i ) );
				  END GENERATE;
				  
	RES <= shift_reg;
END shiftRight;



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shiftB IS
	PORT ( Lin 	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );
			 Bout : OUT STD_LOGIC;
			 CLK : IN STD_LOGIC
			);
END shiftB;

ARCHITECTURE shift of shiftB IS
	SIGNAL Ltemp : STD_LOGIC_VECTOR( 3 DOWNTO 0 ) := Lin;
	SIGNAL i : INTEGER  := 0;
BEGIN
	PROCESS IS
	BEGIN
		IF ( i < 4 ) THEN
			Bout <= Ltemp(0);
		ELSE
			Bout <= '0';
		END IF;

		WAIT UNTIL RISING_EDGE( CLK );
			i <= i+1;
END shift;











LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dflipflop IS
	PORT ( 
		d, clk : IN std_logic; 
		q : OUT std_logic
		);
END dflipflop;

ARCHITECTURE flip OF dflipflop IS
BEGIN
	PROCESS IS
	BEGIN
		WAIT UNTIL ( rising_edge(clk) );
			q <= d;
	END PROCESS;
END ARCHITECTURE flip;