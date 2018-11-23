#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "specialty";
CREATE TABLE "specialty" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" character varying NOT NULL,
    CONSTRAINT "PK_9cf4ae334dc4a1ab1e08956460e" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" character varying NOT NULL,
    "surname" character varying NOT NULL,
    "age" integer,
    "email" character varying NOT NULL,
    "avatar" character varying,
    "teamLeaderId" uuid,
    CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id"),
    CONSTRAINT "FK_5ef56597d118b705f48ae9c831e" FOREIGN KEY ("teamLeaderId") REFERENCES "user"(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "team";
CREATE TABLE "team" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" character varying NOT NULL,
    "teamLeaderId" uuid,
    CONSTRAINT "PK_f57d8293406df4af348402e4b74" PRIMARY KEY ("id"),
    CONSTRAINT "REL_751735d9d1ba28612ff36ab7a9" UNIQUE ("teamLeaderId"),
    CONSTRAINT "FK_751735d9d1ba28612ff36ab7a90" FOREIGN KEY ("teamLeaderId") REFERENCES "user"(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "user_specialties_specialty";
CREATE TABLE "user_specialties_specialty" (
    "userId" uuid NOT NULL,
    "specialtyId" uuid NOT NULL,
    CONSTRAINT "PK_94a6e4f154efff0965df1cdd001" PRIMARY KEY ("userId", "specialtyId"),
    CONSTRAINT "FK_e4abb372040316e9ac32a4134cb" FOREIGN KEY ("specialtyId") REFERENCES specialty(id) ON DELETE CASCADE NOT DEFERRABLE,
    CONSTRAINT "FK_e76b77a5f44b2a2f79ffc526f83" FOREIGN KEY ("userId") REFERENCES "user"(id) ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "specialty" ("name") VALUES
    ('Java'),
    ('Gradle'),
    ('Go'),
    ('Typescript'),
    ('Javascript'),
    ('CoffeeScript'),
    ('Jenkins'),
    ('AWS'),
    ('Angular'),
    ('React'),
    ('VueJS'),
    ('SpringBoot'),
    ('Eureka'),
    ('Microservices'),
    ('NodeJS');

INSERT INTO "team" ("name") VALUES
    ('Frontend'),
    ('Backend');

INSERT INTO "user" ("name", "surname", "age", "email", "avatar") VALUES
    ('Vallie', 'Watsica', 50, 'Chelsey.Altenwerth98@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Theodore', 'Schaden', 52, 'Donnell.Tremblay2@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Liana', 'Wisozk', 54, 'Wilford.Pfannerstill@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Meta', 'Renner', 18, 'Cleora.Wintheiser1@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Bernita', 'Cremin', 22, 'Skylar0@gmail.com', 'http://lorempixel.com/100/100'),
    ('Bradley', 'DuBuque', 18, 'Beth_Osinski@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Johnson', 'McLaughlin', 40, 'Beaulah_Kassulke@gmail.com', 'http://lorempixel.com/100/100'),
    ('Isabella', 'VonRueden', 35, 'Ryleigh.Turner@gmail.com', 'http://lorempixel.com/100/100'),
    ('Sigrid', 'Zemlak', 18, 'Jerrod80@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Katheryn', 'Wuckert', 18, 'Adriel66@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Liliane', 'Ondricka', 32, 'Tierra_Donnelly70@gmail.com', 'http://lorempixel.com/100/100'),
    ('Raphael', 'Kris', 18, 'Jamarcus.Murazik56@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Bennie', 'Schaden', 25, 'Sage80@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Lacy', 'Mosciski', 44, 'Faustino_Bashirian38@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Destiny', 'Morissette', 53, 'Abe_Haag@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Paxton', 'Hilll', 35, 'Willie_Conn@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Samara', 'Haley', 29, 'Alexandro_Daugherty@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Freddie', 'Dickens', 18, 'Axel47@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Mozell', 'Ondricka', 23, 'Lavada_Kohler59@gmail.com', 'http://lorempixel.com/100/100'),
    ('Else', 'Zemlak', 18, 'David.Harber95@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Ernesto', 'Bartoletti', 53, 'Haley_Mills78@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Clifton', 'Hilll', 50, 'Emil.Heaney@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Ursula', 'Rodriguez', 24, 'Samson.Marvin35@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Damien', 'Rau', 18, 'Elouise6@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Rosalinda', 'Pouros', 18, 'Demarcus31@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Otis', 'Smitham', 18, 'Leanne.Wiza@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Daren', 'McLaughlin', 23, 'Alison_Nicolas14@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Lillie', 'Paucek', 24, 'Leonora_Cremin@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Forrest', 'Carroll', 21, 'Kelton_Veum42@yahoo.com', 'http://lorempixel.com/100/100'),
    ('Emelie', 'Frami', 46, 'Fanny.Yundt19@gmail.com', 'http://lorempixel.com/100/100'),
    ('Elyssa', 'Luettgen', 47, 'Abigail99@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Cali', 'Von', 36, 'Mia80@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Elinore', 'Conn', 37, 'Bernice70@hotmail.com', 'http://lorempixel.com/100/100'),
    ('Halle', 'Runte', 37, 'Stevie_Rosenbaum18@hotmail.com', 'http://lorempixel.com/100/100');

UPDATE "team"
    SET "teamLeaderId" = (SELECT "id" FROM "user" WHERE "name"='Freddie' LIMIT 1)
    WHERE "name"='Backend';

UPDATE "team"
    SET "teamLeaderId" = (SELECT "id" FROM "user" WHERE "name"='Elyssa' LIMIT 1)
    WHERE "name"='Frontend';


UPDATE "user"
    SET "teamLeaderId" = (SELECT "id" FROM "user" WHERE "name"='Elyssa' LIMIT 1)
    WHERE "id" NOT IN (SELECT "teamLeaderId" FROM "team") AND "id" IN (SELECT "id" FROM "user" LIMIT 17);

UPDATE "user"
    SET "teamLeaderId" = (SELECT "id" FROM "user" WHERE "name"='Freddie' LIMIT 1)
    WHERE "id" NOT IN (SELECT "teamLeaderId" FROM "team") AND "teamLeaderId" IS NULL;


INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20;

INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20 OFFSET 40;

INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20 OFFSET 70;

INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20 OFFSET 120;

INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20 OFFSET 250;

INSERT INTO "user_specialties_specialty" ("userId", "specialtyId")
    SELECT u.id AS "userId", s.id AS "specialtyId"
    FROM "user" u, "specialty" s
    LIMIT 20 OFFSET 400;

EOSQL


