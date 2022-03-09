INSERT INTO "User" (FirstName, LastName, EmailAddress, IsAdmin, UserPassword, DefaultTimes)
VALUES ('Rick', 'Astley', 'nevergonnagive@you.up', '1', 'hashedPassword', '{weekday:Sunday,hour:13}');

INSERT INTO "Group" (GroupInviteCode, GroupName, GroupDesc, GroupImage, GroupAdmin)
VALUES ('123456781234', 'Rick Rollers', 'Got em', 'test.png', '1');

INSERT INTO "GroupHasUser" (UserID, GroupID, GroupTimes)
VALUES ('1', '1', '{weekday:Sunday,hour:13}');

INSERT INTO "Event" (EventName, EventDesc, EventDuration, EventStartTime, GroupID)
VALUES ('Rick Roll Party', E'We\'re going to make sure everyone knows we aren\'t going to give them up or let them down', '2.0', '2022-01-30 13:00:00-07', '1');

INSERT INTO "UserAttendsEvent" (EventID, UserID)
VALUES ('1', '1');

INSERT INTO "UserPhoneNumber" (UserID, PhoneNumber)
VALUES ('1', '8074251655');
