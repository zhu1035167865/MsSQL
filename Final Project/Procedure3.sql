-- use this procedure to set up a new application except for someone who have been blacklisted
CREATE PROC spNewApply
		@FirstName varchar(100),
		@LastName varchar(100)
AS
	-- check if the candidate is already in the database
	IF EXISTS(SELECT 1 FROM Candidates WHERE firstName = @FirstName AND lastName = @LastName)
		BEGIN
			-- check if the candiadte have been blacklisted
			IF (SELECT statusId FROM Candidates WHERE firstName = @FirstName AND lastName = @LastName) = 11
				BEGIN
					PRINT 'ERROR: YOU HAVE BEEN BLACKLISTED!';
					RETURN;
				END;
			ELSE
				-- update his status to Applied
				BEGIN
					UPDATE Candidates SET statusId = 1 WHERE firstName = @FirstName AND lastName = @LastName;
					RETURN;
				END;
		END;
	ELSE
		-- insert a new row for the candidate
		BEGIN
			INSERT INTO Candidates (statusId, firstName, lastName) VALUES (1, @FirstName, @LastName);
		END;
	