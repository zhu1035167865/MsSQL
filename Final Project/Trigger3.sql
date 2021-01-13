-- use this CalculateTotalCost trigger to calculate the total cost after we insert a new row or update a row 
-- this trigger is used after HotelReservation have been updated or inserted
-- this trigger will invoke function dbo.fnCaculateTotalCost 
CREATE TRIGGER CalculateTotalCost2
	ON HotelReservation AFTER INSERT, UPDATE
AS
	DECLARE @Temp int;
	IF  EXISTS (SELECT 1 FROM inserted AS I JOIN Reimbursement AS R ON R.hotelId = I.HotelId)
		BEGIN
		SET @Temp = (SELECT reimburseId FROM inserted AS I JOIN Reimbursement AS R ON R.hotelId = I.HotelId);
		UPDATE Reimbursement SET cost = dbo.fnCaculateTotalCost(@Temp) WHERE reimburseId = @Temp;
		END;