CREATE OR REPLACE VIEW character_summary AS
SELECT "CHARACTER".charName, "RACE".raceName, "DNDCLASS".dndClassName, "CHARACTER".charLevel, "SKILL".skillName, "CHARACTER".background, "SPELL".spellName
FROM "CHARACTER"
INNER JOIN "RACE" ON "CHARACTER".raceID = "RACE".raceID
INNER JOIN "DNDCLASS" ON "CHARACTER".dndClassID = "DNDCLASS".dndClassID
INNER JOIN possesses ON "CHARACTER".charID = possesses.charID
INNER JOIN casts ON "DNDCLASS".dndClassID = casts.dndClassID
INNER JOIN "SKILL" ON possesses.skillID = "SKILL".skillID
INNER JOIN "SPELL" ON casts.spellID = "SPELL".spellID;

CREATE OR REPLACE VIEW character_groups AS
SELECT "PARTY".campaignName, "PARTY".partyName, "CHARACTER".charName
FROM "PARTY"
INNER JOIN "CHARACTER" ON "PARTY".partyID = "CHARACTER".partyID;

CREATE OR REPLACE VIEW ticket_patron AS
SELECT "PATRON".patronName, "PATRON".patronID, "PATRON".patronEmail, "TICKETS".dateCreated, "TICKETS".description, "TICKETS".status
FROM "TICKETS"
INNER JOIN "PATRON" ON "TICKETS".patronID = "PATRON".patronID;
