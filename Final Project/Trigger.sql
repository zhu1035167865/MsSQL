/*
	In this trigger AdjustJobNumber, the system will adjust candidate status and the number of jobs automatically,
	including these situations:
	1. the company extend an offer for a candidate, change the candidate's status and decrease the number of jobs by 1,
		if there is no seat, turn the candidate status to 'on-call' 
	2. if someone declined the offer, increase the opening number by 1 since we have decreases the number by 1 
		when we extend the offer, then change his status to 'on-call'
	3. if someone is blacklisted, increase the opening number by 1 since we have decreases the number by 1 
		when we extend the offer
	4. IF someone accept the offer, turn his status to 'onboarding', and we should not modify the number of jobs
*/
CREATE TRIGGER AdjustJobNumber
	ON Candidates AFTER UPDATE
AS
	-- Offer extend
	IF (SELECT statusId FROM inserted) = 5
		BEGIN
			DECLARE @TempNumber int;
			DECLARE @TempJobID int;
			-- get the opening number before offer extended
			SET @TempNumber = (SELECT J.OpeningNumber from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- get the jobID
			SET @TempJobID = (SELECT J.jobOpeningId from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- if there is no seat, turn the candidate status to 'on-call' and do nothing
			IF @TempNumber = 0
				UPDATE Candidates SET statusId = 4 WHERE candidateId = (SELECT candidateId FROM inserted);
			-- decrease the opening number by 1
			ELSE
				UPDATE JobOpenings SET OpeningNumber = @TempNumber - 1 WHERE jobOpeningId = @TempJobID;
		END;
	-- if someone declined the offer
	ELSE IF ((SELECT statusId FROM inserted) = 6 )
		BEGIN
			DECLARE @TempNumber2 int;
			DECLARE @TempJobID2 int;
			-- get the opening number before offer extended
			SET @TempNumber2 = (SELECT J.OpeningNumber from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- get the jobID
			SET @TempJobID2 = (SELECT J.jobOpeningId from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- increase the opening number by 1
			UPDATE JobOpenings SET OpeningNumber = @TempNumber2 + 1 WHERE jobOpeningId = @TempJobID2;
			-- change his status to 'on-call'
			UPDATE Candidates SET statusId = 4 WHERE candidateId = (SELECT candidateId FROM inserted);
		END;
	-- if someone is blacklisted
	ELSE IF (SELECT statusId FROM inserted) = 11
		BEGIN
			DECLARE @TempNumber3 int;
			DECLARE @TempJobID3 int;
			-- get the opening number before offer extended
			SET @TempNumber3 = (SELECT J.OpeningNumber from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- get the jobID
			SET @TempJobID3 = (SELECT J.jobOpeningId from JobOpenings as J 
				JOIN candidateToJob AS CT ON J.jobOpeningId = CT.jobOpeningId
				JOIN inserted AS I ON I.candidateId = CT.candidateId);
			-- increase the opening number by 1
			UPDATE JobOpenings SET OpeningNumber = @TempNumber3 + 1 WHERE jobOpeningId = @TempJobID3;
		END;
	-- IF someone accept the offer, turn his status to 'onboarding'
	ELSE IF (SELECT statusId FROM inserted) = 7
		UPDATE Candidates SET statusId = 9 WHERE candidateId = (SELECT candidateId FROM inserted);