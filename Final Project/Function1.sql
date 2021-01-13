-- calculate the total cost of AirlineReservation, CarRental and HotelReservation
CREATE FUNCTION fnCaculateTotalCost
	(@reimburseId INT)
	RETURNS MONEY
BEGIN
	DECLARE @cost1 MONEY, @cost2 MONEY, @cost3 MONEY;
	SET @cost1 = 0;
	SET @cost2 = 0;
	SET @cost3 = 0;
	-- since a Reimbursement could include only some of the costs, we need to judge whether there is a null id
	IF EXISTS (SELECT airlineId FROM Reimbursement WHERE reimburseId = @reimburseId )
		BEGIN
			SET @cost1 = (SELECT A.cost FROM Reimbursement AS R JOIN AirlineReservation AS A
											ON R.airlineId = A.airlineId WHERE R.reimburseId = @reimburseId);
		END;
	IF EXISTS (SELECT carId FROM Reimbursement WHERE reimburseId = @reimburseId )
		BEGIN
			SET @cost2 =  (SELECT C.cost FROM Reimbursement AS R JOIN CarRental AS C
											ON R.airlineId = C.carId WHERE R.reimburseId = @reimburseId);
		END;
	IF EXISTS (SELECT hotelId FROM Reimbursement WHERE reimburseId = @reimburseId )
		BEGIN
			SET @cost3 =  (SELECT H.cost FROM Reimbursement AS R JOIN HotelReservation AS H
											ON R.airlineId = H.HotelId WHERE R.reimburseId = @reimburseId);
		END;
	RETURN @cost1 + @cost2 + @cost3;
END;
