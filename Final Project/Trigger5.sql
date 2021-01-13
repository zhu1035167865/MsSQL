-- use this CalculateTotalCost trigger to calculate the total cost after we insert a new row or update a row 
-- this trigger is used after CarRental have been updated or inserted
-- this trigger will invoke function dbo.fnCaculateTotalCost 
CREATE TRIGGER CalculateTotalCost4
	ON CarRental AFTER INSERT, UPDATE
AS
	DECLARE @Temp int;
	IF  EXISTS (SELECT 1 FROM inserted AS I JOIN Reimbursement AS R ON R.carId = I.carId)
		BEGIN
		SET @Temp = (SELECT reimburseId FROM inserted AS I JOIN Reimbursement AS R ON R.carId = I.carId);
		UPDATE Reimbursement SET cost = dbo.fnCaculateTotalCost(@Temp) WHERE reimburseId = @Temp;
		END;