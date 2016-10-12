LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY JUDGEMENT IS
  PORT(
  JUDGE_FUN:IN STD_LOGIC_VECTOR (3 DOWNTO 0);
  ENOUTUSER1:BUFFER STD_LOGIC;
  ENOUTUSER2:BUFFER STD_LOGIC;
  USER1_IN:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  USER2_IN:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  DIS_USER1:BUFFER INTEGER RANGE 0 TO 15;
  DIS_USER2:BUFFER INTEGER RANGE 0 TO 15;
  DIS_RESULT:BUFFER INTEGER RANGE 0 TO 2;                --0表示没有结束，1表示甲胜，2表示乙胜
  DIS_SCORE_USER1:BUFFER INTEGER RANGE 0 TO 5;
  DIS_SCORE_USER2:BUFFER INTEGER RANGE 0 TO 5
  );
END ENTITY JUDGEMENT;

ARCHITECTURE JUDGE OF JUDGEMENT IS
SIGNAL user1_score: INTEGER RANGE 0 TO 5;
SIGNAL user2_score: INTEGER RANGE 0 TO 5;
BEGIN
  FUNCTOIN_Control:PROCESS(JUDGE_FUN)
  BEGIN
    CASE JUDGE_FUN IS
	   WHEN "0100" => --准备键按下
		  ENOUTUSER1 <='1';
		  ENOUTUSER2 <='1';  
		WHEN "1000" =>  --开键按下
		    ENOUTUSER1 <='0';
			 ENOUTUSER2 <='0';  
			 CASE USER1_IN IS     --分析值
			   WHEN "1000" => 
              DIS_USER1 <=8;			                        	--user1出石头
				  IF USER2_IN = "0100" THEN
				     DIS_USER2 <=4;
				     user1_score <= user1_score + 1;            --user2出剪刀 user1加分
				  ELSE
				    IF USER2_IN = "0010" THEN
					    DIS_USER2 <=2;
					    user2_score <= user2_score + 1; END IF;  --user2出布 user2加分
				  END IF;
				WHEN "0100" =>
              DIS_USER1<=4;                      				--user1出剪刀
				  IF USER2_IN = "1000" THEN
				     DIS_USER2 <=8;
				     user2_score <= user2_score +1;             --user2出石头 user2加分
				  ELSE
				    IF USER2_IN = "0010" THEN
					    DIS_USER2 <=2;
					    user1_score <= user1_score + 1; END IF;  --user2出布  user1加分
				  END IF;
				WHEN "0010" =>  
              DIS_USER1 <=2; 				                     --user1出布
				  IF USER2_IN = "1000" THEN
				     DIS_USER2 <=8;
				     user1_score <= user1_score + 1;            --user2出石头  user1加分
				  ELSE
				    IF USER2_IN = "0100" THEN
					    DIS_USER2<=4;
					    user2_score <= user2_score +1;           --user2出剪刀  user2加分
				    END IF;
				  END IF;
			 END CASE;
		WHEN "0010" => 
		    DIS_USER1<=0;
			 DIS_USER2<=0;
		    ENOUTUSER1 <='0';
			 ENOUTUSER2 <='0';  --复位键按下
			 user2_score <= 0;
			 user1_score <= 0;
	END CASE;
	IF user1_score = 3 THEN
	   DIS_RESULT<=1;
	ELSE
	   IF user2_score =3 THEN
		DIS_RESULT <= 2 ;
		ELSE
		  DIS_RESULT <= 0 ;
		END IF;
   END IF;
  END PROCESS FUNCTOIN_Control;
 END JUDGE;