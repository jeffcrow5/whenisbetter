INSERT INTO "User" (FirstName, LastName, EmailAddress, IsAdmin, UserPassword, DefaultAvailableTimes)
VALUES ('Rick', 'Astley', 'nevergonnagive@you.up', '1', 'hashedPassword', '[11200, 41300, 51400]');


INSERT INTO "Group" (GroupInviteCode, GroupName, GroupDesc, GroupColor, GroupImage, GroupAdmin)
VALUES ('123456781234', 'Rick Rollers', 'Got em', '#FF0000', 'test.png', '1');

INSERT INTO "GroupHasUser" (UserID, GroupID, UserNickname, AvailableTimes)
VALUES ('1', '1', 'Rick Roll', '[41300, 51400]');

INSERT INTO "Event" (EventName, EventDesc, EventDuration, EventStartTime, GroupID)
VALUES ('Rick Roll Party', 'We're going to make sure everyone knows we aren\'t going to give them up or let them down', '2.0', '2022-01-30 13:00:00', '1');

INSERT INTO "UserAttendsEvent" (EventID, UserID)
VALUES ('1', '1');

INSERT INTO "User_PhoneNumber" (UserID, PhoneNumber)
VALUES ('1', '8074251655');
