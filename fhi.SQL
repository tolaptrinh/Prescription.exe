drop table if exists public.AdministrativeUnit CASCADE;
CREATE TABLE public.AdministrativeUnit (
	AdministrativeUnitId	varchar NOT NULL,
	AdministrativeUnitCode	varchar ,
	AdministrativeUnitName	varchar ,
	AdministrativeUnitParent	varchar,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (AdministrativeUnitId)

);

drop table if exists public.Career CASCADE;
CREATE TABLE public.Career (
	CareerId	varchar NOT NULL,
	CareerCode	varchar ,
	CareerName	varchar ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (CareerId)

);

drop table if exists public.RiskGroup CASCADE;
CREATE TABLE public.RiskGroup (
	RiskGroupId	varchar NOT NULL,
	RiskGroupCode	varchar(50) ,
	RiskGroupName	varchar(1000) ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (RiskGroupId)

);

drop table if exists public.Ethnics CASCADE;
CREATE TABLE public.Ethnics (
	EthnicsId	varchar NOT NULL,
	EthnicsCode	varchar(50) ,
	EthnicsName	varchar(1000) ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (EthnicsId)

);

drop table if exists public.Transmission CASCADE;
CREATE TABLE public.Transmission (
	TransmisId	varchar NOT NULL,
	TransmisCode	varchar(50) ,
	TransmisName	varchar(1000) ,
	HIVInforCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (TransmisId)

);

drop table if exists public.Patient CASCADE;
CREATE TABLE public.Patient (
  PatientId varchar NOT NULL,
  FullName varchar ,
  Alias varchar ,
  Sex integer,
  MarialStatus integer,
  PostalAddress varchar(512) ,
  Address varchar(512) ,
  FullAddress varchar(512) ,
  Id1 varchar(64) ,
  Id2 varchar(64) ,
  Id3 varchar(64) ,
  Id4 varchar(64) ,
  Avatar varchar(512) ,
  Finger1 varchar(512) ,
  Finger2 varchar(512) ,
  Mobile varchar ,
  Tel varchar ,
  RiskGroupId varchar REFERENCES RiskGroup(RiskGroupId),
  TransmissionId varchar REFERENCES Transmission(TransmisId),
  HIVConfirmationDate TIMESTAMP,
  HIVConfirmationLab varchar ,
  EnrollmentDate TIMESTAMP,
  ArtEligibleDate TIMESTAMP,
  ArtReadyDate TIMESTAMP,
  ArtApprovalDate TIMESTAMP,
  ArtStartDate TIMESTAMP,
  ArtStatus integer,
  EthnicsId varchar REFERENCES Ethnics(EthnicsId),
  OpcId varchar,
  CareerId varchar REFERENCES Career(CareerId),
  BirthDate TIMESTAMP,
  AdministrativeUnitId varchar,
  PostalAdministrativeUnitId varchar,
  OpcRegistrationCode varchar(64) ,
  LastCD4 integer,
  LastGDLS integer,
  LastRegimen varchar,
  EnrollmentStatus varchar ,
  EnrollmentCD4 integer,
  EnrollmentGDLS integer,
  EnrollmentWeight integer,
  EnrollmentHeight integer,
  ArtStartStatus varchar ,
  ArtStartCD4 integer,
  ArtStartGDLS integer,
  ArtStartWeight integer,
  ArtStartHeight integer,
  ArtStartRegimenId varchar,
  ArtStartRegimenName varchar , HIVConfirmationLabId varchar, LastUpdatedDate TIMESTAMP, IsSyncronized BOOLEAN, LastSyncronizedDate TIMESTAMP, NonHIVConfirmDate BOOLEAN, Email TEXT, EnrollmentWeightD DOUBLE PRECISION, AcisId INT, ArtStartWeightD DOUBLE PRECISION, ReceiveTransferSMS BOOLEAN, Voided BOOLEAN, IsDuplicated BOOL, HivInfoCode TEXT, BornAdministrativeUnitId varchar, HealthInsuranceExpired TIMESTAMP, PatientType INT,
  CONSTRAINT sqlite_autoindex_Patient_1 PRIMARY KEY (PatientId));

drop table if exists public.CareGiver CASCADE;
CREATE TABLE public.CareGiver (
	CareGiverId	varchar NOT NULL,
	FullName	varchar ,
	Alias	varchar ,
	Address	varchar(512) ,
	Relation	varchar ,
	Tel	varchar ,
	PatientId	varchar, RelationType INT, ReceiveSuportSMS BOOL,
    PRIMARY KEY (CareGiverId)
);

