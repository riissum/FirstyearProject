LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlClk IS  -- Controls the clock, and blocks it after 128 cycles.
   PORT (
         CLK    :    IN     STD_LOGIC;   -- Real clock input
			CLKf   :    OUT    STD_LOGIC;   -- Fake clock output
         i      :   INOUT   INTEGER;     -- Counter
			i_help :   INOUT   INTEGER;     -- Counter 0 -> 15
			done   :    OUT    STD_LOGIC    -- Debug output to check if 128 cycles are done.
         );
END controlClk;

ARCHITECTURE control OF controlClk IS
BEGIN
   PROCESS( CLK, i, i_help ) IS
	BEGIN
		IF ( i >= 128 ) THEN
			CLKf <= '0';
			done <= '1';
		ELSE
			CLKf <= CLK;
			done <= '0';
		END IF;
		IF ( RISING_EDGE( CLK ) ) THEN
         i <= i + 1;
			i_help <= i_help + 1;
			
			IF( i_help = 16 ) THEN
			   i_help <= 0;
			END IF;
      END IF;
   END PROCESS;
END control;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY modExp IS
   PORT (
         CLK   :   IN    STD_LOGIC;
	      --X     :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );
         --E     :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );     Commented out since we do not have enough switches.
         --M     :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			RES   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			done  :   OUT   STD_LOGIC
         );
END modExp;

ARCHITECTURE modExp8 OF modExp IS                                -- Example:     5^3 mod 23 = 10 (m-res: 15)
   SIGNAL   X           :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001010";  -- 5  (m-res: 10)
   SIGNAL   E           :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00000110";  -- 3  (m-res: 6)
   SIGNAL   M           :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001100";  -- 23 ((m+1)/2): 12)
   SIGNAL   fclk        :   STD_LOGIC                        :=   '0';         -- Fake clock
   SIGNAL   i           :   INTEGER                          :=    0;          -- Counter
   SIGNAL   i_h         :   INTEGER                          :=    0;          -- Counter 0 -> 15
   SIGNAL   f_sw        :   STD_LOGIC                        :=   '0';         -- Controlbit f
   SIGNAL   e_sw        :   STD_LOGIC                        :=   '0';         -- Controlbit e, ( has value of E(n) ). Used as condition later.
   SIGNAL   d_sw        :   STD_LOGIC                        :=   '0';         -- Controlbit d, ( is 1 if i_h > 8 ).
	SIGNAL   y           :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001010";  -- y register
   SIGNAL   y0          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001010";  -- y' shift register
   SIGNAL   z           :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001010";  -- z register
   SIGNAL   z0          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001010";  -- z' shift register
	SIGNAL   Ry, Rz      :   STD_LOGIC                        :=   '0';         -- results from the two modular multipliers
	SIGNAL   Qy, Qz      :   STD_LOGIC                        :=   '0';         -- input q for both modular multipliers. ( based on Rz/Ry: is 0 if i_h > 7 )
	SIGNAL   Sy, Sz      :   STD_LOGIC                        :=   '0';         -- input s for both modular multipliers. ( based on Ry/Rz: is 0 if i_h < 8 )
BEGIN
-- *** FAKE CLOCK ********************************
-- Controls, and counts, cycles

   cntlr   :   WORK.controlClk(control)
      PORT MAP (
               CLK => CLK,
              CLKf => fclk,
                 i => i,
				i_help => i_h
				 done  => done
               );
-- *** SWITCHES **********************************
-- Changes controlbits according to cycle no.
   swt   :   WORK.controlBits(control)
	   PORT MAP (
		         CLK => fclk,
					  e => E,
					i_h => i_h,
					  i => i,
				  f_sw => f_sw,
				  e_sw => e_sw,
				  d_sw => d_sw
				    );
	
-- *** MULTIPLICATORS ***
-- The two modular multipliers.
   multTop   :   WORK.modMult(modMult8)
	   PORT MAP (
		          clk => fclk,
					 a   => y,
					 m   => M,
					 b   => z0(0),
					 q   => Qy,
					 s   => Ry
					 );
	multBot   :   WORK.modMult(modMult8)
	   PORT MAP (
		          clk => fclk,
					 a   => z,
					 m   => M,
					 b   => z0(0),
					 q   => Qz,
					 s   => Rz
					 );				 

