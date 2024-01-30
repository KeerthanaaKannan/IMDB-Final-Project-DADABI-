CREATE TABLE `BRIDGE_GENRE`  (
  `movie_genre_SK` int NOT NULL,
  `movie_SK` int NULL,
  `genre_SK` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`movie_genre_SK`)
);

CREATE TABLE `CAST_CREW_DETAILS`  (
  `cast_crew_SK` int NOT NULL,
  `person_SK` int NULL,
  `movie_SK` int NULL,
  `profession_SK` int NULL,
  `known_for` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`cast_crew_SK`)
);

CREATE TABLE `DIM_AKAS`  (
  `aka_SK` int NOT NULL,
  `movie_SK` int NOT NULL,
  `title_name` varchar(1500) NULL,
  `region_SK` int NOT NULL,
  `language_SK` int NOT NULL,
  `types` varchar(100) NULL,
  `attributes` varchar(100) NULL,
  `is_original_title` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`aka_SK`)
);

CREATE TABLE `DIM_GENRE_TYPES`  (
  `genre_SK` int NOT NULL,
  `genre` varchar(50) NOT NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`genre_SK`)
);

CREATE TABLE `DIM_LANGUAGE_TYPES`  (
  `language_SK` int NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `language` varchar(100) NOT NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`language_SK`)
);

CREATE TABLE `DIM_MOVIES`  (
  `movie_SK` int NOT NULL,
  `tconst` varchar(10) NOT NULL,
  `title_type` varchar(20) NOT NULL,
  `primary_title` varchar(1500) NOT NULL,
  `original_title` varchar(1500) NULL,
  `is_adult` int NULL,
  `start_year` int NULL,
  `end_year` int NULL,
  `runtime_minutes` int NULL,
  `DI_Created_Date` datetime NOT NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`movie_SK`)
);

CREATE TABLE `DIM_PERSON_NAMES`  (
  `person_SK` int NOT NULL,
  `nconst` varchar(10) NOT NULL,
  `primary_name` varchar(100) NOT NULL,
  `birth_year` int NULL,
  `death_year` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`person_SK`)
);

CREATE TABLE `DIM_PROFESSION_TYPES`  (
  `profession_SK` int NOT NULL,
  `profession` varchar(30) NOT NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`profession_SK`)
);

CREATE TABLE `DIM_REGION_TYPES`  (
  `region_SK` int NOT NULL,
  `region_code` varchar(5) NOT NULL,
  `region` varchar(50) NOT NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`region_SK`)
);

CREATE TABLE `FACT_BOX_OFFICE`  (
  `box_office_SK` int NOT NULL,
  `movie_SK` int NULL,
  `date` date NULL,
  `rank` int NULL,
  `gross` double NULL,
  `theatres` int NULL,
  `per_theatre` double NULL,
  `total_gross` double NULL,
  `days` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`box_office_SK`)
);

CREATE TABLE `FACT_RATINGS`  (
  `rating_SK` int NOT NULL,
  `movie_SK` int NULL,
  `average_rating` float NULL,
  `num_votes` int NULL,
  `DI_Created_Date` datetime NULL,
  `DI_Workflow_Filename` varchar(255) NULL,
  `DI_Workflow_Process_ID` varchar(255) NULL,
  PRIMARY KEY (`rating_SK`)
);

ALTER TABLE `BRIDGE_GENRE` ADD CONSTRAINT `FK_movie_genre_SK` FOREIGN KEY (`movie_SK`) REFERENCES `DIM_MOVIES` (`movie_SK`);
ALTER TABLE `BRIDGE_GENRE` ADD CONSTRAINT `FK_genre_SK` FOREIGN KEY (`genre_SK`) REFERENCES `DIM_GENRE_TYPES` (`genre_SK`);
ALTER TABLE `CAST_CREW_DETAILS` ADD CONSTRAINT `FK_person_SK` FOREIGN KEY (`person_SK`) REFERENCES `DIM_PERSON_NAMES` (`person_SK`);
ALTER TABLE `CAST_CREW_DETAILS` ADD CONSTRAINT `FK_movie_cast_SK` FOREIGN KEY (`movie_SK`) REFERENCES `DIM_MOVIES` (`movie_SK`);
ALTER TABLE `CAST_CREW_DETAILS` ADD CONSTRAINT `FK_profession_SK` FOREIGN KEY (`profession_SK`) REFERENCES `DIM_PROFESSION_TYPES` (`profession_SK`);
ALTER TABLE `DIM_AKAS` ADD CONSTRAINT `FK_movie_SK` FOREIGN KEY (`movie_SK`) REFERENCES `DIM_MOVIES` (`movie_SK`);
ALTER TABLE `DIM_AKAS` ADD CONSTRAINT `FK_region_SK` FOREIGN KEY (`region_SK`) REFERENCES `DIM_REGION_TYPES` (`region_SK`);
ALTER TABLE `DIM_AKAS` ADD CONSTRAINT `FK_language_SK` FOREIGN KEY (`language_SK`) REFERENCES `DIM_LANGUAGE_TYPES` (`language_SK`);
ALTER TABLE `FACT_BOX_OFFICE` ADD CONSTRAINT `FK_movie_box_office_SK` FOREIGN KEY (`movie_SK`) REFERENCES `DIM_MOVIES` (`movie_SK`);
ALTER TABLE `FACT_RATINGS` ADD CONSTRAINT `FK_movie_ratings_SK` FOREIGN KEY (`movie_SK`) REFERENCES `DIM_MOVIES` (`movie_SK`);