drop table if exists public.Users CASCADE;
CREATE TABLE public.Users (
	ApplicationId	varchar NOT NULL,
	UserId	varchar NOT NULL,
	UserName	varchar(256) NOT NULL ,
	LoweredUserName	varchar(256) NOT NULL ,
	MobileAlias	varchar(16) ,
	IsAnonymous	BOOLEAN NOT NULL DEFAULT FALSE,
	LastActivityDate	TIMESTAMP NOT NULL,
    PRIMARY KEY (UserId)

);

drop table if exists public.CareProvider CASCADE;
CREATE TABLE public.CareProvider (
	CareProviderId	varchar NOT NULL,
	CareProviderName	varchar ,
	UserId	varchar,
    PRIMARY KEY (CareProviderId)
);

drop table if exists public.Concept CASCADE;
CREATE TABLE public.Concept (
	ConceptId	varchar NOT NULL,
	ConceptCode	varchar ,
	ConceptName	varchar ,
	Description	varchar(512) ,
	Ranger	integer,
	Unit	integer,
	ConceptParent	varchar,
	CreatedDate	TIMESTAMP,
	ChangedDate	TIMESTAMP,
	MinValue	integer,
	MaxValue	integer,
	DataType	integer, UnitName TEXT, MRSCode TEXT, MinValue_D DOUBLE PRECISION, MaxValue_D DOUBLE PRECISION, IsUsed BOOL, IsDelete BOOL,
    PRIMARY KEY (ConceptId)

);

drop table if exists public.HealthSystem CASCADE;
CREATE TABLE public.HealthSystem (
	HealthSystemId	varchar NOT NULL,
	HealthSystemCode	varchar ,
	HealthSystemName	varchar(512) ,
	SystemLevel	integer,
	HIVInforCode	varchar ,
	Tel	varchar ,
	Email	varchar ,
	AdministrativeUnitCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN, AcisId INT, AcisUserName TEXT, AcisPassword TEXT,
    PRIMARY KEY (HealthSystemId)

);

drop table if exists public.Encounter CASCADE;
CREATE TABLE public.Encounter (
	EncounterId	varchar NOT NULL,
	PatientId	varchar,
	VisitDate	TIMESTAMP,
	Type	integer,
	OpcId	varchar,
	CareProviderId	varchar,
	Status	integer,
	NextAppointmentId	varchar, LastUpdatedDate TIMESTAMP, IsSyncronized BOOL, LastSyncronizedDate TIMESTAMP, InsertDate TIMESTAMP, EditDate TIMESTAMP, NextDispenId varchar, EncounterType INT default 1, InputType INT default 0,
    PRIMARY KEY (EncounterId)
);

drop table if exists public.LabTestOrder CASCADE;
CREATE TABLE public.LabTestOrder (
	LabTestOrderId	varchar NOT NULL,
	EncounterId	varchar,
	PatientId	varchar,
	SampleCode	varchar ,
	OrderDate	TIMESTAMP,
	Description	varchar(512) ,
	Request	varchar ,
	Approver	varchar ,
	LabId	varchar,
	StatusTest	integer,
	StatusType	varchar ,
	LabRequestType	integer,
	SampleDate	TIMESTAMP,
	StatusLabResult	varchar ,
	DescriptionResult	varchar(512) ,
	ResultDate	TIMESTAMP,
	Comment	varchar(512) ,
	Conclusion	varchar(512) , LabTestName TEXT, ImportResult TEXT,
    PRIMARY KEY (LabTestOrderId)
);

drop table if exists public.ConceptLabTestOrder CASCADE;
CREATE TABLE public.ConceptLabTestOrder (
	ConceptId	varchar NOT NULL,
	LabTestOrderId	varchar NOT NULL,
    PRIMARY KEY (ConceptId, LabTestOrderId)
);

drop table if exists public.DictionarySystem CASCADE;
CREATE TABLE public.DictionarySystem (
	Id	varchar NOT NULL,
	Code	varchar ,
	Name	varchar(512) ,
	AbrName	varchar(512) ,
	ObjectRef	varchar ,
	Value	integer,
	OrderItem	integer, MRSCode TEXT, DictionaryValue TEXT, Note TEXT, Voided BOOLEAN,
    PRIMARY KEY (Id)

);

