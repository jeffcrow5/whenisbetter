CREATE TABLE Group
(
  GroupInviteCode INT NOT NULL,
  GroupName VARCHAR(255) NOT NULL,
  GroupDesc VARCHAR(255),
  GroupColor VARCHAR(255) NOT NULL,
  GroupImage VARCHAR(255),
  GroupAdmin INT NOT NULL,
  PRIMARY KEY (GroupInviteCode)
);

CREATE TABLE User
(
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  EmailAddress VARCHAR(255) NOT NULL,
  IsAdmin INT NOT NULL,
  UserPassword VARCHAR(255) NOT NULL,
  UserID INT NOT NULL,
  DefaultAvailableTimes  NOT NULL,
  PRIMARY KEY (UserID),
  UNIQUE (EmailAddress)
);

CREATE TABLE GroupHasUser
(
  UserNickname VARCHAR(255) NOT NULL,
  AvailableTimes  NOT NULL,
  UserID INT NOT NULL,
  GroupInviteCode INT NOT NULL,
  PRIMARY KEY (UserID, GroupInviteCode),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (GroupInviteCode) REFERENCES Group(GroupInviteCode)
);

CREATE TABLE User_PhoneNumber
(
  PhoneNumber VARCHAR NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (PhoneNumber, UserID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Event
(
  EventName VARCHAR(255) NOT NULL,
  EventDesc VARCHAR(255),
  EventDuration FLOAT NOT NULL,
  EventStartTime DATE NOT NULL,
  EventID INT NOT NULL,
  GroupInviteCode INT NOT NULL,
  PRIMARY KEY (EventID),
  FOREIGN KEY (GroupInviteCode) REFERENCES Group(GroupInviteCode)
);

CREATE TABLE UserAttendsEvent
(
  EventID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (EventID, UserID),
  FOREIGN KEY (EventID) REFERENCES Event(EventID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);
