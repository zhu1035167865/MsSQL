-- candiadtes who have been rejected and want to complain
CREATE PROC spComplain
		@FirstName varchar(100),
		@LastName varchar(100),
		@StatusID int 
AS
	-- check if the target status is valid
	IF(@StatusID <> 2)
		BEGIN
			PRINT 'ERROR: You can only be added to the waiting list!';
			RETURN;
		END;
	-- check if the current status is valid
	ELSE IF ((SELECT statusId FROM Candidates WHERE firstName = @FirstName AND lastName = @LastName) <> 3)
		BEGIN
			PRINT 'ERROR: You are not rejected yet!';
			RETURN;
		END;
	-- update the status
	ELSE
		BEGIN
			EXEC spChangeStatus @FirstName, @LastName, @StatusID;
		END;
