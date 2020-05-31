CREATE OR REPLACE FUNCTION GET_SCORE(f_winery VARCHAR2, f_score FLOAT)
          RETURN ReturnObjectlist PIPELINED AS
BEGIN
FOR i IN (
      SELECT score, winery FROM CompanyScore WHERE winery = f_winery AND score > f_score)
    LOOP
        PIPE ROW (ReturnObject(i.winery, i.score));    
    END LOOP; 
RETURN;
END;
