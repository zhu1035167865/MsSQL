-- use this CalculateTotalCost trigger to calculate the total cost after we insert a noew row or update a row
-- this trigger will invoke function dbo.fnCaculateTotalCost 
CREATE TRIGGER CalculateTotalCost
	ON Reimbursement AFTER INSERT, UPDATE
AS
	DECLARE @Temp int;
	SET @Temp = (SELECT reimburseId FROM inserted);
	UPDATE Reimbursement SET cost = dbo.fnCaculateTotalCost(@Temp)
	WHERE reimburseId = @Temp;



