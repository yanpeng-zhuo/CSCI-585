-- Database used: MySQL.
 select DETAIL as Most_self_reported_symptom from SYMPTOM
		JOIN SYMPTOM_DETAIL ON SYMPTOM_DETAIL.SYMPTOM_ID = SYMPTOM.SYMPTOM_ID
        group by SYMPTOM.SYMPTOM_ID
          having count(*) =(select max(times) from 
            (select count(*) as times from SYMPTOM group by SYMPTOM_ID) as frequence)