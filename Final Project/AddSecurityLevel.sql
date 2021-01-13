
/*
	Candiadtes have the following authorities:
	1. choose whether to accept the offer
	2. set up a new apply if he is not blacklisted
	3. complain about the interview 
*/
CREATE ROLE Candidates;

/*
	Consultants have the following authorities:
	1. set up an interview
	2. select candidates
	3. check the information of onboarding candidates
*/
CREATE ROLE Consultants;

-- grant authorities to candidates
GRANT EXECUTE ON spCandidateChooseOffer TO Candidates;
GRANT EXECUTE ON spNewApply TO Candidates;
GRANT EXECUTE ON spComplain TO Candidates;

-- consultants use this procedure to invite interview, extend offer and check onboarding information
GRANT EXECUTE ON spChangeStatus TO Consultants;

-- create a specific user with her login
CREATE LOGIN FloraTully WITH PASSWORD = '123456', DEFAULT_DATABASE = RecruitmentSystem;
CREATE USER FloraTully;

-- create a specific user with his login
CREATE LOGIN BenjaminLubbers WITH PASSWORD = 'asdffgg', DEFAULT_DATABASE = RecruitmentSystem;
CREATE USER BenjaminLubbers;

-- give FloraTully the authorities of candidates
ALTER ROLE Candidates ADD MEMBER FloraTully;

-- give BenjaminLubbers the authorities of Consultants
ALTER ROLE Consultants ADD MEMBER BenjaminLubbers;
