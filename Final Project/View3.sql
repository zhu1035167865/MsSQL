/*
	View to show the list of company and jobs' opennigs with following details:
	InterviewType, 
	CandidateFirstName, 
	CandidateLastName, 
	CurrentStatus, 
	InterviewerFirstName, 
	InterviewerLastName, 
	Job,
	JobType,
	Company
*/
CREATE VIEW ListOfInterviewInfo (InterviewType, CandidateFirstName, CandidateLastName, CurrentStatus,
								InterviewerFirstName, InterviewerLastName, Job, JobType, Company)
AS
	SELECT  I.interviewType , C.firstName, C.lastName, CS.statusName, IER.firstName, IER.lastName, 
			JS.jobDescription, J.jobType, CM.companyName
	FROM Interviews AS I JOIN Interviewers AS IER ON I.interviewerId = IER.interviewerId
	JOIN Candidates AS C ON C.candidateId = I.candidateId
	JOIN JobOpenings AS J ON J.jobOpeningId = I.jobOpeningId
	JOIN Jobs AS JS ON JS.jobId = J.jobID 
	JOIN candidateStatus AS CS  ON CS.statusId = C.statusId
	JOIN Companys AS CM ON CM.companyId = JS.companyId;


	
