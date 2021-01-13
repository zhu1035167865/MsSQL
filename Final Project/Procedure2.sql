-- candiadtes who have received offer can use this procedure to make decision
CREATE PROC spCandidateChooseOffer
		@FirstName varchar(100),
		@LastName varchar(100),
		@StatusID int 
AS
	-- check if the target status is valid
	IF(@StatusID <> 6 and @StatusID <> 7 and @StatusID <> 8)
		BEGIN
			PRINT 'ERROR: You can only accept, decline or negotiate the offer!';
			RETURN;
		END;
	-- check if the current status is valid
	ELSE IF ((SELECT statusId FROM Candidates WHERE firstName = @FirstName AND lastName = @LastName) <> 5)
		BEGIN
			PRINT 'ERROR: Please wait for your offer!';
			RETURN;
		END;
	-- update the status
	ELSE
		BEGIN
			EXEC spChangeStatus @FirstName, @LastName, @StatusID;
		END;

		