drop table if exists public.Drug CASCADE;
CREATE TABLE public.Drug (
	DrugId	varchar NOT NULL,
	GenericName	varchar(512) ,
	BrandName	varchar(50) ,
	IdUnit	varchar ,
	Dose	integer,
	DrugType	integer, Unit INT, Dose_D DOUBLE PRECISION, Instruction TEXT, Frequency_D DOUBLE PRECISION, Content TEXT, MRSCode TEXT, AbrName TEXT, Priority INT, ConvertRate DOUBLE PRECISION, UnitConvert INT, IsUsed BOOL,
    PRIMARY KEY (DrugId)

);

drop table if exists public.Orders CASCADE;
CREATE TABLE public.Orders (
	OrderId	varchar NOT NULL,
	EncounterId	varchar,
	PatientId	varchar,
	Ordererer	varchar,
	CreatedDate	TIMESTAMP,
	OpcId	varchar,
	Status	integer,
	DateCreate	TIMESTAMP, DispensaryId varchar, RegimenId varchar, NotCurrentDispensary BOOL default False, Description TEXT,
    PRIMARY KEY (OrderId)
);

drop table if exists public.DrugDispensed CASCADE;
CREATE TABLE public.DrugDispensed (
	DrugDispensedId	varchar NOT NULL,
	EncounterId	varchar,
	PatientId	varchar,
	OrderDate	TIMESTAMP,
	Recipient	varchar ,
	PrescriptionId	varchar,
	OpcId	varchar,
	Note	varchar(1000) , Dispenser TEXT, DispensaryId varchar, OrderId varchar,
    PRIMARY KEY (DrugDispensedId)
);

drop table if exists public.DrugDispensedItem CASCADE;
CREATE TABLE public.DrugDispensedItem (
	Id	varchar NOT NULL,
	DispensedId	varchar,
	DrugId	varchar,
	Frequency	integer,
	Days	integer,
	Dose	integer,
	IdUnit	integer,
	BrandName	varchar ,
	Instruction	varchar(1024) ,
	Total	integer,
	Note	varchar(1024) , Frequency_D DOUBLE PRECISION, Order_Content TEXT, Total_D DOUBLE PRECISION, Total_D_Same DOUBLE PRECISION, Dose_S TEXT, Dose_D DOUBLE PRECISION, Content TEXT, DrugOrderId varchar, Dose_S_Order TEXT, IdUnit_Order INT, DrugDispensedId varchar, DispensedDrugId varchar,
    PRIMARY KEY (Id)
,
    FOREIGN KEY (DrugId)
        REFERENCES Drug(DrugId),
    FOREIGN KEY (DispensedId)
        REFERENCES DrugDispensed(DrugDispensedId)
);

drop table if exists public.DrugInstruction CASCADE;
CREATE TABLE public.DrugInstruction (DrugInstructionId VARCHAR not null, Frequency_D DOUBLE PRECISION, Dose_D DOUBLE PRECISION, AgeMin DOUBLE PRECISION, AgeMax DOUBLE PRECISION, WeightMin DOUBLE PRECISION, WeightMax DOUBLE PRECISION, HeightMin DOUBLE PRECISION, HeightMax DOUBLE PRECISION, ConMin DOUBLE PRECISION, ConMax DOUBLE PRECISION, Instruction TEXT, Description TEXT, Priority NUMERIC, IsDeleted BOOLEAN, DrugId VARCHAR, MixDrugId VARCHAR, MixFrequency_D DOUBLE PRECISION, MixDose_D DOUBLE PRECISION, MixDescription TEXT, MixDrugId1 VARCHAR, MixFrequency_D1 DOUBLE PRECISION, MixDose_D1 DOUBLE PRECISION, MixDescription1 TEXT, primary key (DrugInstructionId));

drop table if exists public.DrugOrder CASCADE;
CREATE TABLE public.DrugOrder (
	DrugOrderId	varchar NOT NULL,
	DrugId	varchar,
	OrderId	varchar,
	Frequency	integer,
	Days	integer,
	Dose	integer,
	UnitId	integer,
	BrandName	varchar ,
	Instruction	varchar(1024) ,
	Total	integer,
	Note	varchar(1024) , Frequency_D DOUBLE PRECISION, Dose_D DOUBLE PRECISION, Content TEXT, Unit INT, Total_D DOUBLE PRECISION, TotalPackage DOUBLE PRECISION,
    PRIMARY KEY (DrugOrderId)
);

