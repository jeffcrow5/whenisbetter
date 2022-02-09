CREATE OR REPLACE VIEW username AS
SELECT FirstName, LastName
FROM "User";

CREATE OR REPLACE VIEW user_groups AS
SELECT "Group".GroupName
FROM "User"
INNER JOIN "GroupHasUser" ON "User".UserID = "GroupHasUser".UserID
INNER JOIN "Group" ON "Group".GroupID = "GroupHasUser".GroupID;

CREATE OR REPLACE VIEW user_individual_group_info AS
SELECT "Group".GroupID, "Group".GroupName, "Group".GroupDesc, "Group".GroupInviteCode, "Group".GroupColor, "Group".GroupImage, "Group".GroupAdmin, "GroupHasUser".UserNickname
FROM "Group"
INNER JOIN "GroupHasUser" ON "GroupHasUser".GroupID = "Group".GroupID
INNER JOIN "User" ON "GroupHasUser".UserID = "User".UserID;

CREATE OR REPLACE VIEW user_individual_group_events AS
SELECT "Event".EventID, "Event".EventName, "Event".EventDesc, "Event".EventDuration, "Event".EventStartTime
FROM "Event"
INNER JOIN "Group" ON "Group".GroupID = "Event".GroupID;

CREATE OR REPLACE VIEW user_attends_events AS
SELECT "UserAttendsEvent".EventID
FROM "UserAttendsEvent"
INNER JOIN "User" ON "User".UserID = "UserAttendsEvent".UserID;

CREATE OR REPLACE VIEW user_join_group AS
SELECT "UserDefaultTimes".WeekDay, "UserDefaultTimes".Hour
FROM "UserDefaultTimes";

CREATE OR REPLACE VIEW admin_views_user AS
SELECT "User".FirstName, "User".LastName, "User".IsAdmin, "User".UserID
FROM "User";

CREATE OR REPLACE VIEW admin_views_groups AS
SELECT "Group".GroupName, "Group".GroupID
FROM "Group";

CREATE OR REPLACE VIEW user_settings AS
SELECT "User".FirstName, "User".LastName, "User".EmailAddress, "UserPhoneNumber".PhoneNumber, "UserDefaultTimes".Hour, "UserDefaultTimes".WeekDay
FROM "User"
INNER JOIN "UserPhoneNumber" ON "UserPhoneNumber".UserID = "User".UserID
INNER JOIN "UserDefaultTimes" ON "UserDefaultTimes".UserID = "User".UserID;
