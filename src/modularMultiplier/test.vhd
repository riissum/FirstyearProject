LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlClk IS
   PORT (
         CLK    :   IN    STD_LOGIC;
			CLKf   :   OUT   STD_LOGIC
         );
END controlClk;

ARCHITECTURE control OF controlClk IS
   SIGNAL   i   :   INTEGER   :=   0;
BEGIN
   PROCESS( CLK ) IS
	BEGIN
      IF ( i >= 16 ) THEN
         CLKf <= '0';
	   ELSE
         CLKf <= CLK;
      END IF;
	
	   IF ( RISING_EDGE( CLK ) ) THEN
         i <= i + 1;
      END IF;
   END PROCESS;
END control;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                
ENTITY test IS                                                  
   PORT (                                                        
         CLK      :   IN    STD_LOGIC;                           
         --A        :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );      
         --B        :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );   
         --M        :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );			
         RES      :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
         bMoni    :   OUT   STD_LOGIC;
         rMoni    :   OUT   STD_LOGIC;
			H0       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H1       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H2       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H3       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H4       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H5       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H6       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			H7       :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 )
      );                                                         
END test;

ARCHITECTURE modMult2 OF test IS                                    
   SIGNAL   nextB      :   STD_LOGIC                        :=   '0';         -- Næste b (egen counter, er 0 efter 8)
   SIGNAL   nextQ      :   STD_LOGIC                        :=   '0';         -- Næste q (egen counter, er 0 efter 8)
   SIGNAL   nextS      :   STD_LOGIC                        :=   '0';         -- Næste s (egen counter, kommer efter 8 cycles)
   SIGNAL   S          :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";	   -- Liste af summer fra hver celle
	SIGNAL   FFB, FFQ   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   "0000";      -- Flipflops af b og q fra alle celler
   SIGNAL   A          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00000101";  -- A i m-res
   SIGNAL   B          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00010011";  -- B i m-res
   SIGNAL   M          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00001100";  -- (m+1)/2
   SIGNAL   R          :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   "00000000";  
   SIGNAL   fclk       :   STD_LOGIC;
BEGIN                           

   cntlr : WORK.controlClk(control)
      PORT MAP (
               CLK => CLK,
              CLKf => fclk
               );



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
               clk => fclk,
                 s => '0',
              sOut => S(0)
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
               clk => fclk,
                 s => S(0),
              sOut => S(1)
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
               clk => fclk,
                 s => S(1),
              sOut => S(2)
                ); 
   thCell : WORK.modMultCell(modMult)
      PORT MAP (
                a1 => A(1),
                a2 => A(0),
                m1 => M(1),
                m2 => M(0),
                 b => nextB,
               bff => FFB(0),
                 q => nextQ,
               qff => FFQ(0),
               clk => fclk,
                 s => S(2),
              sOut => S(3)
                );  



   BFF0 : WORK.ListB(getB)
      PORT MAP (
                L => B,
              clk => fclk,
             bOut => nextB 
                );
	QFF0 : WORK.ListQ(getQ)
      PORT MAP (
                d => S(3),
              clk => fclk,
             qOut => nextQ
                );
   R0 : WORK.ListR(getR)
      PORT MAP (
                S => S(3),
              clk => fclk,
             sOut => nextS,
               TT => rMoni
                );
   RES0 : WORK.shift_register(shiftRight)
      PORT MAP (
                d => nextS,
              clk => fclk,
              res => R
                );
	
	-- * HEX *
	HE0 : WORK.hexDisp(display)
      PORT MAP ( N => R(0), HEX => H0, clk => fclk );
	HE1 : WORK.hexDisp(display)
      PORT MAP ( N => R(1), HEX => H1, clk => fclk );
	HE2 : WORK.hexDisp(display)
      PORT MAP ( N => R(2), HEX => H2, clk => fclk );
	HE3 : WORK.hexDisp(display)
      PORT MAP ( N => R(3), HEX => H3, clk => fclk );
	HE4 : WORK.hexDisp(display)
      PORT MAP ( N => R(4), HEX => H4, clk => fclk );
	HE5 : WORK.hexDisp(display)
      PORT MAP ( N => R(5), HEX => H5, clk => fclk );
	HE6 : WORK.hexDisp(display)
      PORT MAP ( N => R(6), HEX => H6, clk => fclk );
	HE7 : WORK.hexDisp(display)
      PORT MAP ( N => R(7), HEX => H7, clk => fclk );
	
	
	RES <= R;
	bMoni <= nextB;
