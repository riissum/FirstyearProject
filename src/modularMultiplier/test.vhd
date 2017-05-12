LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                
ENTITY test IS                                                  
   PORT (                                                        
         CLK      :   IN    STD_LOGIC;                           
         A        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );      
         B        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );   
         M        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );			
         RES      :   OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0 );
         bMoni    :   OUT   STD_LOGIC
      );                                                         
END test;

ARCHITECTURE modMult2 OF test IS                                    
   SIGNAL   nextB      :   STD_LOGIC                        :=   '0';
   SIGNAL   S          :   STD_LOGIC_VECTOR( 1 DOWNTO 0 )   :=   "00";	
	SIGNAL   FFB, FFQ   :   STD_LOGIC_VECTOR( 1 DOWNTO 0 )   :=   "00";    
BEGIN                           

   stCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(3),
                a2 => A(2),
                m1 => M(3),
                m2 => M(2),
                 b => FFB(1),
               bff => FFB(0),
                 q => FFQ(1),
				   qff => FFQ(0),
               clk => CLK,
                 s => '0',
              sOut => S(0)
                ); 
   ndCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(1),
                a2 => A(0),
                m1 => M(1),
                m2 => M(0),
                 b => nextB,
               bff => FFB(1),
                 q => S(1),
               qff => FFQ(1),
               clk => CLK,
                 s => S(0),
              sOut => S(1)
                ); 



   BFF0 : WORK.ListB(getB)
      PORT MAP (
                L => B,
              clk => CLK,
             bOut => nextB 
                );
   RES0 : WORK.shift_register(shiftRight)
      PORT MAP (
                d => S(1),
              clk => CLK,
              res => RES
                );
	bMoni <= nextB;
END modMult2;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY modMultCell IS
   PORT (
         a1,a2   :   IN    STD_LOGIC;
         m1,m2   :   IN    STD_LOGIC;
         b       :   IN    STD_LOGIC;
         bff     :  INOUT  STD_LOGIC;
         q       :   IN    STD_LOGIC;
         qff     :  INOUT  STD_LOGIC;
			clk     :   IN    STD_LOGIC;
			s       :   IN    STD_LOGIC;
			sOut    :   OUT   STD_LOGIC
        );
END modMultCell;

ARCHITECTURE modMult OF modMultCell IS
	SIGNAL   c                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- Carries
   SIGNAL   c1T, c1B, c2            :   STD_LOGIC                        :=   '0';   -- temps ^
   SIGNAL   n                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- AND results
   SIGNAL   p                       :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";-- Full adder results
   --SIGNAL   bIntern, qIntern        :   STD_LOGIC                        :=   '0';
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
                b => s,    -- sIn from entity
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
	--bff <= bIntern;
	flipQ : WORK.dflipflop(flip)
      PORT MAP (
                d => q,
              clk => clk,
                q => qff
               );
   --qff <= qIntern;

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
           d     :   IN    STD_LOGIC;                          
           clk   :   IN    STD_LOGIC;                         
           res   :   OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0 )      
          );                                                   
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
   SIGNAL   shift_reg   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 );    
BEGIN                   

      flip0 : WORK.dflipflop(flip)                             
      PORT MAP ( 
                 clk => clk,
                   d => d,
                   q => shift_reg(3) );
                   
      floop : FOR i IN 2 DOWNTO 0 GENERATE                      
               FFi : WORK.dflipflop(flip)
                     PORT MAP ( 
                                d => shift_reg( i+1 ),         
                              clk => clk,
                                q => shift_reg( i ) 
                              );                               
              END GENERATE;
              
   res <= shift_reg;                                           
END shiftRight;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               
ENTITY ListB IS                                               
   PORT (                                                     
          L      :   IN   STD_LOGIC_VECTOR( 3 DOWNTO 0 );      
          bOut   :   OUT   STD_LOGIC;                          
          clk    :   IN    STD_LOGIC                           
         );                                                    
END ListB;

ARCHITECTURE getB of ListB IS
   SIGNAL   LTemp   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   L;      
   SIGNAL   i       :   INTEGER                          :=   0;     
BEGIN
   PROCESS IS
   BEGIN
      IF ( i < 4 ) THEN                                        
         bOut <= LTemp(i);                                     
      ELSE
         bOut <= '0';                                         
      END IF;
      
      WAIT UNTIL RISING_EDGE(clk);                             
         i <= i + 1;
   END PROCESS;
END getB;

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