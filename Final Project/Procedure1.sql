-- use this procedure to change candidate status and check whether it is qualified
CREATE PROC spChangeStatus
		@FirstName varchar(100),
		@LastName varchar(100),
		@StatusID int = 1
AS
	-- check if the candidate is valid
	IF(NOT EXISTS(SELECT 1 FROM Candidates WHERE firstName = @FirstName AND lastName = @LastName))
		BEGIN
			PRINT 'ERROR: There is no such candidate!';
			RETURN;
		END;
	-- check if the status is valid
	ELSE IF (@StatusID > (SELECT COUNT(*) FROM candidateStatus))
		BEGIN
			PRINT 'ERROR: There is no such status!';
			RETURN;
		END;
	-- update the status
	ELSE
		BEGIN
			UPDATE Candidates SET statusId = @StatusID
			WHERE firstName = @FirstName AND lastName = @LastName;
		END;