-- *** q/s Handler ***************************
-- Handles where to put the output of the multipliers.
-- If f_sw is 0 then the output goes to q, and s is 0.
-- If f_sw is 1 then the output goes to s, and q is 0.

   dirH   :    WORK.directionHandler(handler)
	   PORT MAP (
		          clk => fclk,
					  qy => Qy,
					  qz => Qz,
					  sy => Sy,
					  sz => Sz,
					  ry => Ry,
					  rz => Rz,
					f_sw => f_sw
					);
	
-- *** SHIFTS **********************************
-- Shifts z' (z0) and y' (y0) with the results of the multipliers.

   z0shift   :   WORK.shift_register(shiftRight)
	   PORT MAP (
		          d => Sz,
				  clk => fclk,
         init_val => X,
				  reg => z0
				    );
	y0shift   :   WORK.shift_register(shiftRight)
	   PORT MAP (
		          d => Sy,
				  clk => fclk,
		   init_val => X,
				  reg => y0
				    );
	
	
-- *** DUBLICATIONS ***
-- (SHOULD) Dublicate the z0 vector into z and y0 into y.

   dubZ   :   WORK.dubVec(conditionalDublicate)
	   PORT MAP (
		          a => z0,
					 b => z,
					 clk => fclk,
					 condition1 => d_sw,            -- Takes d_sw (if at right cycle no).
					 condition2 => '1'              -- And constant true. (AND'ed together)
					 );
   dubY   :   WORK.dubVec(conditionalDublicate)
	   PORT MAP (
		          a => y0,
					 b => y,
					 clk => fclk,
					 condition1 => d_sw,            -- Takes d_sw (if at right cycle no)
					 condition2 => e_sw             -- And e_sw ( bit at e(n) ) (AND'ed together) 
					 );
					 

		  res <= z;                             -- prints out z (for test).
END modExp8;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                
ENTITY modMult IS                                                  
   PORT (
         clk   :   IN    STD_LOGIC;                           
         a     :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );
         m     :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			b     :   IN    STD_LOGIC;
         q     :   IN    STD_LOGIC;			
         s     :   OUT   STD_LOGIC
         );                                                         
END modMult;

ARCHITECTURE modMult8 OF modMult IS                                     
   SIGNAL   FFS        :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";	   -- Flipflops of sums from each cell
	SIGNAL   FFB, FFQ   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";      -- Flipflops of b and q from each cell
BEGIN                           
   stCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(7),
                a2 => A(6),
                m1 => M(7),
                m2 => M(6),
                 b => FFB(2),
               bff => FFB(3),
                 q => FFQ(2),
				   qff => FFQ(3),
               clk => clk,
                 s => '0',
              sOut => FFS(0)
                ); 
   ndCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(5),
                a2 => A(4),
                m1 => M(5),
                m2 => M(4),
                 b => FFB(1),
               bff => FFB(2),
                 q => FFQ(1),
               qff => FFQ(2),
               clk => clk,
                 s => FFS(0),
              sOut => FFS(1)
                );
   rdCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(3),
                a2 => A(2),
                m1 => M(3),
                m2 => M(2),
                 b => FFB(0),
               bff => FFB(1),
                 q => FFQ(0),
				   qff => FFQ(1),
               clk => clk,
                 s => FFS(1),
              sOut => FFS(2)
                ); 
   thCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(1),
                a2 => A(0),
                m1 => M(1),
                m2 => M(0),
                 b => b,
               bff => FFB(0),
                 q => q,
               qff => FFQ(0),
               clk => clk,
                 s => FFS(2),
              sOut => FFS(3)
                );  	
-- Print to leds.
	s <= FFS(3);
END modMult8;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY modMultCell IS
   PORT (
         a1,a2   :   IN    STD_LOGIC;
         m1,m2   :   IN    STD_LOGIC;
         b       :   IN    STD_LOGIC;  -- b from neighbour flipflop
         bff     :  INOUT  STD_LOGIC;  -- Incoming b flipflop
         q       :   IN    STD_LOGIC;  -- q from neighbour flipflop
         qff     :  INOUT  STD_LOGIC;  -- Incoming q flipflop
			clk     :   IN    STD_LOGIC;
			s       :   IN    STD_LOGIC;
			sOut    :   OUT   STD_LOGIC
        );
END modMultCell;

ARCHITECTURE modMult OF modMultCell IS
	SIGNAL   c                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- Carries
   SIGNAL   c1T, c1B, c2            :   STD_LOGIC                        :=   '0';   -- C-flipflops
   SIGNAL   n                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- AND results
   SIGNAL   p                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- Full adder results