drop table if exists public.DrugType CASCADE;
CREATE TABLE public.DrugType (
	Id	varchar NOT NULL,
	TypeCode	varchar ,
	TypeName	varchar ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (Id)

);


drop table if exists public.EncounterAllegry CASCADE;
CREATE TABLE public.EncounterAllegry (EncounterAllegryId varchar not null, AllegryName TEXT, AllegryConceptId varchar, AllegryType TEXT, StartDate TIMESTAMP, EndDate TIMESTAMP, Reaction INT, Improve INT, Comment TEXT, IsDelete BOOL, EncounterId varchar, PatientId varchar, LastUpdatedDate TIMESTAMP, IsSyncronized BOOL, LastSyncronizedDate TIMESTAMP, AllegryDetail TEXT, primary key (EncounterAllegryId));

drop table if exists public.EncounterPediatricTestHistory CASCADE;
CREATE TABLE public.EncounterPediatricTestHistory (PediatricLabTestId varchar not null, EncounterId varchar, PatientId varchar, LabTestType INT, LabTestName TEXT, LabTestDate TIMESTAMP, LabTestResult INT, LabTestUnit TEXT, Description TEXT, LabTestUnitId varchar, primary key (PediatricLabTestId));

drop table if exists public.Regimen CASCADE;
CREATE TABLE public.Regimen (
	RegimenId	varchar NOT NULL,
	RegimenCode	varchar(64) ,
	RegimenName	varchar ,
	Lever	integer,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
	IsPublic	BOOLEAN, Level INT,
    PRIMARY KEY (RegimenId)

);


drop table if exists public.EncounterRegimenHistory CASCADE;
CREATE TABLE public.EncounterRegimenHistory (
	Id	varchar NOT NULL,
	PatientId	varchar,
	EncounterId	varchar,
	RegimenId	varchar,
	StartDate	TIMESTAMP,
	EndDate	TIMESTAMP,
	Description	varchar(512) ,
	Status	integer,
	ReasonType	integer,
	RegimenLever	integer,
	RegimenName	varchar(512) , MRSCode TEXT,
    PRIMARY KEY (Id)
);

drop table if exists public.EncounterTreatment CASCADE;
CREATE TABLE public.EncounterTreatment (
	Id	varchar NOT NULL,
	EncounterId	varchar,
	PatientId	varchar,
	TreatmentType	integer,
	Regimen	varchar(512) ,
	StartDate	TIMESTAMP,
	EndDate	TIMESTAMP,
	Description	varchar(512) , RegimenType INT, EndEncounterId varchar,
    PRIMARY KEY (Id)

);

drop table if exists public.EncounterVaccineHistory CASCADE;
CREATE TABLE public.EncounterVaccineHistory (VaccineId varchar not null, EncounterId varchar, PatientId varchar, VaccineType INT, VaccineName TEXT, VaccineDate1 TIMESTAMP, VaccineDate2 TIMESTAMP, VaccineDate3 TIMESTAMP, primary key (VaccineId));

drop table if exists public.GroupPatient CASCADE;
CREATE TABLE public.GroupPatient (GroupPatientId varchar not null, GroupPatientName TEXT, Description TEXT, primary key (GroupPatientId));

drop table if exists public.SupportingOrganization CASCADE;
CREATE TABLE public.SupportingOrganization (
	SupportingOrganizationId	varchar NOT NULL,
	SupportingOrganizationName	varchar(50) ,
	Type	integer,
    PRIMARY KEY (SupportingOrganizationId)

);

drop table if exists public.HealthSystemOrganization CASCADE;
CREATE TABLE public.HealthSystemOrganization (
	HealthSystemOrganizationId	varchar NOT NULL,
	HealthSystemId	varchar,
	OrganizationId	varchar,
    PRIMARY KEY (HealthSystemOrganizationId)
);

drop table if exists public.HealthSystemType CASCADE;
CREATE TABLE public.HealthSystemType (
	Id	varchar NOT NULL,
	TypeCode	varchar ,
	TypeName	varchar ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (Id)

);

drop table if exists public.MemberProfile CASCADE;
CREATE TABLE public.MemberProfile (UserId varchar not null, PropertyNames TEXT not null, PropertyValuesString TEXT not null, PropertyValuesBinary VARCHAR not null, LastUpdatedDate TIMESTAMP not null, primary key (UserId));

