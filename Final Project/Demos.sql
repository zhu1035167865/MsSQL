
--Test the procedure of change status by admins
SELECT * 
FROM Candidates
WHERE candidateId = 2;

EXEC spChangeStatus 'Nick', 'Snow', 5;

SELECT * 
FROM Candidates
WHERE candidateId = 2;



-- test the function of calculate the total cost of Reimbursement
UPDATE Reimbursement SET cost = dbo.fnCaculateTotalCost(1) WHERE reimburseId = 1;

select * from Reimbursement where reimburseId = 1;


PRINT '$ ' + CAST(dbo.fnCaculateTotalCost(1) AS VARCHAR);



-- test the procedure of set up a new apply
select * from Candidates WHERE candidateId = 5;

EXEC spNewApply 'Coulson', 'Stark';

select * from Candidates WHERE candidateId = 5;



-- test trigger
select OpeningNumber from JobOpenings;
select statusId from Candidates where candidateId = 2 or candidateId = 6;
-- extend offer
EXEC spChangeStatus 'Nick', 'Snow', 5;
-- someone accept the offer
EXEC spChangeStatus 'Daisy', 'Skye', 7;
select OpeningNumber from JobOpenings;
select statusId from Candidates where candidateId = 2 or candidateId = 6;

-- test trigger CalculateTotalCost
SELECT * FROM Reimbursement;
INSERT INTO Reimbursement (airlineId, carId, hotelId) VALUES (3,3,3);
SELECT * FROM Reimbursement;

-- test the procedure of complain
select * from Candidates WHERE candidateId = 1;

EXEC spComplain 'Flora', 'Tully', 9;

select * from Candidates WHERE candidateId = 1;


