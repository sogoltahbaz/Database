CREATE VIEW Top_association
AS SELECT DISTINCT Directors.FirstName + Directors.LastName AS dir_name, Actors.FirstName + Actors.LastName as act_name
FROM Directors, Actors, FdirectedBy, FappearedIn, Film
WHERE Directors.ID = FdirectedBy.DID and Film.ID = FdirectedBy.FID
	and Film.ID = FappearedIn.FID and Actors.ID = FappearedIn.AID
	and (Film.RatingCount / Film.RatingSum) >= 8