drop table if exists public.Members CASCADE;
CREATE TABLE public.Members (UserId varchar not null, ApplicationId varchar not null, Password TEXT not null, PasswordFormat INT not null, PasswordSalt TEXT not null, MobilePIN TEXT, Email TEXT, LoweredEmail TEXT, PasswordQuestion TEXT, PasswordAnswer TEXT, IsApproved BOOL not null, IsLockedOut BOOL not null, CreateDate TIMESTAMP not null, LastLoginDate TIMESTAMP not null, LastPasswordChangedDate TIMESTAMP not null, LastLockoutDate TIMESTAMP not null, FailedPasswordAttemptCount INT not null, FailedPasswordAttemptWindowStart TIMESTAMP not null, FailedPasswordAnswerAttemptCount INT not null, FailedPasswordAnswerAttemptWindowStart TIMESTAMP not null, Comment TEXT, primary key (UserId));

drop table if exists public.MembershipUser CASCADE;
CREATE TABLE public.MembershipUser (Id varchar not null, Name TEXT not null, ApplicationName TEXT not null, EMail TEXT, Password TEXT, InsertDate TIMESTAMP, UpdateDate TIMESTAMP, Comment TEXT, PasswordQuestion TEXT, PasswordAnswer TEXT, Enabled BOOL not null, LastFailedPasswordDate TIMESTAMP, LastLoginDate TIMESTAMP, LastActivityDate TIMESTAMP, LastPasswordChangedDate TIMESTAMP, IsLockedOut BOOL not null, LockedOutDate TIMESTAMP, FailedPwdAttemptCount INT not null, Tag TEXT, primary key (Id));

drop table if exists public.Observation CASCADE;
CREATE TABLE public.Observation (
	Id	varchar NOT NULL,
	EncounterId	varchar,
	ObservationName	varchar ,
	Description	varchar(512) ,
	Ranger	integer,
	Unit	integer,
	Obj_Int	integer,
	Obj_String	varchar ,
	DataType	integer,
	CreatedDate	TIMESTAMP,
	ChangedDate	TIMESTAMP,
	MinValue	integer,
	MaxValue	integer,
	ConceptId	varchar,
	ResultDate	TIMESTAMP, ConceptType INT, Obj_Numeric DOUBLE PRECISION, Obj_varchar varchar,
    PRIMARY KEY (Id)
);

drop table if exists public.OrganizationPatientHistory CASCADE;
CREATE TABLE public.OrganizationPatientHistory (
	Id	varchar NOT NULL,
	OpcId	varchar NOT NULL,
	ToOpcId	varchar,
	PatientId	varchar,
	EncounterId	varchar,
	RegisterDate	TIMESTAMP,
	AcceptDate	TIMESTAMP,
	StartDate	TIMESTAMP,
	EndDate	TIMESTAMP,
	Status	integer,
	Description	varchar(512) ,
	ReasonId	integer, LastUpdatedDate TIMESTAMP, IsSyncronized BOOL, LastSyncronizedDate TIMESTAMP, MRSCode TEXT, IsAccepted BOOL, BookDate TIMESTAMP,
    PRIMARY KEY (Id)
);

drop table if exists public.PatientAppointment CASCADE;
CREATE TABLE public.PatientAppointment (
	PatientAppointmentId	varchar NOT NULL,
	PatientId	varchar,
	AppointmentDate	TIMESTAMP,
	Status	integer,
	EncounterId	varchar, AppointmentType INT default 0, IsActived BOOL default True, ActiveReason TEXT,
    PRIMARY KEY (PatientAppointmentId)
);

drop table if exists public.PatientInfoChild CASCADE;
CREATE TABLE public.PatientInfoChild (PatientId varchar not null, ParentName TEXT, ParentBirthday TIMESTAMP, IdentityNo TEXT, CareerId varchar, ParentStatus INT, ParentHIVStatus INT, AdministrativeUnitId varchar, Address TEXT, FullAddress TEXT, Mobile TEXT, Tel TEXT, ReferenType INT, ReferenUnit TEXT, HIVStatus INT, HIVConfirmationDate TIMESTAMP, HIVConfirmationLab TEXT, Email TEXT, OpcIntroduceId varchar, HIVConfirmationLabId varchar, primary key (PatientId));

drop table if exists public.PatientInfoExt CASCADE;
CREATE TABLE public.PatientInfoExt (PatientId varchar not null, ICD TEXT, FatherName TEXT, FatherBirthday TIMESTAMP, MotherName TEXT, MotherBirthday TIMESTAMP, BornAdministrativeUnitId varchar, FreeText TEXT, Description TEXT, primary key (PatientId));