END modMult2;

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
           d     :   IN    STD_LOGIC;                          
           clk   :   IN    STD_LOGIC;                         
           res   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 )      
          );                                                   
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
   SIGNAL   shift_reg   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 );    
BEGIN                   

      flip0 : WORK.dflipflop(flip)                             
      PORT MAP ( 
                 clk => clk,
                   d => d,
                   q => shift_reg(7) );
                   
      floop : FOR i IN 6 DOWNTO 0 GENERATE                      
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
                                                               
ENTITY ListR IS                                               
   PORT (                                                     
          S      :   IN    STD_LOGIC;      
          sOut   :   OUT   STD_LOGIC;                          
          clk    :   IN    STD_LOGIC;
          TT     :   OUT   STD_LOGIC
         );                                                    
END ListR;

ARCHITECTURE getR of ListR IS  
   SIGNAL   i       :   INTEGER                          :=   0;     
BEGIN
   PROCESS( clk ) IS
   BEGIN
		IF ( i = 15 ) THEN
		   TT <= '0';		
         sOut <= S; 
      ELSIF ( i > 7 ) THEN  
         TT <= '1';		
         sOut <= S;                                     
      ELSE
         TT <= '0';
         sOut <= '0';                                     
      END IF;
      
      IF ( RISING_EDGE( clk ) ) THEN                             
         i <= i + 1;
		END IF;
   END PROCESS;
END getR;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               
ENTITY ListB IS                                               
   PORT (                                                     
          L      :   IN    STD_LOGIC_VECTOR( 7 DOWNTO 0 );      
          bOut   :   OUT   STD_LOGIC;                          
          clk    :   IN    STD_LOGIC                           
         );                                                    
END ListB;

ARCHITECTURE getB of ListB IS
   SIGNAL   LTemp   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 )   :=   L;      
   SIGNAL   i       :   INTEGER                          :=   0;     
BEGIN
   PROCESS( clk ) IS
   BEGIN
      IF ( i < 8 ) THEN                                        
         bOut <= L(i);                                     
      ELSE
         bOut <= '0';                                         
      END IF;
      
      IF ( RISING_EDGE(clk) ) THEN                         
         i <= i + 1;
		END IF;
   END PROCESS;
END getB;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               
ENTITY ListQ IS                                               
   PORT (                                                     
          d      :   IN    STD_LOGIC;      
          qOut   :   OUT   STD_LOGIC;                          
          clk    :   IN    STD_LOGIC                           
         );                                                    
END ListQ;

ARCHITECTURE getQ of ListQ IS   
   SIGNAL   i   :   INTEGER   :=   0;     
BEGIN
   PROCESS( clk ) IS
   BEGIN
      IF ( i < 8 ) THEN                                        
         qOut <= d;                                     
      ELSE
         qOut <= '0';                                         
      END IF;
      
      IF ( RISING_EDGE(clk) ) THEN                           
         i <= i + 1;
		END IF;
   END PROCESS;
END getQ;

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

ENTITY hexDisp IS
   PORT (
         N     :   IN    STD_LOGIC;
         HEX   :   OUT   STD_LOGIC_VECTOR( 6 DOWNTO 0 );
			clk   :   IN    STD_LOGIC
	      );
END hexDisp;

ARCHITECTURE display OF hexDisp IS
   SIGNAL   i   :   INTEGER   :=   0;
BEGIN
   PROCESS( clk ) IS
	BEGIN
      IF ( i = 16 ) THEN
         IF ( N = '0' ) THEN
	         HEX <= "1000000";
	      ELSE
            HEX <= "1111001";
         END IF;
      END IF;
		
	   IF ( RISING_EDGE ( clk ) ) THEN
         i <= i + 1;
      END IF;
   END PROCESS;
END display;	