BEGIN

-- *** GATES ***
   
   n(0) <= ( a1 AND bff );  -- Top left
	n(1) <= ( a2 AND b );  -- Top right
	n(2) <= ( m1 AND qff );  -- Bot left
   n(3) <= ( m2 AND q );  -- Bot right


-- *** FULL ADDERS ***

   add1 : WORK.fullAdder(add) -- * 0 *  (Top left FA)
      PORT MAP (
                a => c1T, 
                b => n(1),  
              cIn => n(0),
                s => p(0),
             cOut => c(0)
               );
   add2 : WORK.fullAdder(add) -- * 1 *  (Mid FA)
      PORT MAP (
                a => p(0),   -- Product from 1st FA
                b => s,      -- sIn from entity
              cIn => p(2),   -- Product from 3rs FA
                s => p(1),   -- Sum -> Later put into s-flipflop
             cOut => c(1) 
               );
   add3 : WORK.fullAdder(add) -- * 2 *  (Bot left FA)
      PORT MAP (
                a => n(2),   
                b => n(3),   
              cIn => c1B,    -- Product from 3rs FA
                s => p(2),   -- Sum -> Later put into s-flipflop
             cOut => c(2) 
               );
   add4 : WORK.fullAdder(add) -- * 3 *  (Bot right FA)
      PORT MAP (
                a => c(0),   
                b => c(2),    
              cIn => c2, 
                s => p(3),  
             cOut => c(3) 
               );



-- *** FLIPS ***

   flipS : WORK.dflipflop(flip)
      PORT MAP (
                d => p(1),
              clk => clk,
                q => sOut 
               );
	flipC1T : WORK.dflipflop(flip)
      PORT MAP (
                d => p(3),
              clk => clk,
                q => c1T
               );
   flipC1B : WORK.dflipflop(flip)
      PORT MAP (
                d => c(1),
              clk => clk,
                q => c1B
               );
	flipC2 : WORK.dflipflop(flip)
      PORT MAP (
                d => c(3),
              clk => clk,
                q => c2
               );
	flipB : WORK.dflipflop(flip)
      PORT MAP (
                d => b,
              clk => clk,
                q => bff
               );
					
	flipQ : WORK.dflipflop(flip)
      PORT MAP (
                d => q,
              clk => clk,
                q => qff
               );

END modMult;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                 
ENTITY fullAdder IS                                              
   PORT (                                                        
         a      :   IN    STD_LOGIC;                             
         b      :   IN    STD_LOGIC;                                      
         cIn    :   IN    STD_LOGIC;                             
         s      :   OUT   STD_LOGIC;                            
         cOut   :   OUT   STD_LOGIC                              
      );                                                       
END fullAdder;

ARCHITECTURE add OF fullAdder IS
BEGIN 
   s <= ((a XOR b) XOR cIn);                                   
   cOut <= (a AND b) OR (cIn AND (a XOR B));                   
END add;




LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                             
ENTITY shift_register IS                                    
    PORT (                                                    
           d          :    IN      STD_LOGIC;                          
           clk        :    IN      STD_LOGIC;
			  init_val   :    IN      STD_LOGIC_VECTOR( 7 DOWNTO 0 );
           reg        :    OUT     STD_LOGIC_VECTOR( 7 DOWNTO 0 )       
          );                                                   
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
   SIGNAL   shift_reg   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 ); 
BEGIN                   
   PROCESS IS
	   VARIABLE   load   :   BOOLEAN   :=   TRUE;      -- Variable to check if the register should be initiated.
	BEGIN
	   IF ( load ) THEN                                -- If so, init_val is loaded in.
		   shift_reg <= init_val;
			load := FALSE;
		ELSE
			IF ( RISING_EDGE( clk ) ) THEN               -- Otherwise we check if rising edge
            flips : FOR i IN 0 TO 6 LOOP              -- If so we then shift the register
				      shift_reg( i ) <= shift_reg( i + 1 );
				END LOOP;
				shift_reg( 7 ) <= d;                      -- and shift in the d
			END IF;
		END IF;
		WAIT UNTIL RISING_EDGE(clk);                    -- (Don't know why this is needed, it made it the work? but it now needs an extra cycles to start it.)
	END PROCESS;
   reg <= shift_reg;                         
END shiftRight;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                              
ENTITY dflipflop IS                                            
   PORT (                                                     
      d     :   IN    STD_LOGIC;                              
      clk   :   IN    STD_LOGIC;                              
      q     :   OUT   STD_LOGIC                              
      );                                                       
END dflipflop;

ARCHITECTURE flip OF dflipflop IS
BEGIN
   PROCESS IS
   BEGIN
      WAIT UNTIL ( RISING_EDGE ( clk ) );                      
         q <= d;                                            
   END PROCESS;
END ARCHITECTURE flip;	


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY dubVec IS
   PORT (
	      a            :    IN     STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			b            :   INOUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			clk          :    IN     STD_LOGIC;
			condition1   :    IN     STD_LOGIC;
			condition2   :    IN     STD_LOGIC
			);
END dubVec;

ARCHITECTURE conditionalDublicate OF dubVec IS
   SIGNAL   temp   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 );        
