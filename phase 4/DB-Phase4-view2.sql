CREATE VIEW BestPartners
AS SELECT A1.FirstName + A1.LastName as Actor1, A2.FirstName + A2.LastName as Actor2
from  (
SELECT A1.ID as id1, A2.ID as id2, COUNT(*) as cnt
FROM Actors A1, Actors A2, FappearedIn F1, FappearedIn F2, Film
WHERE F1.FID = Film.ID and F2.FID = Film.ID and F1.AID = A1.ID and F2.AID = A2.ID and A1.ID < A2.ID
GROUP BY A1.ID, A2.ID
) AS temp, Actors A1, Actors A2
WHERE temp.cnt >= 5 and A1.ID = temp.id1 and A2.ID = temp.id2