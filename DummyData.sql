INSERT INTO "PATRON" (patronName, patronPassword, patronDateCreated, isAdmin, patronEmail)
VALUES ('Kevin', 'testing', '1/30/2021', '1', 'Kevinsucks@gmail.com');


INSERT INTO "DNDCLASS" (deity, hitDie, dndClassName, subClass, savingThrow, primaryAttribute, equipmentProf, dndClassDescription)
VALUES ('God', '10', 'Paladin', 'Redemption', 'Con, Wis', 'Charisma', 'Heavy Armor, Smithing Tools', 'Awesome');

INSERT INTO "RACE" (history, size, speed, raceName)
VALUES ('They are old', 'Medium', '30', 'Elf');

INSERT INTO "PHYSICALITY" (height, hairColor, weight, age, skinColor)
VALUES ('5.7', 'Pink', '406', '1', 'Purple');

INSERT INTO "CHARACTER" (charName, charLevel, feat, strength, intelligence, charisma, constitution, wisdom, dexterity, hitPoints, flaw, bond, ideal, background, patronID, dndClassID, raceID, physicalityID)
VALUES ('Kevin Cha', '22', 'diety', '18', '17', '16', '15', '14', '13', '420', 'He is a big dummy at everything', 'He likes glue - glue eater', 'Yes he is ideal', 'He likes other idiots', '1', '1', '1', '1');
