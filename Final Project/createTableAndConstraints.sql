-- Tables are created below with their respective details

-- Table: Candidates
-- List of candidates candidate for job opennings.
CREATE TABLE Candidates (
    candidateId INT PRIMARY KEY IDENTITY,
    statusId INT NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    candidateAddress VARCHAR(100),
    phoneNumber VARCHAR(20),
    email VARCHAR(50),
    SSN VARCHAR(20),
);

-- Table: candidateStatus
-- use this table to make the system scalable and readable
-- States of the candidate during the hiring process including
-- applied, waiting, rejected, interview_N_online, interview_N_onsite, on-call for next job opportunity, offer extended, offer declined, 
-- offer accepted, offer negotiated, onboarding, employee, blacklisted
CREATE TABLE candidateStatus (
    statusId INT PRIMARY KEY IDENTITY,
    statusName VARCHAR(50),
    statusDescription VARCHAR(100),
);

-- Table: Companys
-- A list of companys that publish job opennings on the system
CREATE TABLE Companys (
    companyId INT PRIMARY KEY IDENTITY,
    companyName VARCHAR(100) NOT NULL,
    companyDescription VARCHAR(100),
    companyAddress VARCHAR(100),
);

-- Table: Jobs
-- Job in a company
CREATE TABLE Jobs (
    jobId INT PRIMARY KEY IDENTITY,
    companyId INT NOT NULL REFERENCES Companys (companyId),
	jobDescription VARCHAR(100) NOT NULL,
);

-- Table: JobOpenings
-- all opening jobs in a company
CREATE TABLE JobOpenings (
    jobOpeningId INT PRIMARY KEY IDENTITY,
	jobID INT NOT NULL REFERENCES Jobs (jobID),
	jobType VARCHAR(20) NOT NULL,
);

-- Table: candidateToJob
-- The relationship table for candidate and job.
CREATE TABLE candidateToJob (
    candidateId INT NOT NULL REFERENCES Candidates (candidateId),
    jobOpeningId INT NOT NULL REFERENCES JobOpenings (jobOpeningId)
);

-- Table: Interviewers
-- A list of interviewers for scheduled interviews.
CREATE TABLE Interviewers (
    interviewerId INT PRIMARY KEY IDENTITY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
);

-- Table: InterviewerReviews
-- List of all reviews which the interviewers give the interview.
CREATE TABLE InterviewerReviews (
    interviewerReviewId INT PRIMARY KEY IDENTITY,
	interviewerId INT NOT NULL REFERENCES Interviewers (interviewerId),
    rate INT NOT NULL,
    reviewContent VARCHAR(100),
    CHECK (rate >= 0 AND rate <= 5)
);

-- Table: CandidateReviews
-- List of all reviews which the candidates give the interview.
CREATE TABLE CandidateReviews (
    candidateReviewId INT PRIMARY KEY IDENTITY,
	candidateId INT NOT NULL REFERENCES Candidates (candidateID),
    rate INT NOT NULL,
    reviewContent VARCHAR(100),
    CHECK (rate >= 0 AND rate <= 5)
);

-- Table: AirlineReservation
-- The reservation info for the airline, if exists, in the onsite interview.
CREATE TABLE AirlineReservation (
    airlineId INT PRIMARY KEY IDENTITY,
    departure VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departureDate DATE NOT NULL,
    destinationDate DATE NOT NULL,
    cost MONEY,
);

-- Table: CarRental
-- The car rent info, if exists, in the onsite interview.
CREATE TABLE CarRental (
    carId INT PRIMARY KEY IDENTITY,
    rentDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    cost MONEY,
);

-- Table: HotelReservation
-- The hotel reservation info, if needed, in an onsite interview.
CREATE TABLE HotelReservation (
    HotelId INT PRIMARY KEY IDENTITY,
    hotelName VARCHAR(100),
    checkInDate DATE NOT NULL,
    checkOutDate DATE NOT NULL,
    cost MONEY,
);

-- Table: Reimbursement
-- The table stores all the reimbursement info of every onsite interviews.
CREATE TABLE Reimbursement (
    reimburseId INT PRIMARY KEY IDENTITY,
    cost MONEY,
    airlineId INT REFERENCES AirlineReservation (airlineId),
    carId INT REFERENCES CarRental (carId),
    hotelId INT REFERENCES HotelReservation (HotelId),
);

-- Table: Interview
-- A list of scheduled interviews.
CREATE TABLE Interviews (
    interviewId INT PRIMARY KEY IDENTITY,
    interviewerId INT NOT NULL REFERENCES Interviewers (interviewerId),
	candidateId INT NOT NULL REFERENCES Candidates (candidateID),
	jobOpeningId INT NOT NULL REFERENCES JobOpenings (jobOpeningId),
	interviewerReviewId INT NOT NULL REFERENCES InterviewerReviews (interviewerReviewId),
    reimburseId INT NOT NULL REFERENCES Reimbursement (reimburseId),
	interviewType VARCHAR(10) not null
);

ALTER TABLE Candidates WITH CHECK ADD FOREIGN KEY (statusId) REFERENCES candidateStatus (statusId);
ALTER TABLE Interviews ALTER COLUMN interviewerReviewId INT NULL;
ALTER TABLE Interviews ADD candidateReviewId INT NULL REFERENCES CandidateReviews (candidateReviewId); 
ALTER TABLE JobOpenings DROP COLUMN companyID;
ALTER TABLE Candidates WITH CHECK ADD FOREIGN KEY (statusId) REFERENCES candidateStatus (statusId);
ALTER TABLE JobOpenings ADD OpeningNumber INT NOT NULL DEFAULT 0;













