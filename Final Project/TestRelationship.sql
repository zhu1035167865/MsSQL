-- a demo to show the info of candidates with their status  
select *
from Candidates join candidateStatus
on Candidates.statusId = candidateStatus.statusId;

-- a demo to test the relationship between Jobs and JobOpenings
SELECT *
FROM Jobs JOIN JobOpenings
ON Jobs.jobId = JobOpenings.jobID
WHERE jobType = 'Full-time Job';

-- show the key info of an interview
SELECT DISTINCT C.firstName AS CandidateFirstName, C.lastName as CandidateLastName, CS.statusName, IER.firstName, IER.lastName, JS.jobDescription, J.jobType
FROM Interviews AS I JOIN Interviewers AS IER ON I.interviewerId = IER.interviewerId
JOIN Candidates AS C ON C.candidateId = I.candidateId
JOIN JobOpenings AS J ON J.jobOpeningId = I.jobOpeningId
JOIN Jobs AS JS ON JS.jobId = J.jobID 
JOIN candidateStatus AS CS  ON CS.statusId = C.statusId;
