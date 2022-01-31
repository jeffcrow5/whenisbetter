DELETE FROM "User" WHERE UserID = '1';

DELETE FROM "UserDefaultTimes" WHERE WeekDay = 'Sunday' AND Hour = '13' AND UserID = '1';

DELETE FROM "Group" WHERE GroupInviteCode = '123456781234';

DELETE FROM "GroupHasUser" WHERE UserID = '1' AND GroupID = '1';

DELETE FROM "GroupHasUserTimes" WHERE GroupHasUserID = '1';

DELETE FROM "Event" WHERE EventID = '1' AND GroupID = '1';

DELETE FROM "UserAttendsEvent" WHERE EventID = '1' AND UserID = '1';

DELETE FROM "UserPhoneNumber" WHERE UserID = '1' AND UserPhoneNumber = '8074251655';
