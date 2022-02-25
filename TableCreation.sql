CREATE TABLE "Group"
(
  GroupInviteCode VARCHAR(12) NOT NULL,
  GroupName VARCHAR(255) NOT NULL,
  GroupDesc VARCHAR(255),
  GroupColor VARCHAR(255) NOT NULL,
  GroupImage VARCHAR(255),
  GroupAdmin INT NOT NULL,
  GroupID SERIAL NOT NULL,
  PRIMARY KEY (GroupID),
  UNIQUE (GroupInviteCode)
);

CREATE TABLE "User"
(
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  EmailAddress VARCHAR(255) NOT NULL,
  IsAdmin INT NOT NULL,
  UserPassword VARCHAR(255) NOT NULL,
  UserID SERIAL NOT NULL,
  PRIMARY KEY (UserID),
  UNIQUE (EmailAddress)
);

CREATE TABLE "UserDefaultTimes"
(
  WeekDay VARCHAR(255) NOT NULL,
  Hour INT NOT NULL,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES "User"(UserID) ON DELETE CASCADE
);


CREATE TABLE "GroupHasUser"
(
  UserNickname VARCHAR(255) NOT NULL,
  GroupHasUserID SERIAL NOT NULL,
  UserID INT NOT NULL,
  GroupID INT NOT NULL,
  PRIMARY KEY (GroupHasUserID),
  FOREIGN KEY (UserID) REFERENCES "User"(UserID) ON DELETE CASCADE,
  FOREIGN KEY (GroupID) REFERENCES "Group"(GroupID) ON DELETE CASCADE,
  UNIQUE (UserID, GroupID)
);

CREATE TABLE "GroupHasUserTimes"
(
  WeekDay VARCHAR(255) NOT NULL,
  Hour INT NOT NULL,
  GroupHasUserID INT NOT NULL,
  FOREIGN KEY (GroupHasUserID) REFERENCES "GroupHasUser"(GroupHasUserID) ON DELETE CASCADE
);

CREATE TABLE "UserPhoneNumber"
(
  PhoneNumber VARCHAR(255) NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (PhoneNumber, UserID),
  FOREIGN KEY (UserID) REFERENCES "User"(UserID) ON DELETE CASCADE
);

CREATE TABLE "Event"
(
  EventName VARCHAR(255) NOT NULL,
  EventDesc VARCHAR(255),
  EventDuration FLOAT NOT NULL,
  EventStartTime TIMESTAMP NOT NULL,
  EventID SERIAL NOT NULL,
  GroupID INT NOT NULL,
  PRIMARY KEY (EventID),
  FOREIGN KEY (GroupID) REFERENCES "Group"(GroupID) ON DELETE CASCADE
);

CREATE TABLE "UserAttendsEvent"
(
  EventID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (EventID, UserID),
  FOREIGN KEY (EventID) REFERENCES "Event"(EventID) ON DELETE CASCADE,
  FOREIGN KEY (UserID) REFERENCES "User"(UserID) ON DELETE CASCADE
);
