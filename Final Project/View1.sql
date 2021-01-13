/*
	View to show the list of candidates with following details:
	FirstName, 
	LastName, 
	Email, 
	PhoneNumber, 
	SSN, 
	CurrentStatus, 
	CompanyName, 
	CompanyAddress, 
	Job, 
	JobType
*/
CREATE VIEW ListOfCandidateInfo (FirstName, LastName, Email, PhoneNumber, SSN, CurrentStatus, CompanyName, 
	CompanyAddress, Job, JobType)
AS
	SELECT C.firstName, C.lastName, C.email, C.phoneNumber, C.SSN, CS.statusName, CM.companyName,
		CM.companyAddress, J.jobDescription, JO.jobType
	FROM Candidates AS C JOIN candidateStatus AS CS ON C.statusId = CS.statusId
	JOIN candidateToJob AS M ON M.candidateId = C.candidateId
	JOIN JobOpenings AS JO ON JO.jobOpeningId = M.jobOpeningId
	JOIN Jobs AS J ON J.jobId = JO.jobID
	JOIN Companys AS CM ON CM.companyId = J.companyId;