drop table if exists public.PatientStatus CASCADE;
CREATE TABLE public.PatientStatus (
	PatientStatusId	varchar NOT NULL,
	PatientId	varchar,
	StartDate	TIMESTAMP ,
	EndDate	TIMESTAMP ,
	StatusId	integer,
    PRIMARY KEY (PatientStatusId)
);

drop table if exists public.ProfileProperty CASCADE;
CREATE TABLE public.ProfileProperty (Id TEXT not null, IdUser TEXT not null, Name TEXT not null, StringValue TEXT, BinaryValue VARCHAR, primary key (Id));

drop table if exists public.ProfileUser CASCADE;
CREATE TABLE public.ProfileUser (Id TEXT not null, Name TEXT not null, ApplicationName TEXT not null, InsertDate TIMESTAMP not null, UpdateDate TIMESTAMP not null, ProfileType INT not null, LastActivityDate TIMESTAMP not null, LastPropertyChangedDate TIMESTAMP not null, primary key (Id));


drop table if exists public.RegimenDrug CASCADE;
CREATE TABLE public.RegimenDrug (
	Id	varchar NOT NULL,
	RegimenId	varchar,
	DrugId	varchar,
	Frequency	integer,
	Dose	integer, Unit INT, UnitName TEXT, Frequency_D DOUBLE PRECISION, Dose_D DOUBLE PRECISION, Priority INT, Content TEXT, CanObject INT,
    PRIMARY KEY (Id)
);

drop table if exists public.Role CASCADE;
CREATE TABLE public.Role (Id TEXT not null, Name TEXT not null, ApplicationName TEXT not null, Comment TEXT, Tag TEXT, primary key (Id));

drop table if exists public.Roles CASCADE;
CREATE TABLE public.Roles (
	ApplicationId	varchar NOT NULL,
	RoleId	varchar NOT NULL,
	RoleName	varchar(256) NOT NULL ,
	LoweredRoleName	varchar(256) NOT NULL ,
	Description	varchar(256) ,
    PRIMARY KEY (RoleId)

);

drop table if exists public.SearchCondition CASCADE;
CREATE TABLE public.SearchCondition (ConditionId varchar not null, ParameterName TEXT, FromValue TEXT, ToValue TEXT, ExtractValue TEXT, ValueType INT, GroupId varchar, ConditionType INT, primary key (ConditionId));

drop table if exists public.Status CASCADE;
CREATE TABLE public.Status (
	StatusId	varchar NOT NULL,
	StatusCode	varchar ,
	StatusName	varchar ,
	HIVInforCode	varchar ,
	GovCode	varchar ,
	MRSCode	varchar ,
	IsUsed	BOOLEAN,
	IsDelete	BOOLEAN,
    PRIMARY KEY (StatusId)

);

drop table if exists public.SyncronizeLog CASCADE;
CREATE TABLE public.SyncronizeLog (SyncronizeLogId varchar not null, TableName TEXT, LastSyncronizedDate TIMESTAMP, primary key (SyncronizeLogId));

drop table if exists public.sysdiagrams CASCADE;
CREATE TABLE public.sysdiagrams (
	name	varchar NOT NULL ,
	principal_id	integer NOT NULL,
	diagram_id	varchar,
	version	integer,
	definition	VARCHAR

);

drop table if exists public.SystemConfig CASCADE;
CREATE TABLE public.SystemConfig (SystemConfigId varchar not null, ConfigKey TEXT, ConfigValue TEXT, primary key (SystemConfigId));

drop table if exists public.UserInRole CASCADE;
CREATE TABLE public.UserInRole (Id TEXT not null, UserName TEXT not null, RoleName TEXT not null, ApplicationName TEXT not null, primary key (Id));

drop table if exists public.UserRole CASCADE;
CREATE TABLE public.UserRole (
	UserId	varchar NOT NULL,
	RoleId	varchar NOT NULL,
    PRIMARY KEY (UserId, RoleId)
,
    FOREIGN KEY (RoleId)
        REFERENCES Roles(RoleId),
    FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
);

drop table if exists public.UsersInRoles CASCADE;
CREATE TABLE public.UsersInRoles (UserId varchar not null, RoleId varchar not null, primary key (UserId, RoleId), constraint FK8BDD2B0B1DD243F3 foreign key (UserId) references Users);


