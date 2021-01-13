/*
	View to show the list of company and jobs' opennigs with following details:
	CompanyName, 
	CompanyDescription, 
	CompanyAddress, 
	Job, 
	JobType, 
	OpeningNumber, 
*/
CREATE VIEW ListOfJobsInfo (CompanyName, CompanyDescription, CompanyAddress, Job, JobType, OpeningNumber)
AS
	SELECT CM.companyName, CM.companyDescription, CM.companyAddress, J.jobDescription, JO.jobType, JO.OpeningNumber
	FROM  JobOpenings AS JO JOIN Jobs AS J ON J.jobId = JO.jobID
	JOIN Companys AS CM ON CM.companyId = J.companyId;

