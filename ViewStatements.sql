CREATE OR REPLACE VIEW username AS
SELECT FirstName, LastName
FROM "User";

CREATE OR REPLACE VIEW user_groups AS
SELECT "Group".GroupName, "User".UserID, "Group".GroupID, "Group".GroupInviteCode
FROM "User"
INNER JOIN "GroupHasUser" ON "User".UserID = "GroupHasUser".UserID
INNER JOIN "Group" ON "Group".GroupID = "GroupHasUser".GroupID;

CREATE OR REPLACE VIEW user_individual_group_info AS
SELECT "Group".GroupID, "Group".GroupName, "Group".GroupDesc, "Group".GroupInviteCode, "Group".GroupColor, "Group".GroupImage, "Group".GroupAdmin, "GroupHasUser".UserNickname
FROM "Group"
INNER JOIN "GroupHasUser" ON "GroupHasUser".GroupID = "Group".GroupID
INNER JOIN "User" ON "GroupHasUser".UserID = "User".UserID;

CREATE OR REPLACE VIEW user_individual_group_events AS
SELECT "Event".EventID, "Event".EventName, "Event".EventDesc, "Event".EventDuration, "Event".EventStartTime, "Group".GroupID
FROM "Event"
INNER JOIN "Group" ON "Group".GroupID = "Event".GroupID;

CREATE OR REPLACE VIEW user_attends_events AS
SELECT "UserAttendsEvent".EventID, "User".UserID
FROM "UserAttendsEvent"
INNER JOIN "User" ON "User".UserID = "UserAttendsEvent".UserID;

CREATE OR REPLACE VIEW user_default_times AS
SELECT DefaultTimes, UserID
FROM "User";

CREATE OR REPLACE VIEW admin_views_user AS
SELECT FirstName, LastName, IsAdmin, UserID
FROM "User";

CREATE OR REPLACE VIEW admin_views_groups AS
SELECT GroupName, GroupID
FROM "Group";

CREATE OR REPLACE VIEW user_settings AS
SELECT FirstName, LastName, EmailAddress, UserID, DefaultTimes
FROM "User"