BEGIN
   PROCESS(a, b) IS
	BEGIN
	   temp <= a;                                              -- Stores the a vector in a temporary signal
	   IF ( FALLING_EDGE( clk ) ) THEN                         -- If we are at the falling edge of a cycles 
		   IF ( condition1 = '1' AND condition2 = '1' ) THEN    -- and both conditions hold,
			   b <= temp;                                        -- We send temp to b.
			END IF;
		END IF;
	END PROCESS;
END conditionalDublicate;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlBits IS
   PORT (
	      clk    :    IN     STD_LOGIC;
			i_h    :    IN     INTEGER;
			i      :    IN     INTEGER;
			e      :    IN     STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			f_sw   :    OUT    STD_LOGIC;
	      e_sw   :    OUT    STD_LOGIC;
	      d_sw   :    OUT    STD_LOGIC
	      );		
END controlBits;

ARCHITECTURE control OF controlBits IS
BEGIN
PROCESS( clk, e, i, i_h ) IS
   BEGIN
		IF ( i_h < 8 ) THEN
		   f_sw <= '0';
		ELSE
		   f_sw <= '1';
		END IF;
		
		IF ( RISING_EDGE( clk ) ) THEN  
         IF ( i = 15 ) THEN  -- At the end of cycles, we check, if we are at the beginning of any of the 16/16 cycles.
			   d_sw <= '1';                                   -- If so, d-switch is on.
				e_sw <= e(0);                                  -- and e-switch is set to according e(n) bit.
			ELSIF ( i = 31 ) THEN
			   d_sw <= '1';
				e_sw <= e(1);
			ELSIF ( i = 47 ) THEN
			   d_sw <= '1';
				e_sw <= e(2);
			ELSIF ( i = 63 ) THEN
			   d_sw <= '1';
				e_sw <= e(3);
			ELSIF ( i = 79 ) THEN
			   d_sw <= '1';
				e_sw <= e(4);
			ELSIF ( i = 95 ) THEN
			   d_sw <= '1';
				e_sw <= e(5);
			ELSIF ( i = 111 ) THEN
			   d_sw <= '1';
				e_sw <= e(6); 
			ELSIF ( i = 127 ) THEN
			   d_sw <= '1';
				e_sw <= e(7);
			ELSE
			   d_sw <= '0';				-- If not, d-switch is off.
				e_sw <= '0';            -- and e-switch is off.
			END IF;
		END IF;
   END PROCESS;
END control;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY directionHandler IS
   PORT (
	     clk    :    IN    STD_LOGIC;
		  f_sw   :    IN    STD_LOGIC;
		  ry     :    IN    STD_LOGIC;
		  rz     :    IN    STD_LOGIC;
		  qy     :    OUT   STD_LOGIC;
		  qz     :    OUT   STD_LOGIC;
		  sy     :    OUT   STD_LOGIC;
		  sz     :    OUT   STD_LOGIC
		  );
END directionHandler;

ARCHITECTURE handler OF directionHandler IS
BEGIN
   PROCESS( clk, f_sw, ry, rz ) IS
	   BEGIN
		   IF( f_sw = '0' ) THEN             -- If f_sw is 0
		      qy <= ry;                      -- The q's get the results
			   sy <= '0';
			   qz <= rz;
			   sz <= '0';
		   ELSE                              -- Otherwise
			   sy <= ry;                      -- The s's get the results
			   qy <= '0';
			   sz <= rz;
			   qz <= '0';
		   END IF;
	END PROCESS;
END handler;