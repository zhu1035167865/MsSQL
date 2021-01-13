INSERT INTO candidateStatus VALUES
('Applied', 'candidate apply for a job and waiting selected'),
('Waiting', 'candidate complain about the result and waiting for next check'),
('Rejected', 'candidate is rejected by the company'),
('On-call for next job opportunity', 'the qualified candidate who can not get the job for some reasons'),
('Offer extended', 'give offer to this candidate and waiting for his choice'),
('Offer declined', 'candidate rejects the offer'),
('Offer accepted', 'candidate accept the offer and turn to next state'),
('Offer negotiating', 'candidate negotiate about the offer and wait for the result'),
('Onboarding', 'check candidate background, collection and all documents required for employment'),
('Employee', 'the candidate become a member of the company and mark the end of recruitment'),
('Blacklisted', ' the candidate cannot again apply for any job-opening in the company'),
('interview_1_online', 'the first online interview'),
('interview_2_online', 'the second online interview'),
('interview_3_online', 'the third online interview'),
('interview_1_onsite', 'the first onsite interview'),
('interview_2_onsite', 'the second onsite interview'),
('interview_3_onsite', 'the third onsite interview');

INSERT INTO Candidates VALUES 
(1, 'Flora', 'Tully', '150 Henry St', '3159768845', 'flora@gmail.com', '1234567890'),
(5, 'Nick', 'Snow', '150 Henry St', '3154448745', 'nick@gmail.com', '0123456789'),
(2, 'Jim', 'Wolf', '150 Henry St', '3156766775', 'jim@gmail.com', '1023456789'),
(9, 'Mack', 'Robert', '150 Henry St', '3154764896', 'mack@gmail.com', '1203456789'),
(11, 'Coulson', 'Stark', '150 Henry St', '3159768845', 'coulson@gmail.com', '1230456789'),
(4, 'Daisy', 'Skye', '150 Henry St', '3154678845', 'daisy@gmail.com', '1234056789');


INSERT INTO Companys VALUES 
(' National Lumber' , 'Industrial truck and tractor operator ', '3027 Hide A Way Road San Jose, CA 95113 '   ),
('Liberty Wealth Planners' , 'Pilates instructor ', '361 Bel Meadow Drive Riverside, CA 92507 '   ),
('Rose Records' , 'Platemaker ', '513 Oliver Street Crowley, TX 76036 '   ),
('Rainbow Bay Crafts' , 'Athlete ', '556 Stonecoal Road Toledo, OH 43615 '   ),
('Newhair' , 'Adjuster ', '1017 Frum Street Nashville, TN 37212 '   );

INSERT INTO Jobs VALUES
(4, 'manager'),
(3, 'stuff'),
(2, 'SDE'),
(1, 'developer');

INSERT INTO JobOpenings VALUES
(1, 'Summer Internship', 10),
(1, 'Full-time Job', 10),
(1, 'Contract-based', 10),
(2, 'Summer Internship', 10),
(2, 'Full-time Job', 10),
(2, 'Contract-based', 10),
(3, 'Full-time Job', 10),
(4, 'Full-time Job', 10);

INSERT INTO candidateToJob VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5);

INSERT INTO Interviewers VALUES
('Benjamin', 'Lubbers'),
('Gerald', 'Ortega');

INSERT INTO AirlineReservation VALUES 
('UT' , 'NY' , '2020-04-20', '2020-04-21' , 1000.00 ),
('WI' , 'NY' , '2020-04-21', '2020-04-22' , 1100.00),
('WI ' , ' NY ' , '2020-04-22 ', '2020-04-23' , 1200.00);

INSERT INTO CarRental VALUES 
('2020-04-20' , '2020-04-21' , 1000.00 ),
('2020-04-21' , '2020-04-21' , 1100.00),
( '2020-04-22 ', '2020-04-23' , 1200.00);

INSERT INTO HotelReservation VALUES 
('Marriott-Quorum','2020-04-21' , '2020-04-22' , 207.20),
('Marriott-Quorum','2020-04-22' , '2020-04-23' , 207.20),
('Marriott-Quorum', '2020-04-23 ', '2020-04-24' , 207.20);

-- create 6 null Reimbursement record
INSERT INTO Reimbursement (cost) VALUES
(0),
(0),
(0),
(0),
(0),
(0);

INSERT INTO Interviews VALUES
(1, 1, 1, NULL, 1, 'onsite', NULL),
(1, 2, 1, NULL, 2, 'onsite', NULL),
(1, 3, 2, NULL, 3, 'onsite', NULL),
(1, 4, 3, NULL, 4, 'online', NULL),
(2, 5, 4, NULL, 5, 'online', NULL),
(2, 6, 5, NULL, 6, 'online', NULL);

UPDATE Reimbursement SET airlineId = 1 WHERE reimburseId = 1;
UPDATE Reimbursement SET carId = 1 WHERE reimburseId = 1;
UPDATE Reimbursement SET hotelId = 1 WHERE reimburseId = 1;