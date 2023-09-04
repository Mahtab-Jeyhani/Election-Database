create table Voter (
          NationalID char(10), FirstName varchar(10),
	      LastName varchar(10), Bdate date, Gender varchar(6),
		  check (Gender = 'Female' or Gender = 'Male'),
	      primary key(NationalId)
);
/*----------------------------------*/
create table Candidate (
          NationalID char(10), FirstName varchar(10),
	      LastName varchar(10), Bdate date,
	      Religen varchar(20), City varchar(10),
	      PoliticalOrientation varchar(20),
	      Gender varchar(6),
		  check (Gender = 'Female' or Gender = 'Male'),
		  EducationDegree varchar(20),
	      EducationField varchar(20),
		  check (Religen = 'Islam' or Religen = 'Christianity'),
	      primary key(NationalId)
);
/*----------------------------------*/
create table Election(
         ElectionID smallint, ElectionDate date,
	     primary key (ElectionID)
);
/*----------------------------------*/
create table ElectionFund(
        EFID smallint, Location varchar(20),
	    primary key (EFID)
);
/*----------------------------------*/
create table Supervisor(
         SUID smallint, CouncilName varchar(20),
	     CouncilPeriod smallint,
	     primary key (SUID)
);
/*----------------------------------*/
create table ElectoralDistrict(
       EDID smallint, EDName varchar(10),
	   primary key (EDID)
);
/*----------------------------------*/
create table PresidentalElection(
      ElectionID smallint, ElectionPeriod smallint,
	  Stage smallint, Type varchar(10),
	  check(Type = 'normal' or Type = 'mid term'),
	  primary key (ElectionID),
	  foreign key (ElectionID) references Election(ElectionID)
	  on update cascade on delete cascade
);
/*----------------------------------*/
create table PEEF(
      ElectionID smallint, EFID smallint,
	  primary key (ElectionID, EFID),
	  foreign key (ElectionID) references Election(ElectionID)
	  on update cascade on delete cascade,
	  foreign key (EFID) references ElectionFund(EFID)
	  on update cascade on delete cascade 
);
/*----------------------------------*/
create table PEEnroll(
      ElectionID smallint, CANID char(10),
	  primary key (ElectionID, CANID),
	  foreign key (ElectionID) references Election(ElectionID)
	  on update cascade on delete cascade,
	  foreign key (CANID) references Candidate(NationalID)
	  on update cascade on delete cascade 
);
/*----------------------------------*/
create table PEVote(
     VOID char(10), CANID char(10),
	 EFID smallint,
	 primary key (VOID, CANID, EFID),
	 foreign key (VOID) references Voter(NationalID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table PEValidation(
     SUID smallint, CANID char(10),
	 status varchar(20),
	 check( status = 'qualified' or status = 'disqualified'),
	 primary key (SUID, CANID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table EFPECanelation(
     SUID smallint, EFID smallint,
	 reason varchar(100),
	 primary key (SUID, EFID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table IslamicConsultativeAssemblyElection(
     ElectionID smallint, ElectionPeriod int,
	 Type varchar(10),
	 check(Type = 'normal' or Type ='mid term'),
	 primary key (ElectionID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table ICAEF(
     ElectionID smallint, EFID smallint,
	 primary key (ElectionID, EFID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade
);
/*----------------------------------*/
create table ICAEnroll(
     ElectionID smallint, CANID char(10),
	 EDID smallint,
	 primary key (ElectionID, CANID, EDID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
     foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EDID) references ElectoralDistrict(EDID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table ICAVote(
     VOID char(10), CANID char(10), EFID smallint,
	 primary key (VOID, CANID, EFID),
	 foreign key (VOID) references Voter(NationalID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade
);
/*----------------------------------*/
create table ICAValidation(
     SUID smallint, CANID char(10),
	 status varchar(20),
	 check( status = 'qualified' or status = 'disqualified'),
	 primary key (SUID, CANID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table EFICACanelation(
     SUID smallint, EFID smallint,
	 reason varchar(100),
	 primary key (SUID, EFID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade  
);
/*----------------------------------*/
create table AssemblyOfExpertsElection(
     ElectionID smallint, ElectionPeriod int,
	 Type varchar(10),
	 check(Type = 'normal' or Type ='mid term'),
	 primary key (ElectionID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table AOEEF(
     ElectionID smallint, EFID smallint,
	 primary key (ElectionID, EFID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade
);
/*----------------------------------*/
create table AOEEnroll(
    ElectionID smallint, CANID char(10),
	 EDID smallint,
	 primary key (ElectionID, CANID, EDID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
     foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EDID) references ElectoralDistrict(EDID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table AOEVote(
     VOID char(10), CANID char(10), EFID smallint,
	 primary key (VOID, CANID, EFID),
	 foreign key (VOID) references Voter(NationalID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade
);
/*----------------------------------*/
create table AOEValidation(
     SUID smallint, CANID char(10),
	 status varchar(20),
	 check( status = 'qualified' or status = 'disqualified'),
	 primary key (SUID, CANID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade    
);
/*----------------------------------*/
create table EFAOECanelation(
    SUID smallint, EFID smallint,
	reason varchar(100),
    primary key (SUID, EFID),
	foreign key (SUID) references Supervisor(SUID)
	on update cascade on delete cascade,
	foreign key (EFID) references ElectionFund(EFID)
    on update cascade on delete cascade  
);
/*----------------------------------*/
create table ProvincialSocietiesElection(
    ElectionID smallint, ElectionPeriod int,
	Type varchar(10),
	check(Type = 'normal' or Type = 'mid term'),
	primary key (ElectionID),
	foreign key (ElectionID) references Election(ElectionID)
	on update cascade on delete cascade
);
/*----------------------------------*/
create table PSEF(
     ElectionID smallint, EFID smallint,
	 primary key (ElectionID, EFID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade   
);
/*----------------------------------*/
create table  PSEnroll(
     ElectionID smallint, CANID char(10),
	 EDID smallint,
	 primary key (ElectionID, CANID, EDID),
	 foreign key (ElectionID) references Election(ElectionID)
	 on update cascade on delete cascade,
     foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EDID) references ElectoralDistrict(EDID)
	 on update cascade on delete cascade
);
/*----------------------------------*/
create table PSVote(
     VOID char(10), CANID char(10), EFID smallint,
	 primary key (VOID, CANID, EFID),
	 foreign key (VOID) references Voter(NationalID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade,
	 foreign key (EFID) references ElectionFund(EFID)
     on update cascade on delete cascade
);
/*----------------------------------*/
create table PSValidation(
     SUID smallint, CANID char(10),
	 status varchar(20),
	 check( status = 'qualified' or status = 'disqualified'),
	 primary key (SUID, CANID),
	 foreign key (SUID) references Supervisor(SUID)
	 on update cascade on delete cascade,
	 foreign key (CANID) references Candidate(NationalID)
	 on update cascade on delete cascade    
);
/*----------------------------------*/
create table EFPSCanelation(
    SUID smallint, EFID smallint,
	reason varchar(100),
    primary key (SUID, EFID),
	foreign key (SUID) references Supervisor(SUID)
	on update cascade on delete cascade,
	foreign key (EFID) references ElectionFund(EFID)
    on update cascade on delete cascade  
);
/*-----------------VIEWS FOR USERS-------------*/
/*----------REQUIRED VIEWS FOR USERS AS VOTER (PEElection)--*/
CREATE VIEW CandidatePE_Qualified_List AS
SELECT Firstname, 
	   Lastname, 
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   City, 
	   PoliticalOrientation, 
	   Gender, 
	   EducationDegree, 
	   EducationField 
FROM Candidate INNER JOIN PEValidation 
ON Candidate.NationalID = PEValidation.CANID
WHERE Status = 'qualified';
/*----------REQUIRED VIEWS FOR USERS AS VOTER (ICAElection)--*/
CREATE VIEW CandidateICA_Qualified_List AS
SELECT Firstname, 
	   Lastname, 
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   City, 
	   PoliticalOrientation, 
	   Gender, 
	   EducationDegree, 
	   EducationField 
FROM Candidate INNER JOIN ICAValidation 
ON Candidate.NationalID = ICAValidation.CANID
WHERE Status = 'qualified';
/*----------REQUIRED VIEWS FOR USERS AS VOTER (AOEElection)--*/
CREATE VIEW CandidateAOE_Qualified_List AS
SELECT Firstname, 
	   Lastname, 
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   City, 
	   PoliticalOrientation, 
	   Gender, 
	   EducationDegree, 
	   EducationField 
FROM Candidate INNER JOIN AOEValidation 
ON Candidate.NationalID = AOEValidation.CANID
WHERE Status = 'qualified';
/*----------REQUIRED VIEWS FOR USERS AS VOTER (AOEElection)--*/
CREATE VIEW CandidatePS_Qualified_List AS
SELECT Firstname, 
	   Lastname, 
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   City, 
	   PoliticalOrientation, 
	   Gender, 
	   EducationDegree, 
	   EducationField 
FROM Candidate INNER JOIN PSValidation 
ON Candidate.NationalID = PSValidation.CANID
WHERE Status = 'qualified';
/*----------REQUIRED VIEWS FOR USERS AS A CANDIDATE (PEElection)--*/
CREATE VIEW PECandidate_qualification AS 
SELECT NationalID, Firstname, Lastname, Status, ElectionID
FROM Candidate INNER JOIN PEValidation ON Candidate.NationalID = PEValidation.CANID
INNER JOIN PEEnroll ON PEEnroll.CANID = Candidate.NationalID;
/*----------REQUIRED VIEWS FOR USERS AS A CANDIDATE (AOEElection)--*/
CREATE VIEW AOECandidate_qualification AS 
SELECT NationalID, Firstname, Lastname, Status, ElectionID
FROM Candidate INNER JOIN AOEValidation ON Candidate.NationalID = AOEValidation.CANID
INNER JOIN AOEEnroll ON AOEEnroll.CANID = Candidate.NationalID;
/*----------REQUIRED VIEWS FOR USERS AS A CANDIDATE (PSElection)--*/
CREATE VIEW PSCandidate_qualification AS 
SELECT NationalID, Firstname, Lastname, Status, ElectionID
FROM Candidate INNER JOIN PSValidation ON Candidate.NationalID = PSValidation.CANID
INNER JOIN PSEnroll ON PSEnroll.CANID = Candidate.NationalID;
/*----------REQUIRED VIEWS FOR USERS AS A CANDIDATE (PSElection)--*/
CREATE VIEW ICACandidate_qualification AS 
SELECT NationalID, Firstname, Lastname, Status, ElectionID
FROM Candidate INNER JOIN ICAValidation ON Candidate.NationalID = ICAValidation.CANID
INNER JOIN ICAEnroll ON ICAEnroll.CANID = Candidate.NationalID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (PSElection)--*/
CREATE VIEW Evaluation_of_PEelectionfund AS
SELECT EFPECanelation.EFID, Location, reason, ElectionPeriod
FROM EFPECanelation INNER JOIN ElectionFund ON EFPECanelation.EFID = ElectionFund.EFID
INNER JOIN PEEF ON PEEF.EFID = ElectionFund.EFID
INNER JOIN PresidentalElection ON PresidentalElection.ElectionID = PEEF.ElectionID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (ICAlection)--*/
CREATE VIEW Evaluation_of_ICAEelectionfund AS
SELECT EFICACanelation.EFID, Location, reason, ElectionPeriod
FROM EFICACanelation INNER JOIN ElectionFund ON EFICACanelation.EFID = ElectionFund.EFID
INNER JOIN ICAEF ON ICAEF.EFID = ElectionFund.EFID
INNER JOIN IslamicConsultativeAssemblyElection ON IslamicConsultativeAssemblyElection.ElectionID = ICAEF.ElectionID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (AOElection)--*/
CREATE VIEW Evaluation_of_AOEEelectionfund AS
SELECT EFAOECanelation.EFID, Location, reason, ElectionPeriod
FROM EFAOECanelation INNER JOIN ElectionFund ON EFAOECanelation.EFID = ElectionFund.EFID
INNER JOIN AOEEF ON AOEEF.EFID = ElectionFund.EFID
INNER JOIN AssemblyOfExpertsElection ON AssemblyOfExpertsElection.ElectionID = AOEEF.ElectionID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (PSelection)--*/
CREATE VIEW Evaluation_of_PSEelectionfund AS
SELECT EFPSCanelation.EFID, Location, reason, ElectionPeriod
FROM EFPSCanelation INNER JOIN ElectionFund ON EFPSCanelation.EFID = ElectionFund.EFID
INNER JOIN PSEF ON PSEF.EFID = ElectionFund.EFID
INNER JOIN ProvincialSocietiesElection ON ProvincialSocietiesElection.ElectionID = PSEF.ElectionID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (PEelection)--*/
CREATE VIEW ALL_PECandidates AS
SELECT NationalID,
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   PoliticalOrientation, 
	   Gender, 
	   EducationDegree, 
	   EducationField
FROM Candidate INNER JOIN PEEnroll ON Candidate.NationalID = PEEnroll.CANID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (ICAelection)--*/
CREATE VIEW ALL_ICACandidates AS
SELECT NationalID,
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   PoliticalOrientation,
	   EducationDegree, 
	   EducationField
FROM Candidate INNER JOIN ICAEnroll ON Candidate.NationalID = ICAEnroll.CANID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (AOEelection)--*/
CREATE VIEW ALL_AOECandidates AS
SELECT NationalID,
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   PoliticalOrientation,
	   EducationDegree, 
	   EducationField
FROM Candidate INNER JOIN AOEEnroll ON Candidate.NationalID = AOEEnroll.CANID;
/*----------REQUIRED VIEWS FOR USERS AS A SUPPERVISOR (PSelection)--*/
CREATE VIEW ALL_PSCandidates AS
SELECT NationalID,
	   AGE(NOW(), Bdate) as Age, 
	   Religen, 
	   PoliticalOrientation,
	   EducationDegree, 
	   EducationField
FROM Candidate INNER JOIN PSEnroll ON Candidate.NationalID = PSEnroll.CANID;
/*----------REQUIRED VIEWS FOR ALL USERS (FINAL_PERESULT)------------------------*/

CREATE VIEW final_peresult AS
WITH all_votes AS (
  SELECT  PresidentalElection.ElectionID, PresidentalElection.stage, Candidate.firstname, Candidate.lastname, canid,COUNT(*) AS vote_count
    FROM PEvote
    INNER JOIN candidate ON Candidate.NationalID = PEVote.CANID
    INNER JOIN PEEF ON PEEF.EFID = PEVote.EFID
	inner join PresidentalElection on PresidentalElection.ElectionID = PEEF.ElectionID
	GROUP BY PresidentalElection.electionid, PresidentalElection.stage, firstname, lastname, canid
),
rejected_votes AS (
  SELECT  PresidentalElection.ElectionID, PresidentalElection.stage, Candidate.firstname, Candidate.lastname, canid, COUNT(*) AS vote_count
    FROM PEvote
    INNER JOIN candidate ON Candidate.NationalID = PEVote.CANID
    INNER JOIN PEEF ON PEEF.EFID = PEVote.EFID
	inner join PresidentalElection on PresidentalElection.ElectionID = PEEF.ElectionID
	INNER JOIN EFPECanelation ON EFPECanelation.EFID = PEEF.EFID
	GROUP BY PresidentalElection.electionid, PresidentalElection.stage, firstname, lastname, canid
),
vote_counts AS(
SELECT all_votes.ElectionID, all_votes.stage, all_votes.firstname, all_votes.lastname,all_votes.canid, (all_votes.vote_count - COALESCE(rejected_votes.vote_count, 0)) AS vote_count
	FROM
	all_votes LEFT JOIN rejected_votes on (all_votes.ElectionID , all_votes.canid) = (rejected_votes.ElectionID , rejected_votes.canid)
),
total_votes AS (
  SELECT electionid, SUM(vote_count) AS total_count
  FROM vote_counts
  GROUP BY electionid
),
ranked_candidates AS (
  SELECT electionid, stage, firstname, lastname, canid,
  RANK() OVER (PARTITION BY electionid, stage ORDER BY vote_count DESC) AS rank
  FROM vote_counts
)
(SELECT vc.electionid, vc.stage, vc.firstname, vc.lastname, vc.canid, vc.vote_count,
CASE 
  WHEN vc.vote_count > tv.total_count / 2 THEN 'Winner' 
  WHEN rc.rank = 1  and vc.vote_count < tv.total_count / 2 then'Runner-up'
  WHEN rc.rank = 2 THEN 
    CASE 
      WHEN MAX(CASE WHEN rc.rank = 1 THEN vc.vote_count END) OVER (PARTITION BY vc.electionid) > tv.total_count / 2 THEN 'Loser' 
      ELSE 'Runner-up' 
    END 
  ELSE 'Loser'
END AS status
FROM vote_counts vc
JOIN total_votes tv ON vc.electionid = tv.electionid
JOIN ranked_candidates rc ON vc.electionid = rc.electionid AND vc.stage = rc.stage AND vc.firstname = rc.firstname AND vc.lastname = rc.lastname AND vc.canid = rc.canid
ORDER BY vc.electionid, vc.stage, vc.vote_count DESC);

/*----------REQUIRED VIEWS FOR ALL USERS (FINAL_ICARESULT)----------------------*/
CREATE VIEW final_ICAResult AS 
with rejected_vote as (SELECT FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT Candidate.FirstName, Candidate.LastName, COUNT(ICAVote.CANID) AS total_vote, ElectoralDistrict.EDName, ICAVote.CANID,
    ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName ORDER BY COUNT(ICAVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN ICAVote ON Candidate.NationalID = ICAVote.CANID
    INNER JOIN ICAEnroll ON Candidate.NationalID = ICAEnroll.CANID
    INNER JOIN ElectoralDistrict ON ICAEnroll.EDID = ElectoralDistrict.EDID
    INNER JOIN EFICACanelation ON EFICACanelation.EFID = ICAVote.EFID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, ICAVote.CANID
) as subquery),
allvote as(SELECT ElectionID, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT ICAEnroll.ElectionID, Candidate.FirstName, Candidate.LastName, COUNT(ICAVote.CANID) AS total_vote, ElectoralDistrict.EDName, ICAVote.CANID,
           ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName ,ICAEnroll.ElectionID  ORDER BY COUNT(ICAVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN ICAVote ON Candidate.NationalID = ICAVote.CANID
    INNER JOIN ICAEnroll ON Candidate.NationalID = ICAEnroll.CANID
    INNER JOIN ElectoralDistrict ON ICAEnroll.EDID = ElectoralDistrict.EDID
    inner join IslamicConsultativeAssemblyElection on IslamicConsultativeAssemblyElection.ElectionID = ICAEnroll.ElectionID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, ICAVote.CANID,ICAEnroll.ElectionID
) as subquery)


SELECT ElectionPeriod, type, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT IslamicConsultativeAssemblyElection.ElectionPeriod, IslamicConsultativeAssemblyElection.Type , allvote.FirstName, allvote.LastName, (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) AS total_vote, allvote.EDName, allvote.CANID
           ,ROW_NUMBER() OVER (PARTITION BY allvote.EDName , allvote.ElectionID ORDER BY (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) DESC) as row_num
    FROM allvote 
    left join rejected_vote ON rejected_vote.CANID = allvote.CANID
    inner join IslamicConsultativeAssemblyElection on IslamicConsultativeAssemblyElection.ElectionID = allvote.ElectionID
) as subquery 
WHERE row_num <= 5
ORDER BY ElectionPeriod ,type ,EDName, row_num;
/*----------REQUIRED VIEWS FOR ALL USERS (FINAL_AOERESULT)------------------*/
CREATE VIEW final_AOEResult AS 
with rejected_vote as (SELECT FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT Candidate.FirstName, Candidate.LastName, COUNT(AOEVote.CANID) AS total_vote, ElectoralDistrict.EDName, AOEVote.CANID,
    ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName ORDER BY COUNT(AOEVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN AOEVote ON Candidate.NationalID = AOEVote.CANID
    INNER JOIN AOEEnroll ON Candidate.NationalID = AOEEnroll.CANID
    INNER JOIN ElectoralDistrict ON AOEEnroll.EDID = ElectoralDistrict.EDID
    INNER JOIN EFAOECanelation ON EFAOECanelation.EFID = AOEVote.EFID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, AOEVote.CANID
) as subquery),
allvote as(SELECT ElectionID, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT AOEEnroll.ElectionID, Candidate.FirstName, Candidate.LastName, COUNT(AOEVote.CANID) AS total_vote, ElectoralDistrict.EDName, AOEVote.CANID,
           ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName ,AOEEnroll.ElectionID  ORDER BY COUNT(AOEVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN AOEVote ON Candidate.NationalID = AOEVote.CANID
    INNER JOIN AOEEnroll ON Candidate.NationalID = AOEEnroll.CANID
    INNER JOIN ElectoralDistrict ON AOEEnroll.EDID = ElectoralDistrict.EDID
    inner join AssemblyOfExpertsElection on AssemblyOfExpertsElection.ElectionID = AOEEnroll.ElectionID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, AOEVote.CANID,AOEEnroll.ElectionID
) as subquery)


SELECT ElectionPeriod, type, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT AssemblyOfExpertsElection.ElectionPeriod, AssemblyOfExpertsElection.Type , allvote.FirstName, allvote.LastName, (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) AS total_vote, allvote.EDName, allvote.CANID
           ,ROW_NUMBER() OVER (PARTITION BY allvote.EDName , allvote.ElectionID ORDER BY (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) DESC) as row_num
    FROM allvote 
    left join rejected_vote ON rejected_vote.CANID = allvote.CANID
    inner join AssemblyOfExpertsElection on AssemblyOfExpertsElection.ElectionID = allvote.ElectionID
) as subquery 
WHERE row_num <= 5
ORDER BY ElectionPeriod ,type ,EDName, row_num;
/*----------REQUIRED VIEWS FOR ALL USERS (FINAL_PSRESULT)------------------*/
CREATE VIEW final_PSResult AS 
with rejected_vote as (SELECT FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT Candidate.FirstName, Candidate.LastName, COUNT(PSVote.CANID) AS total_vote, ElectoralDistrict.EDName, PSVote.CANID,
    ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName ORDER BY COUNT(PSVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN PSVote ON Candidate.NationalID = PSVote.CANID
    INNER JOIN PSEnroll ON Candidate.NationalID = PSEnroll.CANID
    INNER JOIN ElectoralDistrict ON PSEnroll.EDID = ElectoralDistrict.EDID
    INNER JOIN EFPSCanelation ON EFPSCanelation.EFID = PSVote.EFID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, PSVote.CANID
) as subquery),
allvote as(SELECT ElectionID, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT PSEnroll.ElectionID, Candidate.FirstName, Candidate.LastName, COUNT(PSVote.CANID) AS total_vote, ElectoralDistrict.EDName, PSVote.CANID,
           ROW_NUMBER() OVER (PARTITION BY ElectoralDistrict.EDName,PSEnroll.ElectionID ORDER BY COUNT(PSVote.CANID) DESC) as row_num
    FROM Candidate
    INNER JOIN PSVote ON Candidate.NationalID = PSVote.CANID
    INNER JOIN PSEnroll ON Candidate.NationalID = PSEnroll.CANID
    INNER JOIN ElectoralDistrict ON PSEnroll.EDID = ElectoralDistrict.EDID
    inner join ProvincialSocietiesElection on ProvincialSocietiesElection.ElectionID = PSEnroll.ElectionID
    GROUP BY Candidate.NationalID, ElectoralDistrict.EDName, Candidate.FirstName, Candidate.LastName, PSVote.CANID, PSEnroll.ElectionID
) as subquery)


SELECT ElectionPeriod, type, FirstName, LastName, total_vote, EDName, CANID
FROM (
    SELECT ProvincialSocietiesElection.ElectionPeriod, ProvincialSocietiesElection.Type , allvote.FirstName, allvote.LastName, (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) AS total_vote, allvote.EDName, allvote.CANID
           ,ROW_NUMBER() OVER (PARTITION BY allvote.EDName, allvote.ElectionID ORDER BY (allvote.total_vote - COALESCE(rejected_vote.total_vote, 0)) DESC) as row_num
    FROM allvote 
    left join rejected_vote ON rejected_vote.CANID = allvote.CANID
    inner join ProvincialSocietiesElection on ProvincialSocietiesElection.ElectionID = allvote.ElectionID
) as subquery 
WHERE row_num <= 5
ORDER BY ElectionPeriod ,type ,EDName, row_num;
--TRIGGER-----------------------------------------------------------------

CREATE FUNCTION public.check_age() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (NEW.bdate> CURRENT_DATE - INTERVAL '18 years') THEN
        RAISE EXCEPTION 'Must be at least 18 years old.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_age 
BEFORE INSERT OR UPDATE ON public.voter 
FOR EACH ROW EXECUTE FUNCTION public.check_age();
---------------------------------------------------------------------------
CREATE FUNCTION public.check_age_candidate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (NEW.bdate > CURRENT_DATE - INTERVAL '25 years') THEN
        RAISE EXCEPTION 'Must be at least 25 years old.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_age_can 
BEFORE INSERT OR UPDATE ON public.candidate 
FOR EACH ROW EXECUTE FUNCTION public.check_age_candidate();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_agefromelectiondate() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (NEW.bdate + INTERVAL '18 years') > (SELECT electiondate FROM election ORDER BY Electiondate DESC LIMIT 1) THEN
        RAISE EXCEPTION 'The person must be older than 18.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_age_trigger_ 
AFTER INSERT OR UPDATE ON public.voter 
FOR EACH ROW EXECUTE FUNCTION public.check_agefromelectiondate();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_agefromelectiondatecan() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (NEW.bdate + INTERVAL '25 years') > (SELECT electiondate FROM election ORDER BY Electiondate DESC LIMIT 1) THEN
        RAISE EXCEPTION 'The person must be older than 25.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_age_trigger 
AFTER INSERT OR UPDATE ON public.candidate 
FOR EACH ROW EXECUTE FUNCTION public.check_agefromelectiondatecan();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_city() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    allowed_cities TEXT[] := ARRAY['Tehran', 'Mashhad', 'Isfahan', 'Karaj', 'Shiraz', 'Tabriz', 'Qom','Ahvaz', 'Kermanshah', 'Urmia', 'Rasht', 'Zahedan', 'Hamadan', 'Kerman', 'Yazd', 'Ardabil','Bandar Abbas', 'Arak', 'Eslamshahr', 'Qazvin', 'Zanjan', 'Khorramabad', 'Sanandaj', 'Malayer', 'Borujerd', 'Abadan','Dezful','Kashan','Sari','Gorgan'];
BEGIN
    IF NEW.city <> ALL (allowed_cities) THEN
        RAISE EXCEPTION 'City must be one of %', allowed_cities;
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_city_trigger 
BEFORE INSERT OR UPDATE ON public.candidate 
FOR EACH ROW EXECUTE FUNCTION public.check_city();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_duplicate_vote_PS() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM PSVote WHERE void = NEW.void AND canid = NEW.canid AND efid=new.efid) THEN
        RAISE EXCEPTION 'Duplicate vote not allowed';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_duplicate_vote_trigger_PS
BEFORE INSERT ON PSvote
FOR EACH ROW EXECUTE PROCEDURE check_duplicate_vote_PS();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_duplicate_vote_ICA() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM ICAVote WHERE void = NEW.void AND canid = NEW.canid AND efid=new.efid) THEN
        RAISE EXCEPTION 'Duplicate vote not allowed';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_duplicate_vote_trigger_ICA
BEFORE INSERT ON icavote
FOR EACH ROW EXECUTE PROCEDURE check_duplicate_vote_ICA();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_duplicate_vote_AOE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM AOEVote WHERE void = NEW.void AND canid = NEW.canid AND efid=new.efid) THEN
        RAISE EXCEPTION 'Duplicate vote not allowed';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_duplicate_vote_trigger_AOE
BEFORE INSERT ON AOEvote
FOR EACH ROW EXECUTE PROCEDURE check_duplicate_vote_AOE();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_duplicate_vote_PE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM PEVote WHERE void = NEW.void AND canid = NEW.canid AND efid=new.efid) THEN
        RAISE EXCEPTION 'Duplicate vote not allowed';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_duplicate_vote_trigger_PE
BEFORE INSERT ON PEvote
FOR EACH ROW EXECUTE PROCEDURE check_duplicate_vote_PE();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (char_length(NEW.firstname) < 3 OR char_length(NEW.lastname) < 3) THEN
        RAISE EXCEPTION 'Name must be longer than 3 characters.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_name_length 
BEFORE INSERT OR UPDATE ON public.candidate 
FOR EACH ROW EXECUTE FUNCTION public.check_name_length();

CREATE TRIGGER check_name_length_ 
BEFORE INSERT OR UPDATE ON public.voter 
FOR EACH ROW EXECUTE FUNCTION public.check_name_length();
--------------------------------------------------------------------------
CREATE FUNCTION public.check_value_PS() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    value_exists BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM PSValidation WHERE SUID = NEW.SUID AND canid=new.canid) INTO value_exists;
    IF (value_exists) THEN
        RAISE EXCEPTION 'You have already qualified this candidate.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_value_PS 
BEFORE INSERT OR UPDATE ON public.PSvalidation 
FOR EACH ROW EXECUTE FUNCTION public.check_value_PS();
---------------------------------------------------------------------------
CREATE FUNCTION public.check_value_ICA() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    value_exists BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM ICAValidation WHERE SUID = NEW.SUID AND canid=new.canid) INTO value_exists;
    IF ( value_exists) THEN
        RAISE EXCEPTION 'You have already qualified this candidate';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_value_ICA 
BEFORE INSERT OR UPDATE ON public.ICAvalidation 
FOR EACH ROW EXECUTE FUNCTION public.check_value_ICA();
---------------------------------------------------------------------------
CREATE FUNCTION public.check_value_PE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    value_exists BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM PEValidation WHERE SUID = NEW.SUID AND canid=new.canid) INTO value_exists;
    IF ( value_exists) THEN
        RAISE EXCEPTION 'You have already qualified this candidate.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_value_PE 
BEFORE INSERT OR UPDATE ON public.PEvalidation 
FOR EACH ROW EXECUTE FUNCTION public.check_value_PE();
---------------------------------------------------------------------------
CREATE FUNCTION public.check_value_AOE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    value_exists BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM AOEValidation WHERE SUID = NEW.SUID AND canid=new.canid) INTO value_exists;
    IF ( value_exists) THEN
        RAISE EXCEPTION 'You have already qualified this candidate.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER check_value_AOE 
BEFORE INSERT OR UPDATE ON public.AOEvalidation 
FOR EACH ROW EXECUTE FUNCTION public.check_value_AOE();
---------------------------------------------------------------------------
CREATE FUNCTION public.max_votes_PS() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT COUNT(*) FROM PSVote WHERE void = NEW.VOID AND efid=new.efid) > 5 THEN
        RAISE EXCEPTION 'A voter can vote for a maximum of five candidates.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER max_votes_trigger_PS 
BEFORE INSERT ON public.PSvote 
FOR EACH ROW EXECUTE FUNCTION public.max_votes_PS();
---------------------------------------------------------------------------
CREATE FUNCTION public.max_votes_AOE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT COUNT(*) FROM AOEVote WHERE void = NEW.VOID AND efid=new.efid) > 5 THEN
        RAISE EXCEPTION 'A voter can vote for a maximum of five candidates.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER max_votes_trigger_AOE 
BEFORE INSERT ON public.AOEvote 
FOR EACH ROW EXECUTE FUNCTION public.max_votes_AOE();
---------------------------------------------------------------------------
CREATE FUNCTION public.max_votes_ICA() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT COUNT(*) FROM ICAVote WHERE void = NEW.VOID AND efid=new.efid) > 5 THEN
        RAISE EXCEPTION 'A voter can vote for a maximum of five candidates.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER max_votes_trigger_ICA 
BEFORE INSERT ON public.ICAvote 
FOR EACH ROW EXECUTE FUNCTION public.max_votes_ICA();
---------------------------------------------------------------------------
CREATE FUNCTION public.max_votespe_PE() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT COUNT(*) FROM PEVote WHERE void = NEW.VOID AND efid=new.efid) > 1 THEN
        RAISE EXCEPTION 'A voter can vote for a maximum of one candidate.';
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER max_votes_trigger_PE 
BEFORE INSERT ON public.PEvote 
FOR EACH ROW EXECUTE FUNCTION public.max_votespe_PE();
----TEMPROARY TABLES WHICH ARE NEEDED FOR OUR TRIGGER ---------------------
CREATE TEMPORARY TABLE ica_vote_qual AS
SELECT *
FROM icavote
NATURAL JOIN icavalidation;
---------------------------------------------------------------------------
CREATE TEMPORARY TABLE aoe_vote_qual AS
SELECT *
FROM aoevote
NATURAL JOIN aoevalidation;
---------------------------------------------------------------------------
CREATE TEMPORARY TABLE pe_vote_qual AS
SELECT *
FROM pevote
NATURAL JOIN pevalidation;
---------------------------------------------------------------------------
CREATE TEMPORARY TABLE ps_vote_qual AS
SELECT *
FROM psvote
NATURAL JOIN pevalidation;
------REQUIRED FUNCTION TO USE IN TRIGGERS-----------------
CREATE OR REPLACE FUNCTION checkqualified()
RETURNS TRIGGER AS $$
BEGIN
    IF new.status='disqualified'  THEN
        RAISE EXCEPTION 'You cannot vote for a disqualified candidate';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-------TRIGGERS FOR VOTING TO QULIFIED CANDIDATES--------------------------
--------ICE----------------------------------------------------------------
CREATE TRIGGER check_qualified
BEFORE INSERT ON ica_vote_qual
FOR EACH ROW EXECUTE PROCEDURE checkqualified();
--------AOE----------------------------------------------------------------
CREATE TRIGGER check_qualified
BEFORE INSERT ON aoe_vote_qual
FOR EACH ROW EXECUTE PROCEDURE checkqualified();
--------PE-----------------------------------------------------------------
CREATE TRIGGER check_qualified
BEFORE INSERT ON pe_vote_qual
FOR EACH ROW EXECUTE PROCEDURE checkqualified();
--------PS-----------------------------------------------------------------
CREATE TRIGGER check_qualified
BEFORE INSERT ON ps_vote_qual
FOR EACH ROW EXECUTE PROCEDURE checkqualified();
--------EACH ELECTION FUND MUST BE FOR JUST ONE ELECTION NOT BOTH OR MORE--------
--------PS-----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION check_efid_electionid()
RETURNS TRIGGER AS $$
DECLARE
    efid_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT electionid) INTO efid_count
    FROM peef
    WHERE efid = NEW.efid;

    IF efid_count > 1 THEN
        RAISE EXCEPTION 'efid % matches with more than one electionid', NEW.efid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_efid_electionid_trigger
BEFORE INSERT OR UPDATE ON peef
FOR EACH ROW EXECUTE FUNCTION check_efid_electionid();
--------ICA----------------------------------------------------------------------
CREATE  FUNCTION check_efid_electionidica()
RETURNS TRIGGER AS $$
DECLARE
    efid_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT electionid) INTO efid_count
    FROM icaef
    WHERE efid = NEW.efid;

    IF efid_count > 1 THEN
        RAISE EXCEPTION 'efid % matches with more than one electionid', NEW.efid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_efid_electionid_trigger
BEFORE INSERT OR UPDATE ON icaef
FOR EACH ROW EXECUTE FUNCTION check_efid_electionidica();
--------AOE----------------------------------------------------------------------
CREATE  FUNCTION check_efid_electionidaoe()
RETURNS TRIGGER AS $$
DECLARE
    efid_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT electionid) INTO efid_count
    FROM aoeef
    WHERE efid = NEW.efid;

    IF efid_count > 1 THEN
        RAISE EXCEPTION 'efid % matches with more than one electionid', NEW.efid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_efid_electionid_trigger
BEFORE INSERT OR UPDATE ON aoeef
FOR EACH ROW EXECUTE FUNCTION check_efid_electionidaoe();
--------PS-----------------------------------------------------------------------
CREATE  FUNCTION check_efid_electionidps()
RETURNS TRIGGER AS $$
DECLARE
    efid_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT electionid) INTO efid_count
    FROM PSEF
    WHERE efid = NEW.efid;

    IF efid_count > 1 THEN
        RAISE EXCEPTION 'efid % matches with more than one electionid', NEW.efid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_efid_electionid_trigger
BEFORE INSERT OR UPDATE ON PSEF
FOR EACH ROW EXECUTE FUNCTION check_efid_electionidps();


--INDEXING
create index Voter_Firstname_idx
on Voter (FirstName);
create index Voter_LastName_idx 
on Voter (LastName);
create index Voter_Bdate_idx 
on Voter (Bdate);
create index Candidate_FirstName_idx 
on Candidate (FirstName);
create index Candidate_LastName_idx 
on Candidate (LastName);
create index Candidate_Bdate_idx 
on Candidate (Bdate);
create index ElectoralDistrict_name_idx
on ElectoralDistrict (EDName);
create index ElectionFund_name_idx
on ElectionFund (Location);
create index PE_Stage_idx 
on PresidentalElection (Stage);
create index PE_Type_idx
on PresidentalElection (Type);
create index ICA_Type_idx
on IslamicConsultativeAssemblyElection (Type);
create index PS_Type_idx 
on ProvincialSocietiesElection (Type);
create index AOE_Type_idx 
on AssemblyOfExpertsElection (Type);


explain select * from Voter where FirstName = 'Ali';
----DATABASE TESTING-----------------------------------------------------------------------------------
----INSERTING VALUES IN TABLES-------------------------------------------------------------------------
INSERT INTO voter VALUES
('0000000001'   ,'Ali'     ,'Mohammadi'    ,'1962-02-02'    ,'Male'),
('0000000002'   ,'Ali'     ,'Davoodi'      ,'1973-02-05'    ,'Male'),
('0000000003'   ,'Hassan'  ,'Mohammadi'    ,'1955-03-06'    ,'Male'),
('0000000004'   ,'Hassan'  ,'Akbari'       ,'1966-04-08'    ,'Male'),
('0000000005'   ,'Hossein' ,'Mohammadi'    ,'1987-05-10'    ,'Female'),
('0000000006'   ,'Zahra'   ,'Mohammadi'    ,'1998-01-21'    ,'Female'),
('0000000007'   ,'Fatemeh' ,'Mohammadi'    ,'1999-07-22'    ,'Female'),
('0000000008'   ,'Sara'    ,'Davoodi'      ,'1976-08-12'    ,'Female'),
('0000000009'   ,'Zahra'   ,'Davoodi'      ,'1990-08-07'    ,'Female'),
('0000000010'   ,'Zohreh'  ,'Vahidi'       ,'2001-02-09'    ,'Female'),
('0000000011'   ,'Mohammad','Mohammadi'    ,'2003-12-20'    ,'Male'),
('0000000012'   ,'Javad'   ,'Javadi'       ,'2002-03-27'    ,'Male'),
('0000000013'   ,'Asghar'  ,'Davoodi'      ,'1999-02-21'    ,'Male'),
('0000000014'   ,'Nima'    ,'Mohammadi'    ,'1983-11-21'    ,'Male'),
('0000000015'   ,'Melika'  ,'Sadeghi'      ,'2002-10-06'    ,'Female');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO candidate VALUES
('0100000001'   ,'Ali'      ,'Mohammadi'    ,'1962-02-02'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0100000002'   ,'Ali'      ,'Davoodi'      ,'1973-02-05'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0100000003'   ,'Hassan'   ,'Mohammadi'    ,'1955-03-06'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0100000004'   ,'Hassan'   ,'Akbari'       ,'1966-04-08'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0100000005'   ,'Hossein'  ,'Mohammadi'    ,'1987-05-10'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'Law'),
('0100000006'   ,'Zahra'    ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Bachelor Degree'  ,'Law'),
('0100000007'   ,'Fatemeh'  ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Master Degree'    ,'Law'),
('0100000008'   ,'Sara'     ,'Davoodi'      ,'1976-08-12'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Doctoral Degree'  ,'economic'),
('0100000009'   ,'Zahra'    ,'Davoodi'      ,'1990-08-07'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'economic'),
('0100000010'   ,'Zohreh'   ,'Vahidi'       ,'1992-02-09'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'economic'),
('0100000011'   ,'Mohammad' ,'Mohammadi'    ,'1990-12-20'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'economic'),
('0100000012'   ,'Javad'    ,'Javadi'       ,'1992-03-27'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Political science'),
('0100000013'   ,'Asghar'   ,'Davoodi'      ,'1950-02-21'   ,'Islam'            ,'Mashhad'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Political science'),
('0100000014'   ,'Nima'     ,'Mohammadi'    ,'1983-11-21'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Bachelor Degree'  ,'Political science'),
('0100000015'   ,'Melika'   ,'Sadeghi'      ,'1960-10-06'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Female'   ,'Master Degree'    ,'Political science'),
('0100000016'   ,'Sorosh'   ,'Azizi'        ,'1962-02-02'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Doctoral Degree'  ,'Political science'),
('0100000017'   ,'Ali'      ,'Motahtri'     ,'1973-02-05'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'History'),
('0100000018'   ,'Mahmood'  ,'Ahmadi'       ,'1955-03-06'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Doctoral Degree'  ,'History'),
('0100000019'   ,'Hassan'   ,'Ghahremani'   ,'1966-04-08'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'History'),
('0100000020'   ,'Hossein'  ,'Motahtri'     ,'1987-05-10'   ,'Islam'            ,'Isfahan'      ,'Etedal Gara'          ,'Female'   ,'Doctoral Degree'  ,'History'),

('0200000001'   ,'Hossein'  ,'Molavi'         ,'1988-05-21'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'History'),
('0200000002'   ,'Hossein'  ,'Asghari'        ,'1956-05-22'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'economic'),
('0200000003'   ,'Ali'      ,'Mortazavi'      ,'1965-04-06'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'economic'),
('0200000004'   ,'Hassan'   ,'Ghalibaf'       ,'1960-04-02'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0200000005'   ,'Mahmood'  ,'Madani'         ,'1990-03-01'   ,'Islam'            ,'Tehran'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Law'),
('0200000006'   ,'Asghar'   ,'Heidari'        ,'1984-02-15'   ,'Islam'            ,'Tehran'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Law'),
('0200000007'   ,'Javad'    ,'Davoodi'        ,'1984-03-14'   ,'Islam'            ,'Tehran'      ,'Eslah Talab'          ,'Male'     ,'Doctoral Degree'  ,'Law'),
('0200000008'   ,'Nima'     ,'Davoodi'        ,'1963-05-13'   ,'Islam'            ,'Isfahan'     ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'History'),
('0200000009'   ,'Sorosh'   ,'Mohammadi'      ,'1962-07-12'   ,'Islam'            ,'Isfahan'     ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Political science'),
('0200000010'   ,'Zahra'    ,'Motahtri'       ,'1971-11-10'   ,'Islam'            ,'Mashhad'     ,'Etedal Gara'          ,'Female'   ,'Doctoral Degree'  ,'Political science'),

('0300000001'   ,'Ali'      ,'Mohammadi'    ,'1962-02-02'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0300000002'   ,'Ali'      ,'Davoodi'      ,'1973-02-05'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0300000003'   ,'Hassan'   ,'Mohammadi'    ,'1955-03-06'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0300000004'   ,'Hassan'   ,'Akbari'       ,'1966-04-08'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0300000005'   ,'Hossein'  ,'Mohammadi'    ,'1987-05-10'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'Law'),
('0300000006'   ,'Zahra'    ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Bachelor Degree'  ,'Law'),
('0300000007'   ,'Fatemeh'  ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Master Degree'    ,'Law'),
('0300000008'   ,'Sara'     ,'Davoodi'      ,'1976-08-12'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Doctoral Degree'  ,'economic'),
('0300000009'   ,'Zahra'    ,'Davoodi'      ,'1990-08-07'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'economic'),
('0300000010'   ,'Zohreh'   ,'Vahidi'       ,'1992-02-09'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'economic'),
('0300000011'   ,'Mohammad' ,'Mohammadi'    ,'1990-12-20'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'economic'),
('0300000012'   ,'Javad'    ,'Javadi'       ,'1992-03-27'   ,'Islam'            ,'Mashhad'      ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Political science'),
('0300000013'   ,'Asghar'   ,'Davoodi'      ,'1950-02-21'   ,'Islam'            ,'Mashhad'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Political science'),

('0400000001'   ,'Ali'      ,'Mohammadi'    ,'1962-02-02'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0400000002'   ,'Ali'      ,'Davoodi'      ,'1973-02-05'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0400000003'   ,'Hassan'   ,'Mohammadi'    ,'1955-03-06'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Bachelor Degree'  ,'Law'),
('0400000004'   ,'Hassan'   ,'Akbari'       ,'1966-04-08'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0400000005'   ,'Hossein'  ,'Mohammadi'    ,'1987-05-10'   ,'Islam'            ,'Tehran'       ,'Osol gara'            ,'Female'   ,'Master Degree'    ,'Law'),
('0400000006'   ,'Zahra'    ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Bachelor Degree'  ,'Law'),
('0400000007'   ,'Fatemeh'  ,'Mohammadi'    ,'1990-01-21'   ,'Christianity'     ,'Tehran'       ,'Aghaliat mazhabi'     ,'Female'   ,'Master Degree'    ,'Law'),
('0400000014'   ,'Nima'     ,'Mohammadi'    ,'1983-11-21'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Bachelor Degree'  ,'Political science'),
('0400000015'   ,'Melika'   ,'Sadeghi'      ,'1960-10-06'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Female'   ,'Master Degree'    ,'Political science'),
('0400000016'   ,'Sorosh'   ,'Azizi'        ,'1962-02-02'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Doctoral Degree'  ,'Political science'),
('0400000017'   ,'Ali'      ,'Motahtri'     ,'1973-02-05'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'History'),
('0400000018'   ,'Mahmood'  ,'Ahmadi'       ,'1955-03-06'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Doctoral Degree'  ,'History'),
('0400000019'   ,'Hassan'   ,'Ghahremani'   ,'1966-04-08'   ,'Islam'            ,'Isfahan'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'History'),
('0400000020'   ,'Hossein'  ,'Motahtri'     ,'1987-05-10'   ,'Islam'            ,'Isfahan'      ,'Etedal Gara'          ,'Female'   ,'Doctoral Degree'  ,'History'),
('0400000021'   ,'Hossein'  ,'Molavi'         ,'1988-05-21'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'History'),
('0400000022'   ,'Hossein'  ,'Asghari'        ,'1956-05-22'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'economic'),
('0400000023'   ,'Ali'      ,'Mortazavi'      ,'1965-04-06'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'economic'),
('0400000024'   ,'Hassan'   ,'Ghalibaf'       ,'1960-04-02'   ,'Islam'            ,'Tehran'      ,'Osol gara'            ,'Male'     ,'Master Degree'    ,'Law'),
('0400000025'   ,'Mahmood'  ,'Madani'         ,'1990-03-01'   ,'Islam'            ,'Tehran'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Law'),
('0400000026'   ,'Asghar'   ,'Heidari'        ,'1984-02-15'   ,'Islam'            ,'Tehran'      ,'Eslah Talab'          ,'Male'     ,'Master Degree'    ,'Law');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO election Values
(1100, '2020-02-02'),
(1200, '2016-02-02'),
(1201, '2016-02-03'),
(2100, '2022-03-10'),
(3100, '2022-01-19'),
(4100, '2021-01-11'),
(4110, '2021-05-11');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO electionfund values
(1102, 'Tehran'),
(1202, 'Tehran'),
(1302, 'Tehran'),
(2102, 'Mashhad'),
(2202, 'Mashhad'),
(2302, 'Mashhad'),
(3102, 'Isfahan'),
(3202, 'Isfahan'),
(1101, 'Tehran'),
(1201, 'Tehran'),
(1301, 'Tehran'),
(2101, 'Mashhad'),
(2201, 'Mashhad'),
(2301, 'Mashhad'),
(3101, 'Isfahan'),
(3201, 'Isfahan'),
(3301, 'Isfahan'),
(1103, 'Tehran'),
(1203, 'Tehran'),
(1303, 'Tehran'),
(2103, 'Mashhad'),
(2203, 'Mashhad'),
(2303, 'Mashhad'),
(1104, 'Tehran'),
(1204, 'Tehran'),
(1304, 'Tehran'),
(1404, 'Tehran'),
(3104, 'Isfahan'),
(3204, 'Isfahan'),
(3304, 'Isfahan');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO supervisor values
(11, 'Guardian council','6'),
(12, 'Guardian council','7'),
(21, 'Islamic council', '10'),
(22, 'Islamic council', '11');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO electoraldistrict values
(11, 'Tehran'),
(12, 'Mashhad'),
(13, 'Isfahan');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO IslamicConsultativeAssemblyElection VALUES
(2100, 10, 'normal');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO ICAEF VALUES
(2100,1102),
(2100,1202),
(2100,1302),
(2100,2102),
(2100,2202),
(2100,2302),
(2100,3102),
(2100,3202);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO ICAEnroll VALUES
(2100,'0100000001',11),
(2100,'0100000002',11),
(2100,'0100000003',11),
(2100,'0100000004',11),
(2100,'0100000005',11),
(2100,'0100000006',11),
(2100,'0100000007',11),
(2100,'0100000008',12),
(2100,'0100000009',12),
(2100,'0100000010',12),
(2100,'0100000011',12),
(2100,'0100000012',12),
(2100,'0100000013',12),
(2100,'0100000014',13),
(2100,'0100000015',13),
(2100,'0100000016',13),
(2100,'0100000017',13),
(2100,'0100000018',13),
(2100,'0100000019',13),
(2100,'0100000020',13);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO ICAVote VALUES
('0000000001','0100000001',1102),
('0000000001','0100000005',1102),
('0000000001','0100000004',1102),
('0000000001','0100000003',1102),
('0000000001','0100000002',1102),
('0000000002','0100000001',1102),
('0000000002','0100000005',1102),
('0000000002','0100000004',1102),
('0000000002','0100000003',1102),
('0000000002','0100000002',1102),
('0000000003','0100000001',1202),
('0000000003','0100000006',1202),
('0000000003','0100000004',1202),
('0000000003','0100000003',1202),
('0000000003','0100000002',1202),
('0000000004','0100000001',1202),
('0000000004','0100000006',1202),
('0000000004','0100000004',1202),
('0000000004','0100000003',1202),
('0000000005','0100000006',1302),
('0000000006','0100000008',2102),
('0000000006','0100000009',2102),
('0000000006','0100000010',2102),
('0000000006','0100000011',2102),
('0000000006','0100000012',2102),
('0000000007','0100000008',2102),
('0000000007','0100000009',2102),
('0000000007','0100000010',2102),
('0000000007','0100000011',2102),
('0000000007','0100000012',2102),
('0000000008','0100000008',2102),
('0000000008','0100000013',2102),
('0000000009','0100000008',2202),
('0000000009','0100000011',2202),
('0000000010','0100000008',2302),
('0000000011','0100000014',3102),
('0000000011','0100000015',3102),
('0000000011','0100000016',3102),
('0000000011','0100000017',3102),
('0000000012','0100000018',3102),
('0000000013','0100000014',3102),
('0000000013','0100000015',3102),
('0000000014','0100000015',3202),
('0000000014','0100000014',3202),
('0000000015','0100000014',3102),
('0000000015','0100000018',3102);
----------------------------------------------------------------------------------------------------------------------------
INSERT into ICAValidation values
(12     ,'0100000001'   ,'qualified'),
(12     ,'0100000002'   ,'qualified'),
(12     ,'0100000003'   ,'qualified'),
(12     ,'0100000004'   ,'qualified'),
(12     ,'0100000005'   ,'qualified'),
(12     ,'0100000006'   ,'qualified'),
(12     ,'0100000007'   ,'qualified'),
(12     ,'0100000008'   ,'qualified'),
(12     ,'0100000009'   ,'qualified'),
(12     ,'0100000010'   ,'qualified'),
(12     ,'0100000011'   ,'qualified'),
(12     ,'0100000012'   ,'qualified'),
(12     ,'0100000013'   ,'qualified'),
(12     ,'0100000014'   ,'qualified'),
(12     ,'0100000015'   ,'qualified'),
(12     ,'0100000016'   ,'qualified'),
(12     ,'0100000017'   ,'qualified'),
(12     ,'0100000018'   ,'qualified'),
(12     ,'0100000019'   ,'disqualified'),
(12     ,'0100000020'   ,'disqualified');
----------------------------------------------------------------------------------------------------------------------------
INSERT into EFICACanelation values
(11,2202,'reason 1');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PresidentalElection values
(1100, 10,  1,  'normal'),
(1200, 11,  1,  'normal'),
(1201, 11,  2,  'normal');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PEEF VALUES
(1100,1101),
(1100,2101),
(1100,3101),
(1200,1201),
(1200,2201),
(1200,3201),
(1201,1301),
(1201,2301),
(1201,3301);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PEEnroll VALUES
(1100   ,'0200000001'),
(1100   ,'0200000002'),
(1100   ,'0200000003'),
(1100   ,'0200000004'),
(1100   ,'0200000005'),
(1200   ,'0200000004'),
(1200   ,'0200000006'),
(1200   ,'0200000007'),
(1200   ,'0200000008'),
(1200   ,'0200000009'),
(1200   ,'0200000010'),
(1201   ,'0200000007'),
(1201   ,'0200000008');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PEValidation VALUES
(12   ,'0200000001' ,'qualified'),
(12   ,'0200000002' ,'qualified'),
(12   ,'0200000003' ,'qualified'),
(12   ,'0200000004' ,'qualified'),
(12   ,'0200000005' ,'disqualified'),
(11   ,'0200000004' ,'qualified'),
(11   ,'0200000006' ,'qualified'),
(11   ,'0200000007' ,'qualified'),
(11   ,'0200000008' ,'qualified'),
(11   ,'0200000009' ,'disqualified'),
(11   ,'0200000010' ,'disqualified');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PEVote VALUES
('0000000001','0200000001',1101),
('0000000002','0200000001',1101),
('0000000003','0200000001',1101),
('0000000004','0200000001',1101),
('0000000005','0200000002',2101),
('0000000006','0200000002',2101),
('0000000007','0200000002',2101),
('0000000008','0200000001',2101),
('0000000009','0200000001',3101),
('0000000010','0200000003',3101),
('0000000001','0200000004',1201),
('0000000002','0200000008',1201),
('0000000003','0200000008',1201),
('0000000004','0200000008',1201),
('0000000005','0200000008',2201),
('0000000006','0200000007',2201),
('0000000007','0200000007',2201),
('0000000008','0200000007',2201),
('0000000009','0200000007',2201),
('0000000010','0200000004',3201),
('0000000011','0200000007',3201),
('0000000012','0200000006',3201),
('0000000001','0200000007',1301),
('0000000002','0200000007',1301),
('0000000003','0200000007',1301),
('0000000004','0200000007',1301),
('0000000005','0200000007',1301),
('0000000006','0200000007',2301),
('0000000007','0200000007',2301),
('0000000008','0200000007',2301),
('0000000009','0200000007',2301),
('0000000010','0200000007',3301),
('0000000011','0200000007',3301),
('0000000012','0200000008',3301),
('0000000013','0200000008',3301),
('0000000014','0200000008',1301),
('0000000015','0200000008',1301);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AssemblyOfExpertsElection VALUES
(3100, 7, 'normal');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AOEEF VALUES
(3100,1103),
(3100,1203),
(3100,1303),
(3100,2103), 
(3100,2203), 
(3100,2303);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AOEEnroll VALUES
(3100, '0300000001', 11),
(3100, '0300000002', 11),
(3100, '0300000003', 11),
(3100, '0300000004', 11),
(3100, '0300000005', 11),
(3100, '0300000006', 11),
(3100, '0300000007', 11),
(3100, '0300000008', 12),
(3100, '0300000009', 12),
(3100, '0300000010', 12),
(3100, '0300000011', 12),
(3100, '0300000012', 12),
(3100, '0300000013', 12);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AOEValidation VALUES
(12, '0300000001', 'qualified'),
(12, '0300000002', 'qualified'),
(12, '0300000003', 'qualified'),
(12, '0300000004', 'qualified'),
(12, '0300000005', 'qualified'),
(12, '0300000006', 'qualified'),
(12, '0300000007', 'disqualified'),
(12, '0300000008', 'qualified'),
(12, '0300000009', 'qualified'),
(12, '0300000010', 'qualified'),
(12, '0300000011', 'qualified'),
(12, '0300000012', 'qualified'),
(12, '0300000013', 'qualified');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AOEVote VALUES
('0000000001','0300000001',1103),
('0000000001','0300000005',1103),
('0000000001','0300000004',1103),
('0000000001','0300000003',1103),
('0000000001','0300000002',1103),
('0000000002','0300000001',1103),
('0000000002','0300000005',1103),
('0000000002','0300000004',1103),
('0000000002','0300000003',1103),
('0000000002','0300000002',1103),
('0000000003','0300000001',1203),
('0000000003','0300000006',1203),
('0000000003','0300000004',1203),
('0000000003','0300000003',1203),
('0000000003','0300000002',1203),
('0000000004','0300000001',1203),
('0000000004','0300000006',1203),
('0000000004','0300000004',1203),
('0000000004','0300000003',1203),
('0000000005','0300000006',1303),
('0000000011','0300000001',1103),
('0000000011','0300000002',1103),
('0000000011','0300000003',1103),
('0000000011','0300000004',1103),
('0000000012','0300000002',1103),
('0000000013','0300000006',1103),
('0000000013','0300000002',1103),
('0000000014','0300000001',1203),
('0000000014','0300000003',1203),
('0000000015','0300000003',1303),
('0000000015','0300000006',1303),
('0000000006','0300000008',2103),
('0000000006','0300000009',2103),
('0000000006','0300000010',2103),
('0000000006','0300000011',2103),
('0000000006','0300000012',2103),
('0000000007','0300000008',2103),
('0000000007','0300000009',2103),
('0000000007','0300000010',2103),
('0000000007','0300000011',2103),
('0000000007','0300000012',2103),
('0000000008','0300000008',2103),
('0000000008','0300000013',2103),
('0000000009','0300000008',2203),
('0000000009','0300000011',2203),
('0000000010','0300000008',2303);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO ProvincialSocietiesElection VALUES
(4100, 8, 'normal'),
(4110, 8, 'mid term');
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PSEF VALUES
(4100, 1104),
(4100, 1204),
(4110, 1304),
(4110, 1404),
(4100, 3104),
(4100, 3204);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PSEnroll VALUES

(4100,'0400000001', 11),
(4100,'0400000002', 11),
(4100,'0400000003', 11),
(4100,'0400000004', 11),
(4100,'0400000005', 11),
(4100,'0400000006', 11),
(4100,'0400000007', 11),
(4100,'0400000014', 13),
(4100,'0400000015', 13),
(4100,'0400000016', 13),
(4100,'0400000017', 13),
(4100,'0400000018', 13),
(4100,'0400000019', 13),
(4100,'0400000020', 13),
(4110,'0400000021', 11),
(4110,'0400000022', 11),
(4110,'0400000023', 11),
(4110,'0400000024', 11),
(4110,'0400000025', 11),
(4110,'0400000026', 11);

----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PSValidation VALUES

(21,'0400000001', 'qualified'),
(21,'0400000002', 'qualified'),
(21,'0400000003', 'qualified'),
(21,'0400000004', 'qualified'),
(21,'0400000005', 'qualified'),
(21,'0400000006', 'qualified'),
(21,'0400000007', 'qualified'),
(21,'0400000014', 'qualified'),
(21,'0400000015', 'qualified'),
(21,'0400000016', 'qualified'),
(21,'0400000017', 'qualified'),
(21,'0400000018', 'qualified'),
(21,'0400000019', 'qualified'),
(21,'0400000020', 'disqualified'),
(22,'0400000021', 'qualified'),
(22,'0400000022', 'qualified'),
(22,'0400000023', 'qualified'),
(22,'0400000024', 'qualified'),
(22,'0400000025', 'qualified'),
(22,'0400000026', 'qualified');

----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PSVote VALUES
('0000000001','0400000001',1104),
('0000000001','0400000005',1104),
('0000000001','0400000004',1104),
('0000000001','0400000003',1104),
('0000000001','0400000002',1104),
('0000000002','0400000001',1104),
('0000000002','0400000005',1104),
('0000000002','0400000004',1104),
('0000000002','0400000003',1104),
('0000000002','0400000002',1104),
('0000000003','0400000001',1204),
('0000000003','0400000005',1204),
('0000000003','0400000004',1204),
('0000000003','0400000003',1204),
('0000000003','0400000002',1204),
('0000000004','0400000001',1104),
('0000000004','0400000005',1104),
('0000000004','0400000004',1104),
('0000000004','0400000003',1104),
('0000000005','0400000006',1204),
('0000000011','0400000001',1104),
('0000000011','0400000002',1104),
('0000000011','0400000003',1104),
('0000000011','0400000004',1104),
('0000000012','0400000007',1104),
('0000000013','0400000001',1104),
('0000000013','0400000002',1104),
('0000000014','0400000002',1104),
('0000000014','0400000003',1104),
('0000000015','0400000003',1104),
('0000000015','0400000002',1104),
('0000000006','0400000015',3104),
('0000000006','0400000016',3104),
('0000000006','0400000017',3104),
('0000000006','0400000018',3104),
('0000000007','0400000015',3104),
('0000000007','0400000016',3104),
('0000000007','0400000017',3104),
('0000000007','0400000018',3104),
('0000000007','0400000014',3104),
('0000000008','0400000014',3104),
('0000000008','0400000015',3104),
('0000000009','0400000014',3104),
('0000000009','0400000015',3104),
('0000000010','0400000014',3204),
('0000000010','0400000015',3204),
('0000000001','0400000021',1304),
('0000000001','0400000024',1304),
('0000000001','0400000023',1304),
('0000000001','0400000022',1304),
('0000000002','0400000021',1304),
('0000000002','0400000024',1304),
('0000000002','0400000023',1304),
('0000000002','0400000022',1304),
('0000000003','0400000021',1304),
('0000000003','0400000024',1304),
('0000000003','0400000023',1304),
('0000000003','0400000022',1304),
('0000000004','0400000021',1304),
('0000000004','0400000025',1304),
('0000000004','0400000024',1304),
('0000000004','0400000023',1304),
('0000000005','0400000023',1304),
('0000000011','0400000021',1304),
('0000000011','0400000022',1304),
('0000000011','0400000023',1304),
('0000000011','0400000024',1304),
('0000000012','0400000025',1404),
('0000000013','0400000021',1404),
('0000000013','0400000022',1404),
('0000000014','0400000022',1304),
('0000000014','0400000023',1304),
('0000000015','0400000023',1304),
('0000000015','0400000022',1304),
('0000000006','0400000021',1304),
('0000000006','0400000023',1304),
('0000000006','0400000025',1304),
('0000000006','0400000022',1304),
('0000000007','0400000021',1304),
('0000000007','0400000022',1304),
('0000000007','0400000023',1304),
('0000000007','0400000024',1304),
('0000000007','0400000025',1304);
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO EFPSCanelation VALUES 
(22, 1404, 'reason 5');
----------------------------------------------------------------------------------------------------------------------------






