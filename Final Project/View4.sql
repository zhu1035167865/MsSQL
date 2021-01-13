/*
	View to show the list of Reimbursement with following details:
	FirstName, LastName, 
	HotelName, HotelCost, CheckInDate, CheckOutDate, 
	CarRentCost,carRentDate,CarReturnDate,
	AirlineCost, AirlineDeparture, AirlineDestination, AirlineDepartureDate, AirlineDestinationDate,
	TotalCost
*/
CREATE VIEW ListOfReimbursementInfo (FirstName, LastName, HotelName, HotelCost, CheckInDate, CheckOutDate, CarRentCost,
									carRentDate, CarReturnDate, AirlineCost, AirlineDeparture, AirlineDestination,
									AirlineDepartureDate, AirlineDestinationDate, TotalCost)
AS
	SELECT  CA.firstName, CA.lastName, H.hotelName, H.cost, H.checkInDate, H.checkOutDate, C.cost, C.rentDate, C.returnDate,
			A.cost, A.departure, A.destination, A.departureDate, A.destinationDate, R.cost
	FROM Interviews AS I JOIN Reimbursement AS R ON I.reimburseId = R.reimburseId
	JOIN HotelReservation AS H ON H.HotelId = R.hotelId
	JOIN CarRental AS C ON C.carId = R.carId
	JOIN AirlineReservation AS A ON A.airlineId = R.airlineId
	JOIN Candidates AS CA ON CA.candidateId = I.candidateId;

