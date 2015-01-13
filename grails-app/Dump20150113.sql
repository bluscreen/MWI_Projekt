CREATE DATABASE  IF NOT EXISTS `wikidata_a` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wikidata_a`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wikidata_a
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities_alias`
--

DROP TABLE IF EXISTS `cities_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_alias`
--

LOCK TABLES `cities_alias` WRITE;
/*!40000 ALTER TABLE `cities_alias` DISABLE KEYS */;
INSERT INTO `cities_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q1040','DE',0,'Carlsruhe'),('Q1726','DE',0,'Minga'),('Q1794','DE',0,'Frankfurt'),('Q1794','DE',1,'Frankfurt/Main'),('Q1794','DE',2,'FFM'),('Q1794','DE',3,'Frankfurt (Main)'),('Q1794','DE',4,'Mainhattan'),('Q64','DE',0,'Stadt Berlin'),('Q64','DE',1,'Berlin, Deutschland'),('Q64','DE',2,'Bundeshauptstadt Berlin'),('Q64','DE',3,'Land Berlin'),('Q64','DE',4,'DE-BE');
/*!40000 ALTER TABLE `cities_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_claim`
--

DROP TABLE IF EXISTS `cities_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_claim`
--

LOCK TABLES `cities_claim` WRITE;
/*!40000 ALTER TABLE `cities_claim` DISABLE KEYS */;
INSERT INTO `cities_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1040','P131',1,'Regierungsbezirk Karlsruhe'),('Q1040','P17',0,'Q183'),('Q1720','P131',1,'Rheinland-Pfalz'),('Q1720','P17',0,'Deutschland'),('Q1726','P131',1,'Oberbayern'),('Q1726','P17',0,'Deutschland'),('Q1794','P131',1,'Hessen'),('Q1794','P131',2,'Regierungsbezirk Darmstadt'),('Q1794','P17',0,'Deutschland'),('Q24879','P131',1,'Freie Hansestadt Bremen'),('Q24879','P17',0,'Deutschland'),('Q2973','P131',1,'Regierungsbezirk Darmstadt'),('Q2973','P131',2,'Hessen'),('Q2973','P17',0,'Q183'),('Q365','P131',1,'Regierungsbezirk Köln'),('Q365','P17',0,'Q183'),('Q64','P131',1,'Deutschland'),('Q64','P17',0,'Deutschland');
/*!40000 ALTER TABLE `cities_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_desc`
--

DROP TABLE IF EXISTS `cities_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_desc`
--

LOCK TABLES `cities_desc` WRITE;
/*!40000 ALTER TABLE `cities_desc` DISABLE KEYS */;
INSERT INTO `cities_desc` (`item_id`, `language`, `description`) VALUES ('Q1040','DE','Großstadt in Deutschland'),('Q1720','DE','Landeshauptstadt von Rheinland-Pfalz'),('Q1726','DE','Hauptstadt von Bayern, Deutschland'),('Q1794','DE','Großstadt in Hessen'),('Q24879','DE','Stadt in Norddeutschland'),('Q2973','DE','Großstadt in Hessen'),('Q365','DE','Großstadt in Nordrhein-Westfalen'),('Q64','DE','Hauptstadt von Deutschland und ein Land in Deutschland');
/*!40000 ALTER TABLE `cities_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_label`
--

DROP TABLE IF EXISTS `cities_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_label`
--

LOCK TABLES `cities_label` WRITE;
/*!40000 ALTER TABLE `cities_label` DISABLE KEYS */;
INSERT INTO `cities_label` (`item_id`, `language`, `label`) VALUES ('Q1040','DE','Karlsruhe'),('Q1720','DE','Mainz'),('Q1726','DE','München'),('Q1794','DE','Frankfurt'),('Q24879','DE','Bremen'),('Q2973','DE','Darmstadt'),('Q365','DE','Köln'),('Q64','DE','Berlin');
/*!40000 ALTER TABLE `cities_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_link`
--

DROP TABLE IF EXISTS `cities_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_link`
--

LOCK TABLES `cities_link` WRITE;
/*!40000 ALTER TABLE `cities_link` DISABLE KEYS */;
INSERT INTO `cities_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1040','DE','dewiki','https://de.wikipedia.org/wiki/Karlsruhe'),('Q1040','EN','enwiki','https://en.wikipedia.org/wiki/Karlsruhe'),('Q1720','DE','dewiki','https://de.wikipedia.org/wiki/Mainz'),('Q1720','EN','enwiki','https://en.wikipedia.org/wiki/Mainz'),('Q1726','DE','dewiki','https://de.wikipedia.org/wiki/München'),('Q1726','EN','enwiki','https://en.wikipedia.org/wiki/Munich'),('Q1794','DE','dewiki','https://de.wikipedia.org/wiki/Frankfurt_am_Main'),('Q1794','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt'),('Q24879','DE','dewiki','https://de.wikipedia.org/wiki/Bremen'),('Q24879','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt'),('Q2973','DE','dewiki','https://de.wikipedia.org/wiki/Darmstadt'),('Q2973','EN','enwiki','https://en.wikipedia.org/wiki/Darmstadt'),('Q365','DE','dewiki','https://de.wikipedia.org/wiki/Köln'),('Q365','EN','enwiki','https://en.wikipedia.org/wiki/Cologne'),('Q64','DE','dewiki','https://de.wikipedia.org/wiki/Berlin'),('Q64','EN','enwiki','https://en.wikipedia.org/wiki/Berlin');
/*!40000 ALTER TABLE `cities_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_alias`
--

DROP TABLE IF EXISTS `educationinstitutes_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_alias`
--

LOCK TABLES `educationinstitutes_alias` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_alias` DISABLE KEYS */;
INSERT INTO `educationinstitutes_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q1262599','DE',0,'BA Karlsruhe'),('Q1262599','DE',1,'Berufsakademie Karlsruhe'),('Q1262599','DE',2,'DHBW Karlsruhe'),('Q1444899','DE',0,'Frankfurt School of Finance and Management'),('Q1622092','DE',0,'HS Bremen'),('Q1622099','DE',0,'Europa Fachhochschule Fresenius'),('Q219563','DE',0,'Universität von Washington'),('Q219563','EN',0,'UW'),('Q219563','EN',1,'UDub'),('Q219563','FR',0,'Universite de Washington'),('Q219563','FR',1,'University of Washington'),('Q284992','DE',0,'h_da'),('Q459724','DE',0,'FH Mainz'),('Q464443','DE',0,'HWR Berlin'),('Q464443','DE',1,'Berlin School Of Economics And Law'),('Q464443','DE',2,'Berufsakademie Berlin'),('Q464443','DE',3,'FHW Berlin'),('Q464443','DE',4,'Fachhochschule für Wirtschaft Berlin'),('Q464443','DE',5,'BA Berlin'),('Q464443','DE',6,'Berlin School Of Economics'),('Q464443','DE',7,'Fachhochschule für Wirtschaft'),('Q881849','DE',0,'Hochschule für Philosophie'),('Q881849','DE',1,'Berchmanskolleg'),('Q881849','DE',2,'HfPh');
/*!40000 ALTER TABLE `educationinstitutes_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_claim`
--

DROP TABLE IF EXISTS `educationinstitutes_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_claim`
--

LOCK TABLES `educationinstitutes_claim` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_claim` DISABLE KEYS */;
INSERT INTO `educationinstitutes_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1262599','P131',2,'Baden-WÃ¼rttemberg'),('Q1262599','P17',0,'Deutschland'),('Q1262599','P31',1,'Q183'),('Q1262599','P625',3,'49.026111, 8.3855'),('Q1444899','P131',2,'Hessen'),('Q1444899','P17',0,'Deutschland'),('Q1444899','P31',1,'Hochschule'),('Q1444899','P625',3,'50.109611, 8.697389'),('Q1622092','P131',2,'Bremen'),('Q1622092','P17',0,'Deutschland'),('Q1622092','P31',1,'Hochschule'),('Q1622092','P625',3,'53.108611, 8.853611'),('Q1622099','P131',2,'Hessen'),('Q1622099','P17',0,'Deutschland'),('Q1622099','P31',1,'Hochschule'),('Q1622099','P625',3,'50.221306, 8.267111'),('Q219563','P17',0,'United States of America'),('Q219563','P31',2,'public university'),('Q219563','P31',3,'Q30'),('Q219563','P571',1,'Q7693'),('Q219563','P625',4,'12.345, 9.876'),('Q284992','P131',3,'Darmstadt'),('Q284992','P17',0,'Q183'),('Q284992','P31',1,'Hochschule'),('Q284992','P31',2,'Fachhochschule'),('Q284992','P625',4,'49.866389, 8.633333'),('Q459724','P131',2,'Mainz'),('Q459724','P17',0,'Deutschland'),('Q459724','P281',3,'Q54321'),('Q459724','P31',1,'Hochschule'),('Q459724','P625',3,'49.996694, 8.278889'),('Q464443','P131',2,'Berlin'),('Q464443','P17',0,'Deutschland'),('Q464443','P31',1,'Hochschule'),('Q464443','P625',3,'52.485258, 13.337772'),('Q464443','P669',3,'Q314207'),('Q464443','P969',0,'Q654321'),('Q881849','P17',0,'Deutschland'),('Q881849','P31',1,'Q183'),('Q881849','P625',2,'48.148919, 11.583289');
/*!40000 ALTER TABLE `educationinstitutes_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_desc`
--

DROP TABLE IF EXISTS `educationinstitutes_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_desc`
--

LOCK TABLES `educationinstitutes_desc` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_desc` DISABLE KEYS */;
INSERT INTO `educationinstitutes_desc` (`item_id`, `language`, `description`) VALUES ('Q1262599','DE',''),('Q1444899','DE',''),('Q1622092','DE','staatliche Hochschule in Bremen, Deutschland'),('Q1622099','DE',''),('Q219563','DE','Universität in den Vereinigten Staaten'),('Q219563','EN','public research university in Seattle, Washington'),('Q219563','FR','université américaine'),('Q284992','DE',''),('Q459724','DE',''),('Q464443','DE','staatliche Hochschule in Berlin, Deutschland'),('Q881849','DE','');
/*!40000 ALTER TABLE `educationinstitutes_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_label`
--

DROP TABLE IF EXISTS `educationinstitutes_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_label`
--

LOCK TABLES `educationinstitutes_label` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_label` DISABLE KEYS */;
INSERT INTO `educationinstitutes_label` (`item_id`, `language`, `label`) VALUES ('Q1262599','DE','Duale Hochschule Baden-Württemberg Karlsruhe'),('Q1444899','DE','Frankfurt School of Finance & Management'),('Q1622092','DE','Hochschule Bremen'),('Q1622099','DE','Hochschule Fresenius'),('Q219563','DE','University of Washington'),('Q219563','EN','University of Washington'),('Q219563','FR','Université de Washington'),('Q284992','DE','Hochschule Darmstadt'),('Q459724','DE','Fachhochschule Mainz'),('Q464443','DE','Hochschule für Wirtschaft und Recht Berlin'),('Q881849','DE','Hochschule für Philosophie München');
/*!40000 ALTER TABLE `educationinstitutes_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_link`
--

DROP TABLE IF EXISTS `educationinstitutes_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_link`
--

LOCK TABLES `educationinstitutes_link` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_link` DISABLE KEYS */;
INSERT INTO `educationinstitutes_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1262599','DE','dewiki','https://de.wikipedia.org/wiki/Duale_Hochschule_Baden-Württemberg_Karlsruhe'),('Q1444899','DE','dewiki','https://de.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management'),('Q1444899','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management'),('Q1622092','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Bremen'),('Q1622092','EN','enwiki','https://en.wikipedia.org/wiki/Bremen_University_of_Applied_Sciences'),('Q1622099','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Fresenius'),('Q219563','DE','dewiki','http://de.wikipedia.org/wiki/University_of_Washington'),('Q219563','EN','enwiki','http://en.wikipedia.org/wiki/University_of_Washington'),('Q219563','FR','frwiki','http://fr.wikipedia.org/wiki/Universit%C3%A9_de_Washington'),('Q219563','IT','itwiki','http://it.wikipedia.org/wiki/Universit%C3%A0_di_Washington'),('Q219563','PT','ptwiki','http://pt.wikipedia.org/wiki/Universidade_de_Washington'),('Q284992','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Darmstadt'),('Q284992','EN','enwiki','https://en.wikipedia.org/wiki/Darmstadt_University_of_Applied_Sciences'),('Q459724','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Mainz'),('Q459724','EN','enwiki','https://en.wikipedia.org/wiki/University_of_Applied_Sciences,_Mainz'),('Q464443','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_für_Wirtschaft_und_Recht_Berlin'),('Q464443','EN','enwiki','https://en.wikipedia.org/wiki/Berlin_School_of_Economics_and_Law'),('Q881849','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_für_Philosophie_München'),('Q881849','EN','enwiki','https://en.wikipedia.org/wiki/Munich_School_of_Philosophy');
/*!40000 ALTER TABLE `educationinstitutes_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_mview`
--

DROP TABLE IF EXISTS `educationinstitutes_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_mview` (
  `id` varchar(15) NOT NULL,
  `name` mediumtext,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` longtext,
  `state` mediumtext,
  `zip_code` mediumtext,
  `phone` mediumtext,
  `email` mediumtext,
  `year_of_foundation` mediumtext,
  `street_and_house_number` mediumtext,
  `city` mediumtext,
  `education_institute_description` mediumtext,
  `wikipedia_hyperlink` mediumtext,
  `language` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_mview`
--

LOCK TABLES `educationinstitutes_mview` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_mview` DISABLE KEYS */;
INSERT INTO `educationinstitutes_mview` (`id`, `name`, `longitude`, `latitude`, `state`, `zip_code`, `phone`, `email`, `year_of_foundation`, `street_and_house_number`, `city`, `education_institute_description`, `wikipedia_hyperlink`, `language`) VALUES ('Q1262599','Duale Hochschule Baden-Württemberg Karlsruhe','8.3855','49.026111','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Duale_Hochschule_Baden-Württemberg_Karlsruhe','DE'),('Q1444899','Frankfurt School of Finance & Management','8.697389','50.109611','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management','DE'),('Q1622092','Hochschule Bremen','8.853611','53.108611','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'staatliche Hochschule in Bremen, Deutschland','https://de.wikipedia.org/wiki/Hochschule_Bremen','DE'),('Q1622099','Hochschule Fresenius','8.267111','50.221306','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Fresenius','DE'),('Q219563','University of Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'Universität in den Vereinigten Staaten','http://de.wikipedia.org/wiki/University_of_Washington','DE'),('Q219563','University of Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'public research university in Seattle, Washington','http://en.wikipedia.org/wiki/University_of_Washington','EN'),('Q219563','Université de Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'université américaine','http://fr.wikipedia.org/wiki/Universit%C3%A9_de_Washington','FR'),('Q284992','Hochschule Darmstadt','8.633333','49.866389','Q183',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Darmstadt','DE'),('Q459724','Fachhochschule Mainz','8.278889','49.996694','Deutschland','Q54321',NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Mainz','DE'),('Q464443','Hochschule für Wirtschaft und Recht Berlin','13.337772','52.485258','Deutschland',NULL,NULL,NULL,NULL,'Q654321',NULL,'staatliche Hochschule in Berlin, Deutschland','https://de.wikipedia.org/wiki/Hochschule_für_Wirtschaft_und_Recht_Berlin','DE'),('Q881849','Hochschule für Philosophie München','11.583289','48.148919','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_für_Philosophie_München','DE');
/*!40000 ALTER TABLE `educationinstitutes_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gui_texts`
--

DROP TABLE IF EXISTS `gui_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gui_texts` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gui_texts`
--

LOCK TABLES `gui_texts` WRITE;
/*!40000 ALTER TABLE `gui_texts` DISABLE KEYS */;
INSERT INTO `gui_texts` (`item_id`, `language`, `label`, `description`) VALUES ('P106','DE','Tätigkeit','Beruf oder andere Tätigkeit einer Person (ergänzt durch \"Arbeitsgebiet\": Property:P101)'),('P106','EN','occupation','occupation of a person; see also \"field of work\" (Property:P101)'),('P106','FR','profession','métier ou occupation d`une personne, voir aussi \"domaine d`activité\" (Property:P101)'),('P1329','DE','Telefonnummer ',''),('P1329','EN','phone number','property for phone number with String datatype until the URL datatype will support phone numbers'),('P17','DE','Staat','souveräner Staat, in dem sich das Objekt befindet'),('P17','EN','country','sovereign state of this item'),('P17','FR','pays','état souverain de cet élément'),('P571','DE','Gründungs-/Erstellungsdatum','Datum, an dem eine Organisation/ein Objekt gegründet/erstellt wurde'),('P571','EN','inception','date or point in time when the organization/object was founded/created'),('P968','DE','E-Mail','E-Mail-Addresse'),('P968','EN',' e-mail ','e-mail address'),('Q215627','DE','Person',''),('Q215627','EN','person',''),('Q2385804','DE','Bildungsinstitution',''),('Q2385804','EN','educational institution',''),('Q319608','DE','Postanschrift',''),('Q319608','EN','address',''),('Q508719','DE','Alumni',''),('Q508719','EN','alumnus',''),('Q515','DE','Stadt ',''),('Q515','EN','city',''),('Q82799','DE','Name',''),('Q82799','EN','name','');
/*!40000 ALTER TABLE `gui_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iso_languages`
--

DROP TABLE IF EXISTS `iso_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iso_languages` (
  `language` varchar(2) NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Labels of languages following ISO 639-1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iso_languages`
--

LOCK TABLES `iso_languages` WRITE;
/*!40000 ALTER TABLE `iso_languages` DISABLE KEYS */;
INSERT INTO `iso_languages` (`language`, `text`) VALUES ('aa','Afar'),('ab','Abkhazian'),('ae','Avestan'),('af','Afrikaans'),('ak','Akan'),('am','Amharic'),('an','Aragonese'),('ar','Arabic'),('as','Assamese'),('av','Avaric'),('ay','Aymara'),('az','Azerbaijani'),('ba','Bashkir'),('be','Belarusian'),('bg','Bulgarian'),('bh','Bihari languages'),('bi','Bislama'),('bm','Bambara'),('bn','Bengali'),('bo','Tibetan'),('br','Breton'),('bs','Bosnian'),('ca','Catalan; Valencian'),('ce','Chechen'),('ch','Chamorro'),('co','Corsican'),('cr','Cree'),('cs','Czech'),('cu','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),('cv','Chuvash'),('cy','Welsh'),('da','Danish'),('de','German'),('dv','Divehi; Dhivehi; Maldivian'),('dz','Dzongkha'),('ee','Ewe'),('el','Greek, Modern (1453-)'),('en','English'),('eo','Esperanto'),('es','Spanish; Castilian'),('et','Estonian'),('eu','Basque'),('fa','Persian'),('ff','Fulah'),('fi','Finnish'),('fj','Fijian'),('fo','Faroese'),('fr','French'),('fy','Western Frisian'),('ga','Irish'),('gd','Gaelic; Scottish Gaelic'),('gl','Galician'),('gn','Guarani'),('gu','Gujarati'),('gv','Manx'),('ha','Hausa'),('he','Hebrew'),('hi','Hindi'),('ho','Hiri Motu'),('hr','Croatian'),('ht','Haitian; Haitian Creole'),('hu','Hungarian'),('hy','Armenian'),('hz','Herero'),('ia','Interlingua (International Auxiliary Language Association)'),('id','Indonesian'),('ie','Interlingue; Occidental'),('ig','Igbo'),('ii','Sichuan Yi; Nuosu'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('ka','Georgian'),('kg','Kongo'),('ki','Kikuyu; Gikuyu'),('kj','Kuanyama; Kwanyama'),('kk','Kazakh'),('kl','Kalaallisut; Greenlandic'),('km','Central Khmer'),('kn','Kannada'),('ko','Korean'),('kr','Kanuri'),('ks','Kashmiri'),('ku','Kurdish'),('kv','Komi'),('kw','Cornish'),('ky','Kirghiz; Kyrgyz'),('la','Latin'),('lb','Luxembourgish; Letzeburgesch'),('lg','Ganda'),('li','Limburgan; Limburger; Limburgish'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('mg','Malagasy'),('mh','Marshallese'),('mi','Maori'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mr','Marathi'),('ms','Malay'),('mt','Maltese'),('my','Burmese'),('na','Nauru'),('nb','Bokmål, Norwegian; Norwegian Bokmål'),('nd','Ndebele, North; North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nl','Dutch; Flemish'),('nn','Norwegian Nynorsk; Nynorsk, Norwegian'),('no','Norwegian'),('nr','Ndebele, South; South Ndebele'),('nv','Navajo; Navaho'),('ny','Chichewa; Chewa; Nyanja'),('oc','Occitan (post 1500)'),('oj','Ojibwa'),('om','Oromo'),('or','Oriya'),('os','Ossetian; Ossetic'),('pa','Panjabi; Punjabi'),('pi','Pali'),('pl','Polish'),('ps','Pushto; Pashto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Rundi'),('ro','Romanian; Moldavian; Moldovan'),('ru','Russian'),('rw','Kinyarwanda'),('sa','Sanskrit'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sg','Sango'),('si','Sinhala; Sinhalese'),('sk','Slovak'),('sl','Slovenian'),('sm','Samoan'),('sn','Shona'),('so','Somali'),('sq','Albanian'),('sr','Serbian'),('ss','Swati'),('st','Sotho, Southern'),('su','Sundanese'),('sv','Swedish'),('sw','Swahili'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uighur; Uyghur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','Volapük'),('wa','Walloon'),('wo','Wolof'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang; Chuang'),('zh','Chinese'),('zu','Zulu');
/*!40000 ALTER TABLE `iso_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_alias`
--

DROP TABLE IF EXISTS `jobs_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_alias`
--

LOCK TABLES `jobs_alias` WRITE;
/*!40000 ALTER TABLE `jobs_alias` DISABLE KEYS */;
INSERT INTO `jobs_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q10798782','DE',0,'Schauspieler im Fernsehen'),('Q10798782','EN',0,'TV actor'),('Q10798782','EN',1,'actor'),('Q15839136','DE',0,'Zytologe'),('Q15839136','DE',1,'Zellbiologe'),('Q1622272','DE',0,'Hochschullehrer'),('Q42973','DE',0,'Hochbau-Ingenieur'),('Q42973','DE',1,'Architekt im Praktikum'),('Q42973','DE',2,'Architektin'),('Q82955','DE',0,'Lokalpolitiker'),('Q82955','DE',1,'Berufspolitiker'),('Q82955','DE',2,'Politikerin'),('Q947873','EN',0,'host'),('Q947873','EN',1,'hostess'),('Q947873','EN',2,'TV host'),('Q947873','EN',3,'television host'),('Q947873','EN',4,'TV presenter');
/*!40000 ALTER TABLE `jobs_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_claim`
--

DROP TABLE IF EXISTS `jobs_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_claim`
--

LOCK TABLES `jobs_claim` WRITE;
/*!40000 ALTER TABLE `jobs_claim` DISABLE KEYS */;
INSERT INTO `jobs_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q15839136','',0,''),('Q1622272','',0,''),('Q2462658','',0,''),('Q2919046','',0,''),('Q42973','',0,''),('Q82955','',0,''),('Q947873','',0,'');
/*!40000 ALTER TABLE `jobs_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_desc`
--

DROP TABLE IF EXISTS `jobs_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_desc`
--

LOCK TABLES `jobs_desc` WRITE;
/*!40000 ALTER TABLE `jobs_desc` DISABLE KEYS */;
INSERT INTO `jobs_desc` (`item_id`, `language`, `description`) VALUES ('Q10798782','EN','actor who performs on television'),('Q2462658','DE','Person im Anstellungsverhältnis, welche Managementaufgaben in einer Organisation wahrnimmt'),('Q2919046','DE','Naturwissenschaftler, der sich mit Themen aus der Biochemie befasst'),('Q42973','DE','Beruf'),('Q82955','DE','Person, die ein politisches Amt oder ein politisches Mandat innehat'),('Q947873','DE','Medienberuf'),('Q947873','EN','person who introduces or hosts television programs');
/*!40000 ALTER TABLE `jobs_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_label`
--

DROP TABLE IF EXISTS `jobs_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_label`
--

LOCK TABLES `jobs_label` WRITE;
/*!40000 ALTER TABLE `jobs_label` DISABLE KEYS */;
INSERT INTO `jobs_label` (`item_id`, `language`, `label`) VALUES ('Q10798782','DE','Fernsehschauspieler'),('Q10798782','EN','television actor'),('Q15839136','DE','Zellbiologe'),('Q1622272','DE','Hochschuldozent'),('Q2462658','DE','Manager'),('Q2919046','DE','Biochemiker'),('Q42973','DE','Architekt'),('Q82955','DE','Politiker'),('Q947873','DE','Fernsehmoderator'),('Q947873','EN','television presenter');
/*!40000 ALTER TABLE `jobs_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_link`
--

DROP TABLE IF EXISTS `jobs_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_link`
--

LOCK TABLES `jobs_link` WRITE;
/*!40000 ALTER TABLE `jobs_link` DISABLE KEYS */;
INSERT INTO `jobs_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q10798782','EN','enwiki','en.wikipedia.org/wiki/Television_actor'),('Q15839136','DE','dewiki','http://de.wikipedia.org/wiki/Zellbiologie'),('Q1622272','DE','dewiki','https://de.wikipedia.org/wiki/Hochschullehrer'),('Q2462658','DE','dewiki','https://de.wikipedia.org/wiki/Manager_(Wirtschaft)'),('Q2919046','EN','enwiki','https://en.wikipedia.org/wiki/Biochemist'),('Q42973','DE','dewiki','https://de.wikipedia.org/wiki/Architekt'),('Q82955','DE','dewiki','https://de.wikipedia.org/wiki/Politiker'),('Q947873','EN','enwiki','https://en.wikipedia.org/wiki/Television_presenter');
/*!40000 ALTER TABLE `jobs_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language` varchar(15) NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`language`, `text`) VALUES ('aa','Afar'),('ab','Abkhazian'),('abc',NULL),('ae','Avestan'),('af','Afrikaans'),('ak','Akan'),('am','Amharic'),('an','Aragonese'),('ar','Arabic'),('as','Assamese'),('av','Avaric'),('ay','Aymara'),('az','Azerbaijani'),('ba','Bashkir'),('be','Belarusian'),('bg','Bulgarian'),('bh','Bihari languages'),('bi','Bislama'),('bm','Bambara'),('bn','Bengali'),('bo','Tibetan'),('br','Breton'),('bs','Bosnian'),('ca','Catalan; Valencian'),('ce','Chechen'),('ch','Chamorro'),('co','Corsican'),('cr','Cree'),('cs','Czech'),('cu','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),('cv','Chuvash'),('cy','Welsh'),('da','Danish'),('de','German'),('def',NULL),('dv','Divehi; Dhivehi; Maldivian'),('dz','Dzongkha'),('ee','Ewe'),('el','Greek, Modern (1453-)'),('en','English'),('eo','Esperanto'),('es','Spanish; Castilian'),('et','Estonian'),('eu','Basque'),('fa','Persian'),('ff','Fulah'),('fi','Finnish'),('fj','Fijian'),('fo','Faroese'),('fr','French'),('fy','Western Frisian'),('ga','Irish'),('gd','Gaelic; Scottish Gaelic'),('ghi',NULL),('gl','Galician'),('gn','Guarani'),('gu','Gujarati'),('gv','Manx'),('ha','Hausa'),('he','Hebrew'),('hi','Hindi'),('ho','Hiri Motu'),('hr','Croatian'),('ht','Haitian; Haitian Creole'),('hu','Hungarian'),('hy','Armenian'),('hz','Herero'),('ia','Interlingua (International Auxiliary Language Association)'),('id','Indonesian'),('ie','Interlingue; Occidental'),('ig','Igbo'),('ii','Sichuan Yi; Nuosu'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('ka','Georgian'),('kg','Kongo'),('ki','Kikuyu; Gikuyu'),('kj','Kuanyama; Kwanyama'),('kk','Kazakh'),('kl','Kalaallisut; Greenlandic'),('km','Central Khmer'),('kn','Kannada'),('ko','Korean'),('kr','Kanuri'),('ks','Kashmiri'),('ku','Kurdish'),('kv','Komi'),('kw','Cornish'),('ky','Kirghiz; Kyrgyz'),('la','Latin'),('lb','Luxembourgish; Letzeburgesch'),('lg','Ganda'),('li','Limburgan; Limburger; Limburgish'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('mg','Malagasy'),('mh','Marshallese'),('mi','Maori'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mr','Marathi'),('ms','Malay'),('mt','Maltese'),('my','Burmese'),('na','Nauru'),('nb','Bokmål, Norwegian; Norwegian Bokmål'),('nd','Ndebele, North; North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nl','Dutch; Flemish'),('nn','Norwegian Nynorsk; Nynorsk, Norwegian'),('no','Norwegian'),('nr','Ndebele, South; South Ndebele'),('nv','Navajo; Navaho'),('ny','Chichewa; Chewa; Nyanja'),('oc','Occitan (post 1500)'),('oj','Ojibwa'),('om','Oromo'),('or','Oriya'),('os','Ossetian; Ossetic'),('pa','Panjabi; Punjabi'),('pi','Pali'),('pl','Polish'),('ps','Pushto; Pashto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Rundi'),('ro','Romanian; Moldavian; Moldovan'),('ru','Russian'),('rw','Kinyarwanda'),('sa','Sanskrit'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sg','Sango'),('si','Sinhala; Sinhalese'),('sk','Slovak'),('sl','Slovenian'),('sm','Samoan'),('sn','Shona'),('so','Somali'),('sq','Albanian'),('sr','Serbian'),('ss','Swati'),('st','Sotho, Southern'),('su','Sundanese'),('sv','Swedish'),('sw','Swahili'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uighur; Uyghur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','Volapük'),('wa','Walloon'),('wo','Wolof'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang; Chuang'),('zh','Chinese'),('zu','Zulu');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_alias`
--

DROP TABLE IF EXISTS `persons_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_alias`
--

LOCK TABLES `persons_alias` WRITE;
/*!40000 ALTER TABLE `persons_alias` DISABLE KEYS */;
INSERT INTO `persons_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q4491','DE',0,'Anna Kay Faris'),('Q4491','EN',0,'Ana faris'),('Q4491','EN',1,'Anna Farris'),('Q4491','EN',2,'Anna Kay Faris');
/*!40000 ALTER TABLE `persons_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_claim`
--

DROP TABLE IF EXISTS `persons_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_claim`
--

LOCK TABLES `persons_claim` WRITE;
/*!40000 ALTER TABLE `persons_claim` DISABLE KEYS */;
INSERT INTO `persons_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1083585','P106',1,'Fernsehmoderator'),('Q1083585','P69',0,'Hochschule Fresenius'),('Q1352561','P106',2,'Politiker'),('Q1352561','P69',0,'Hochschule für Philosophie München'),('Q1352561','P69',1,'Ludwig-Maximilians-Universität München'),('Q14623402','P106',4,'Biochemiker'),('Q14623402','P106',5,'Zellbiologe'),('Q14623402','P106',6,'Q484657'),('Q14623402','P69',0,'Hochschule Darmstadt'),('Q14623402','P69',1,'Universität Pierre und Marie Curie'),('Q14623402','P69',2,'Max-Planck-Institut für Biochemie'),('Q14623402','P69',3,'University of California, Berkeley'),('Q1665798','P106',1,'Manager'),('Q1665798','P69',0,'Hochschule Mainz'),('Q4491','P106',1,'television actor'),('Q4491','P106',2,'film actor'),('Q4491','P106',3,'actor'),('Q4491','P106',4,'voice actor'),('Q4491','P106',5,'film producer'),('Q4491','P69',0,'University of Washington'),('Q496323','P106',2,'Q484657'),('Q496323','P69',0,'Hochschule Bremen'),('Q496323','P69',1,'Kunstakademie Düsseldorf'),('Q95898','P106',1,'Q484657'),('Q95898','P69',0,'Hochschule für Wirtschaft und Recht Berlin');
/*!40000 ALTER TABLE `persons_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_desc`
--

DROP TABLE IF EXISTS `persons_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_desc`
--

LOCK TABLES `persons_desc` WRITE;
/*!40000 ALTER TABLE `persons_desc` DISABLE KEYS */;
INSERT INTO `persons_desc` (`item_id`, `language`, `description`) VALUES ('Q1083585','DE','deutsche Fernsehmoderatorin'),('Q1352561','DE','deutscher Politiker der CSU'),('Q1665798','DE','deutscher Manager'),('Q4491','DE','amerikanische Schauspielerin, Filmproduzentin, Synchronsprecherin und Sängerin'),('Q4491','EN','American actress, comedian and singer'),('Q496323','DE','deutscher Architekt und Hochschullehrer'),('Q95898','DE','deutscher Politiker in Berlin');
/*!40000 ALTER TABLE `persons_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_label`
--

DROP TABLE IF EXISTS `persons_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_label`
--

LOCK TABLES `persons_label` WRITE;
/*!40000 ALTER TABLE `persons_label` DISABLE KEYS */;
INSERT INTO `persons_label` (`item_id`, `language`, `label`) VALUES ('Q1083585','DE','Christine Henning'),('Q1352561','DE','Erich Kiesl'),('Q14623402','DE','Anne Spang'),('Q1665798','DE','Robert J. Koehler'),('Q4491','DE','Anna Faris'),('Q4491','EN','Anna Faris'),('Q496323','DE','Andreas Brandt'),('Q95898','DE','Frank Henkel');
/*!40000 ALTER TABLE `persons_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_link`
--

DROP TABLE IF EXISTS `persons_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_link`
--

LOCK TABLES `persons_link` WRITE;
/*!40000 ALTER TABLE `persons_link` DISABLE KEYS */;
INSERT INTO `persons_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1083585','DE','dewiki','http://de.wikipedia.org/wiki/Christine_Henning'),('Q1352561','DE','dewiki','http://de.wikipedia.org/wiki/Erich_Kiesl'),('Q14623402','DE','dewiki','http://de.wikipedia.org/wiki/Anne_Spang'),('Q1665798','DE','dewiki','http://de.wikipedia.org/wiki/Robert_J._Koehler'),('Q4491','DE','dewiki','http://de.wikipedia.org/wiki/Anna_Faris'),('Q4491','EN','enwiki','http://en.wikipedia.org/wiki/Anna_Faris'),('Q4491','FR','frwiki','http://fr.wikipedia.org/wiki/Anna_Faris'),('Q496323','DE','dewiki','http://de.wikipedia.org/wiki/Andreas_Brandt_(Architekt)'),('Q95898','DE','dewiki','http://de.wikipedia.org/wiki/Frank_Henkel');
/*!40000 ALTER TABLE `persons_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_mview`
--

DROP TABLE IF EXISTS `persons_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_mview` (
  `Name` mediumtext,
  `jobs_title` mediumtext,
  `wikipedia_hyperlink` mediumtext,
  `language` varchar(15) NOT NULL,
  `person_ID` varchar(15) NOT NULL,
  `job_ID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_mview`
--

LOCK TABLES `persons_mview` WRITE;
/*!40000 ALTER TABLE `persons_mview` DISABLE KEYS */;
INSERT INTO `persons_mview` (`Name`, `jobs_title`, `wikipedia_hyperlink`, `language`, `person_ID`, `job_ID`) VALUES ('Christine Henning',NULL,'http://de.wikipedia.org/wiki/Christine_Henning','DE','Q1083585',NULL),('Erich Kiesl',NULL,'http://de.wikipedia.org/wiki/Erich_Kiesl','DE','Q1352561',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Robert J. Koehler',NULL,'http://de.wikipedia.org/wiki/Robert_J._Koehler','DE','Q1665798',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Andreas Brandt',NULL,'http://de.wikipedia.org/wiki/Andreas_Brandt_(Architekt)','DE','Q496323',NULL),('Frank Henkel',NULL,'http://de.wikipedia.org/wiki/Frank_Henkel','DE','Q95898',NULL);
/*!40000 ALTER TABLE `persons_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_alias`
--

DROP TABLE IF EXISTS `states_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_alias`
--

LOCK TABLES `states_alias` WRITE;
/*!40000 ALTER TABLE `states_alias` DISABLE KEYS */;
INSERT INTO `states_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q183','DE',0,'Bundesrepublik Deutschland'),('Q183','DE',1,'BR Deutschland'),('Q183','DE',2,'BRD');
/*!40000 ALTER TABLE `states_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_claim`
--

DROP TABLE IF EXISTS `states_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_claim`
--

LOCK TABLES `states_claim` WRITE;
/*!40000 ALTER TABLE `states_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_desc`
--

DROP TABLE IF EXISTS `states_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_desc`
--

LOCK TABLES `states_desc` WRITE;
/*!40000 ALTER TABLE `states_desc` DISABLE KEYS */;
INSERT INTO `states_desc` (`item_id`, `language`, `description`) VALUES ('Q183','DE','Staat in Mitteleuropa');
/*!40000 ALTER TABLE `states_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_label`
--

DROP TABLE IF EXISTS `states_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_label`
--

LOCK TABLES `states_label` WRITE;
/*!40000 ALTER TABLE `states_label` DISABLE KEYS */;
INSERT INTO `states_label` (`item_id`, `language`, `label`) VALUES ('Q183','DE','Deutschland');
/*!40000 ALTER TABLE `states_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_link`
--

DROP TABLE IF EXISTS `states_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_link`
--

LOCK TABLES `states_link` WRITE;
/*!40000 ALTER TABLE `states_link` DISABLE KEYS */;
INSERT INTO `states_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q183','DE','dewiki','https://de.wikipedia.org/wiki/Deutschland'),('Q183','EN','enwiki','https://en.wikipedia.org/wiki/Germany');
/*!40000 ALTER TABLE `states_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sufu_mview`
--

DROP TABLE IF EXISTS `sufu_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sufu_mview` (
  `state_ID` varchar(15) DEFAULT NULL,
  `city_ID` varchar(15) DEFAULT NULL,
  `uni_ID` varchar(15) NOT NULL,
  `person_ID` varchar(15) DEFAULT NULL,
  `job_ID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sufu_mview`
--

LOCK TABLES `sufu_mview` WRITE;
/*!40000 ALTER TABLE `sufu_mview` DISABLE KEYS */;
INSERT INTO `sufu_mview` (`state_ID`, `city_ID`, `uni_ID`, `person_ID`, `job_ID`) VALUES (NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL);
/*!40000 ALTER TABLE `sufu_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wikidata_a'
--

--
-- Dumping routines for database 'wikidata_a'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



CREATE DATABASE  IF NOT EXISTS `wikidata_b` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wikidata_b`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wikidata_b
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities_alias`
--

DROP TABLE IF EXISTS `cities_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_alias`
--

LOCK TABLES `cities_alias` WRITE;
/*!40000 ALTER TABLE `cities_alias` DISABLE KEYS */;
INSERT INTO `cities_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q1040','DE',0,'Carlsruhe'),('Q1726','DE',0,'Minga'),('Q1794','DE',0,'Frankfurt'),('Q1794','DE',1,'Frankfurt/Main'),('Q1794','DE',2,'FFM'),('Q1794','DE',3,'Frankfurt (Main)'),('Q1794','DE',4,'Mainhattan'),('Q64','DE',0,'Stadt Berlin'),('Q64','DE',1,'Berlin, Deutschland'),('Q64','DE',2,'Bundeshauptstadt Berlin'),('Q64','DE',3,'Land Berlin'),('Q64','DE',4,'DE-BE');
/*!40000 ALTER TABLE `cities_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_claim`
--

DROP TABLE IF EXISTS `cities_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_claim`
--

LOCK TABLES `cities_claim` WRITE;
/*!40000 ALTER TABLE `cities_claim` DISABLE KEYS */;
INSERT INTO `cities_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1040','P131',1,'Regierungsbezirk Karlsruhe'),('Q1040','P17',0,'Q183'),('Q1720','P131',1,'Rheinland-Pfalz'),('Q1720','P17',0,'Deutschland'),('Q1726','P131',1,'Oberbayern'),('Q1726','P17',0,'Deutschland'),('Q1794','P131',1,'Hessen'),('Q1794','P131',2,'Regierungsbezirk Darmstadt'),('Q1794','P17',0,'Deutschland'),('Q24879','P131',1,'Freie Hansestadt Bremen'),('Q24879','P17',0,'Deutschland'),('Q2973','P131',1,'Regierungsbezirk Darmstadt'),('Q2973','P131',2,'Hessen'),('Q2973','P17',0,'Q183'),('Q365','P131',1,'Regierungsbezirk Köln'),('Q365','P17',0,'Q183'),('Q64','P131',1,'Deutschland'),('Q64','P17',0,'Deutschland');
/*!40000 ALTER TABLE `cities_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_desc`
--

DROP TABLE IF EXISTS `cities_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_desc`
--

LOCK TABLES `cities_desc` WRITE;
/*!40000 ALTER TABLE `cities_desc` DISABLE KEYS */;
INSERT INTO `cities_desc` (`item_id`, `language`, `description`) VALUES ('Q1040','DE','Großstadt in Deutschland'),('Q1720','DE','Landeshauptstadt von Rheinland-Pfalz'),('Q1726','DE','Hauptstadt von Bayern, Deutschland'),('Q1794','DE','Großstadt in Hessen'),('Q24879','DE','Stadt in Norddeutschland'),('Q2973','DE','Großstadt in Hessen'),('Q365','DE','Großstadt in Nordrhein-Westfalen'),('Q64','DE','Hauptstadt von Deutschland und ein Land in Deutschland');
/*!40000 ALTER TABLE `cities_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_label`
--

DROP TABLE IF EXISTS `cities_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_label`
--

LOCK TABLES `cities_label` WRITE;
/*!40000 ALTER TABLE `cities_label` DISABLE KEYS */;
INSERT INTO `cities_label` (`item_id`, `language`, `label`) VALUES ('Q1040','DE','Karlsruhe'),('Q1720','DE','Mainz'),('Q1726','DE','München'),('Q1794','DE','Frankfurt'),('Q24879','DE','Bremen'),('Q2973','DE','Darmstadt'),('Q365','DE','Köln'),('Q64','DE','Berlin');
/*!40000 ALTER TABLE `cities_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_link`
--

DROP TABLE IF EXISTS `cities_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_link`
--

LOCK TABLES `cities_link` WRITE;
/*!40000 ALTER TABLE `cities_link` DISABLE KEYS */;
INSERT INTO `cities_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1040','DE','dewiki','https://de.wikipedia.org/wiki/Karlsruhe'),('Q1040','EN','enwiki','https://en.wikipedia.org/wiki/Karlsruhe'),('Q1720','DE','dewiki','https://de.wikipedia.org/wiki/Mainz'),('Q1720','EN','enwiki','https://en.wikipedia.org/wiki/Mainz'),('Q1726','DE','dewiki','https://de.wikipedia.org/wiki/München'),('Q1726','EN','enwiki','https://en.wikipedia.org/wiki/Munich'),('Q1794','DE','dewiki','https://de.wikipedia.org/wiki/Frankfurt_am_Main'),('Q1794','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt'),('Q24879','DE','dewiki','https://de.wikipedia.org/wiki/Bremen'),('Q24879','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt'),('Q2973','DE','dewiki','https://de.wikipedia.org/wiki/Darmstadt'),('Q2973','EN','enwiki','https://en.wikipedia.org/wiki/Darmstadt'),('Q365','DE','dewiki','https://de.wikipedia.org/wiki/Köln'),('Q365','EN','enwiki','https://en.wikipedia.org/wiki/Cologne'),('Q64','DE','dewiki','https://de.wikipedia.org/wiki/Berlin'),('Q64','EN','enwiki','https://en.wikipedia.org/wiki/Berlin');
/*!40000 ALTER TABLE `cities_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_alias`
--

DROP TABLE IF EXISTS `educationinstitutes_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_alias`
--

LOCK TABLES `educationinstitutes_alias` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_alias` DISABLE KEYS */;
INSERT INTO `educationinstitutes_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q1262599','DE',0,'BA Karlsruhe'),('Q1262599','DE',1,'Berufsakademie Karlsruhe'),('Q1262599','DE',2,'DHBW Karlsruhe'),('Q1444899','DE',0,'Frankfurt School of Finance and Management'),('Q1622092','DE',0,'HS Bremen'),('Q1622099','DE',0,'Europa Fachhochschule Fresenius'),('Q219563','DE',0,'Universität von Washington'),('Q219563','EN',0,'UW'),('Q219563','EN',1,'UDub'),('Q219563','FR',0,'Universite de Washington'),('Q219563','FR',1,'University of Washington'),('Q284992','DE',0,'h_da'),('Q459724','DE',0,'FH Mainz'),('Q464443','DE',0,'HWR Berlin'),('Q464443','DE',1,'Berlin School Of Economics And Law'),('Q464443','DE',2,'Berufsakademie Berlin'),('Q464443','DE',3,'FHW Berlin'),('Q464443','DE',4,'Fachhochschule für Wirtschaft Berlin'),('Q464443','DE',5,'BA Berlin'),('Q464443','DE',6,'Berlin School Of Economics'),('Q464443','DE',7,'Fachhochschule für Wirtschaft'),('Q881849','DE',0,'Hochschule für Philosophie'),('Q881849','DE',1,'Berchmanskolleg'),('Q881849','DE',2,'HfPh');
/*!40000 ALTER TABLE `educationinstitutes_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_claim`
--

DROP TABLE IF EXISTS `educationinstitutes_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_claim`
--

LOCK TABLES `educationinstitutes_claim` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_claim` DISABLE KEYS */;
INSERT INTO `educationinstitutes_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1262599','P131',2,'Baden-WÃ¼rttemberg'),('Q1262599','P17',0,'Deutschland'),('Q1262599','P31',1,'Q183'),('Q1262599','P625',3,'49.026111, 8.3855'),('Q1444899','P131',2,'Hessen'),('Q1444899','P17',0,'Deutschland'),('Q1444899','P31',1,'Hochschule'),('Q1444899','P625',3,'50.109611, 8.697389'),('Q1622092','P131',2,'Bremen'),('Q1622092','P17',0,'Deutschland'),('Q1622092','P31',1,'Hochschule'),('Q1622092','P625',3,'53.108611, 8.853611'),('Q1622099','P131',2,'Hessen'),('Q1622099','P17',0,'Deutschland'),('Q1622099','P31',1,'Hochschule'),('Q1622099','P625',3,'50.221306, 8.267111'),('Q219563','P17',0,'United States of America'),('Q219563','P31',2,'public university'),('Q219563','P31',3,'Q30'),('Q219563','P571',1,'Q7693'),('Q219563','P625',4,'12.345, 9.876'),('Q284992','P131',3,'Darmstadt'),('Q284992','P17',0,'Q183'),('Q284992','P31',1,'Hochschule'),('Q284992','P31',2,'Fachhochschule'),('Q284992','P625',4,'49.866389, 8.633333'),('Q459724','P131',2,'Mainz'),('Q459724','P17',0,'Deutschland'),('Q459724','P281',3,'Q54321'),('Q459724','P31',1,'Hochschule'),('Q459724','P625',3,'49.996694, 8.278889'),('Q464443','P131',2,'Berlin'),('Q464443','P17',0,'Deutschland'),('Q464443','P31',1,'Hochschule'),('Q464443','P625',3,'52.485258, 13.337772'),('Q464443','P669',3,'Q314207'),('Q464443','P969',0,'Q654321'),('Q881849','P17',0,'Deutschland'),('Q881849','P31',1,'Q183'),('Q881849','P625',2,'48.148919, 11.583289');
/*!40000 ALTER TABLE `educationinstitutes_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_desc`
--

DROP TABLE IF EXISTS `educationinstitutes_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_desc`
--

LOCK TABLES `educationinstitutes_desc` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_desc` DISABLE KEYS */;
INSERT INTO `educationinstitutes_desc` (`item_id`, `language`, `description`) VALUES ('Q1262599','DE',''),('Q1444899','DE',''),('Q1622092','DE','staatliche Hochschule in Bremen, Deutschland'),('Q1622099','DE',''),('Q219563','DE','Universität in den Vereinigten Staaten'),('Q219563','EN','public research university in Seattle, Washington'),('Q219563','FR','université américaine'),('Q284992','DE',''),('Q459724','DE',''),('Q464443','DE','staatliche Hochschule in Berlin, Deutschland'),('Q881849','DE','');
/*!40000 ALTER TABLE `educationinstitutes_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_label`
--

DROP TABLE IF EXISTS `educationinstitutes_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_label`
--

LOCK TABLES `educationinstitutes_label` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_label` DISABLE KEYS */;
INSERT INTO `educationinstitutes_label` (`item_id`, `language`, `label`) VALUES ('Q1262599','DE','Duale Hochschule Baden-Württemberg Karlsruhe'),('Q1444899','DE','Frankfurt School of Finance & Management'),('Q1622092','DE','Hochschule Bremen'),('Q1622099','DE','Hochschule Fresenius'),('Q219563','DE','University of Washington'),('Q219563','EN','University of Washington'),('Q219563','FR','Université de Washington'),('Q284992','DE','Hochschule Darmstadt'),('Q459724','DE','Fachhochschule Mainz'),('Q464443','DE','Hochschule für Wirtschaft und Recht Berlin'),('Q881849','DE','Hochschule für Philosophie München');
/*!40000 ALTER TABLE `educationinstitutes_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_link`
--

DROP TABLE IF EXISTS `educationinstitutes_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_link`
--

LOCK TABLES `educationinstitutes_link` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_link` DISABLE KEYS */;
INSERT INTO `educationinstitutes_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1262599','DE','dewiki','https://de.wikipedia.org/wiki/Duale_Hochschule_Baden-Württemberg_Karlsruhe'),('Q1444899','DE','dewiki','https://de.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management'),('Q1444899','EN','enwiki','https://en.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management'),('Q1622092','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Bremen'),('Q1622092','EN','enwiki','https://en.wikipedia.org/wiki/Bremen_University_of_Applied_Sciences'),('Q1622099','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Fresenius'),('Q219563','DE','dewiki','http://de.wikipedia.org/wiki/University_of_Washington'),('Q219563','EN','enwiki','http://en.wikipedia.org/wiki/University_of_Washington'),('Q219563','FR','frwiki','http://fr.wikipedia.org/wiki/Universit%C3%A9_de_Washington'),('Q219563','IT','itwiki','http://it.wikipedia.org/wiki/Universit%C3%A0_di_Washington'),('Q219563','PT','ptwiki','http://pt.wikipedia.org/wiki/Universidade_de_Washington'),('Q284992','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Darmstadt'),('Q284992','EN','enwiki','https://en.wikipedia.org/wiki/Darmstadt_University_of_Applied_Sciences'),('Q459724','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_Mainz'),('Q459724','EN','enwiki','https://en.wikipedia.org/wiki/University_of_Applied_Sciences,_Mainz'),('Q464443','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_für_Wirtschaft_und_Recht_Berlin'),('Q464443','EN','enwiki','https://en.wikipedia.org/wiki/Berlin_School_of_Economics_and_Law'),('Q881849','DE','dewiki','https://de.wikipedia.org/wiki/Hochschule_für_Philosophie_München'),('Q881849','EN','enwiki','https://en.wikipedia.org/wiki/Munich_School_of_Philosophy');
/*!40000 ALTER TABLE `educationinstitutes_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationinstitutes_mview`
--

DROP TABLE IF EXISTS `educationinstitutes_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationinstitutes_mview` (
  `id` varchar(15) NOT NULL,
  `name` mediumtext,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` longtext,
  `state` mediumtext,
  `zip_code` mediumtext,
  `phone` mediumtext,
  `email` mediumtext,
  `year_of_foundation` mediumtext,
  `street_and_house_number` mediumtext,
  `city` mediumtext,
  `education_institute_description` mediumtext,
  `wikipedia_hyperlink` mediumtext,
  `language` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationinstitutes_mview`
--

LOCK TABLES `educationinstitutes_mview` WRITE;
/*!40000 ALTER TABLE `educationinstitutes_mview` DISABLE KEYS */;
INSERT INTO `educationinstitutes_mview` (`id`, `name`, `longitude`, `latitude`, `state`, `zip_code`, `phone`, `email`, `year_of_foundation`, `street_and_house_number`, `city`, `education_institute_description`, `wikipedia_hyperlink`, `language`) VALUES ('Q1262599','Duale Hochschule Baden-Württemberg Karlsruhe','8.3855','49.026111','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Duale_Hochschule_Baden-Württemberg_Karlsruhe','DE'),('Q1444899','Frankfurt School of Finance & Management','8.697389','50.109611','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Frankfurt_School_of_Finance_%26_Management','DE'),('Q1622092','Hochschule Bremen','8.853611','53.108611','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'staatliche Hochschule in Bremen, Deutschland','https://de.wikipedia.org/wiki/Hochschule_Bremen','DE'),('Q1622099','Hochschule Fresenius','8.267111','50.221306','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Fresenius','DE'),('Q219563','University of Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'Universität in den Vereinigten Staaten','http://de.wikipedia.org/wiki/University_of_Washington','DE'),('Q219563','University of Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'public research university in Seattle, Washington','http://en.wikipedia.org/wiki/University_of_Washington','EN'),('Q219563','Université de Washington','9.876','12.345','United States of America',NULL,NULL,NULL,'Q7693',NULL,NULL,'université américaine','http://fr.wikipedia.org/wiki/Universit%C3%A9_de_Washington','FR'),('Q284992','Hochschule Darmstadt','8.633333','49.866389','Q183',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Darmstadt','DE'),('Q459724','Fachhochschule Mainz','8.278889','49.996694','Deutschland','Q54321',NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_Mainz','DE'),('Q464443','Hochschule für Wirtschaft und Recht Berlin','13.337772','52.485258','Deutschland',NULL,NULL,NULL,NULL,'Q654321',NULL,'staatliche Hochschule in Berlin, Deutschland','https://de.wikipedia.org/wiki/Hochschule_für_Wirtschaft_und_Recht_Berlin','DE'),('Q881849','Hochschule für Philosophie München','11.583289','48.148919','Deutschland',NULL,NULL,NULL,NULL,NULL,NULL,'','https://de.wikipedia.org/wiki/Hochschule_für_Philosophie_München','DE');
/*!40000 ALTER TABLE `educationinstitutes_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gui_texts`
--

DROP TABLE IF EXISTS `gui_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gui_texts` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gui_texts`
--

LOCK TABLES `gui_texts` WRITE;
/*!40000 ALTER TABLE `gui_texts` DISABLE KEYS */;
INSERT INTO `gui_texts` (`item_id`, `language`, `label`, `description`) VALUES ('P106','DE','Tätigkeit','Beruf oder andere Tätigkeit einer Person (ergänzt durch \"Arbeitsgebiet\": Property:P101)'),('P106','EN','occupation','occupation of a person; see also \"field of work\" (Property:P101)'),('P106','FR','profession','métier ou occupation d`une personne, voir aussi \"domaine d`activité\" (Property:P101)'),('P1329','DE','Telefonnummer ',''),('P1329','EN','phone number','property for phone number with String datatype until the URL datatype will support phone numbers'),('P17','DE','Staat','souveräner Staat, in dem sich das Objekt befindet'),('P17','EN','country','sovereign state of this item'),('P17','FR','pays','état souverain de cet élément'),('P571','DE','Gründungs-/Erstellungsdatum','Datum, an dem eine Organisation/ein Objekt gegründet/erstellt wurde'),('P571','EN','inception','date or point in time when the organization/object was founded/created'),('P968','DE','E-Mail','E-Mail-Addresse'),('P968','EN',' e-mail ','e-mail address'),('Q215627','DE','Person',''),('Q215627','EN','person',''),('Q2385804','DE','Bildungsinstitution',''),('Q2385804','EN','educational institution',''),('Q319608','DE','Postanschrift',''),('Q319608','EN','address',''),('Q508719','DE','Alumni',''),('Q508719','EN','alumnus',''),('Q515','DE','Stadt ',''),('Q515','EN','city',''),('Q82799','DE','Name',''),('Q82799','EN','name','');
/*!40000 ALTER TABLE `gui_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iso_languages`
--

DROP TABLE IF EXISTS `iso_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iso_languages` (
  `language` varchar(2) NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Labels of languages following ISO 639-1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iso_languages`
--

LOCK TABLES `iso_languages` WRITE;
/*!40000 ALTER TABLE `iso_languages` DISABLE KEYS */;
INSERT INTO `iso_languages` (`language`, `text`) VALUES ('aa','Afar'),('ab','Abkhazian'),('ae','Avestan'),('af','Afrikaans'),('ak','Akan'),('am','Amharic'),('an','Aragonese'),('ar','Arabic'),('as','Assamese'),('av','Avaric'),('ay','Aymara'),('az','Azerbaijani'),('ba','Bashkir'),('be','Belarusian'),('bg','Bulgarian'),('bh','Bihari languages'),('bi','Bislama'),('bm','Bambara'),('bn','Bengali'),('bo','Tibetan'),('br','Breton'),('bs','Bosnian'),('ca','Catalan; Valencian'),('ce','Chechen'),('ch','Chamorro'),('co','Corsican'),('cr','Cree'),('cs','Czech'),('cu','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),('cv','Chuvash'),('cy','Welsh'),('da','Danish'),('de','German'),('dv','Divehi; Dhivehi; Maldivian'),('dz','Dzongkha'),('ee','Ewe'),('el','Greek, Modern (1453-)'),('en','English'),('eo','Esperanto'),('es','Spanish; Castilian'),('et','Estonian'),('eu','Basque'),('fa','Persian'),('ff','Fulah'),('fi','Finnish'),('fj','Fijian'),('fo','Faroese'),('fr','French'),('fy','Western Frisian'),('ga','Irish'),('gd','Gaelic; Scottish Gaelic'),('gl','Galician'),('gn','Guarani'),('gu','Gujarati'),('gv','Manx'),('ha','Hausa'),('he','Hebrew'),('hi','Hindi'),('ho','Hiri Motu'),('hr','Croatian'),('ht','Haitian; Haitian Creole'),('hu','Hungarian'),('hy','Armenian'),('hz','Herero'),('ia','Interlingua (International Auxiliary Language Association)'),('id','Indonesian'),('ie','Interlingue; Occidental'),('ig','Igbo'),('ii','Sichuan Yi; Nuosu'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('ka','Georgian'),('kg','Kongo'),('ki','Kikuyu; Gikuyu'),('kj','Kuanyama; Kwanyama'),('kk','Kazakh'),('kl','Kalaallisut; Greenlandic'),('km','Central Khmer'),('kn','Kannada'),('ko','Korean'),('kr','Kanuri'),('ks','Kashmiri'),('ku','Kurdish'),('kv','Komi'),('kw','Cornish'),('ky','Kirghiz; Kyrgyz'),('la','Latin'),('lb','Luxembourgish; Letzeburgesch'),('lg','Ganda'),('li','Limburgan; Limburger; Limburgish'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('mg','Malagasy'),('mh','Marshallese'),('mi','Maori'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mr','Marathi'),('ms','Malay'),('mt','Maltese'),('my','Burmese'),('na','Nauru'),('nb','Bokmål, Norwegian; Norwegian Bokmål'),('nd','Ndebele, North; North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nl','Dutch; Flemish'),('nn','Norwegian Nynorsk; Nynorsk, Norwegian'),('no','Norwegian'),('nr','Ndebele, South; South Ndebele'),('nv','Navajo; Navaho'),('ny','Chichewa; Chewa; Nyanja'),('oc','Occitan (post 1500)'),('oj','Ojibwa'),('om','Oromo'),('or','Oriya'),('os','Ossetian; Ossetic'),('pa','Panjabi; Punjabi'),('pi','Pali'),('pl','Polish'),('ps','Pushto; Pashto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Rundi'),('ro','Romanian; Moldavian; Moldovan'),('ru','Russian'),('rw','Kinyarwanda'),('sa','Sanskrit'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sg','Sango'),('si','Sinhala; Sinhalese'),('sk','Slovak'),('sl','Slovenian'),('sm','Samoan'),('sn','Shona'),('so','Somali'),('sq','Albanian'),('sr','Serbian'),('ss','Swati'),('st','Sotho, Southern'),('su','Sundanese'),('sv','Swedish'),('sw','Swahili'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uighur; Uyghur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','Volapük'),('wa','Walloon'),('wo','Wolof'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang; Chuang'),('zh','Chinese'),('zu','Zulu');
/*!40000 ALTER TABLE `iso_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_alias`
--

DROP TABLE IF EXISTS `jobs_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_alias`
--

LOCK TABLES `jobs_alias` WRITE;
/*!40000 ALTER TABLE `jobs_alias` DISABLE KEYS */;
INSERT INTO `jobs_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q10798782','DE',0,'Schauspieler im Fernsehen'),('Q10798782','EN',0,'TV actor'),('Q10798782','EN',1,'actor'),('Q15839136','DE',0,'Zytologe'),('Q15839136','DE',1,'Zellbiologe'),('Q1622272','DE',0,'Hochschullehrer'),('Q42973','DE',0,'Hochbau-Ingenieur'),('Q42973','DE',1,'Architekt im Praktikum'),('Q42973','DE',2,'Architektin'),('Q82955','DE',0,'Lokalpolitiker'),('Q82955','DE',1,'Berufspolitiker'),('Q82955','DE',2,'Politikerin'),('Q947873','EN',0,'host'),('Q947873','EN',1,'hostess'),('Q947873','EN',2,'TV host'),('Q947873','EN',3,'television host'),('Q947873','EN',4,'TV presenter');
/*!40000 ALTER TABLE `jobs_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_claim`
--

DROP TABLE IF EXISTS `jobs_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_claim`
--

LOCK TABLES `jobs_claim` WRITE;
/*!40000 ALTER TABLE `jobs_claim` DISABLE KEYS */;
INSERT INTO `jobs_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q15839136','',0,''),('Q1622272','',0,''),('Q2462658','',0,''),('Q2919046','',0,''),('Q42973','',0,''),('Q82955','',0,''),('Q947873','',0,'');
/*!40000 ALTER TABLE `jobs_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_desc`
--

DROP TABLE IF EXISTS `jobs_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_desc`
--

LOCK TABLES `jobs_desc` WRITE;
/*!40000 ALTER TABLE `jobs_desc` DISABLE KEYS */;
INSERT INTO `jobs_desc` (`item_id`, `language`, `description`) VALUES ('Q10798782','EN','actor who performs on television'),('Q2462658','DE','Person im Anstellungsverhältnis, welche Managementaufgaben in einer Organisation wahrnimmt'),('Q2919046','DE','Naturwissenschaftler, der sich mit Themen aus der Biochemie befasst'),('Q42973','DE','Beruf'),('Q82955','DE','Person, die ein politisches Amt oder ein politisches Mandat innehat'),('Q947873','DE','Medienberuf'),('Q947873','EN','person who introduces or hosts television programs');
/*!40000 ALTER TABLE `jobs_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_label`
--

DROP TABLE IF EXISTS `jobs_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_label`
--

LOCK TABLES `jobs_label` WRITE;
/*!40000 ALTER TABLE `jobs_label` DISABLE KEYS */;
INSERT INTO `jobs_label` (`item_id`, `language`, `label`) VALUES ('Q10798782','DE','Fernsehschauspieler'),('Q10798782','EN','television actor'),('Q15839136','DE','Zellbiologe'),('Q1622272','DE','Hochschuldozent'),('Q2462658','DE','Manager'),('Q2919046','DE','Biochemiker'),('Q42973','DE','Architekt'),('Q82955','DE','Politiker'),('Q947873','DE','Fernsehmoderator'),('Q947873','EN','television presenter');
/*!40000 ALTER TABLE `jobs_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_link`
--

DROP TABLE IF EXISTS `jobs_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_link`
--

LOCK TABLES `jobs_link` WRITE;
/*!40000 ALTER TABLE `jobs_link` DISABLE KEYS */;
INSERT INTO `jobs_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q10798782','EN','enwiki','en.wikipedia.org/wiki/Television_actor'),('Q15839136','DE','dewiki','http://de.wikipedia.org/wiki/Zellbiologie'),('Q1622272','DE','dewiki','https://de.wikipedia.org/wiki/Hochschullehrer'),('Q2462658','DE','dewiki','https://de.wikipedia.org/wiki/Manager_(Wirtschaft)'),('Q2919046','EN','enwiki','https://en.wikipedia.org/wiki/Biochemist'),('Q42973','DE','dewiki','https://de.wikipedia.org/wiki/Architekt'),('Q82955','DE','dewiki','https://de.wikipedia.org/wiki/Politiker'),('Q947873','EN','enwiki','https://en.wikipedia.org/wiki/Television_presenter');
/*!40000 ALTER TABLE `jobs_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language` varchar(15) NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`language`, `text`) VALUES ('aa','Afar'),('ab','Abkhazian'),('abc',NULL),('ae','Avestan'),('af','Afrikaans'),('ak','Akan'),('am','Amharic'),('an','Aragonese'),('ar','Arabic'),('as','Assamese'),('av','Avaric'),('ay','Aymara'),('az','Azerbaijani'),('ba','Bashkir'),('be','Belarusian'),('bg','Bulgarian'),('bh','Bihari languages'),('bi','Bislama'),('bm','Bambara'),('bn','Bengali'),('bo','Tibetan'),('br','Breton'),('bs','Bosnian'),('ca','Catalan; Valencian'),('ce','Chechen'),('ch','Chamorro'),('co','Corsican'),('cr','Cree'),('cs','Czech'),('cu','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),('cv','Chuvash'),('cy','Welsh'),('da','Danish'),('de','German'),('def',NULL),('dv','Divehi; Dhivehi; Maldivian'),('dz','Dzongkha'),('ee','Ewe'),('el','Greek, Modern (1453-)'),('en','English'),('eo','Esperanto'),('es','Spanish; Castilian'),('et','Estonian'),('eu','Basque'),('fa','Persian'),('ff','Fulah'),('fi','Finnish'),('fj','Fijian'),('fo','Faroese'),('fr','French'),('fy','Western Frisian'),('ga','Irish'),('gd','Gaelic; Scottish Gaelic'),('ghi',NULL),('gl','Galician'),('gn','Guarani'),('gu','Gujarati'),('gv','Manx'),('ha','Hausa'),('he','Hebrew'),('hi','Hindi'),('ho','Hiri Motu'),('hr','Croatian'),('ht','Haitian; Haitian Creole'),('hu','Hungarian'),('hy','Armenian'),('hz','Herero'),('ia','Interlingua (International Auxiliary Language Association)'),('id','Indonesian'),('ie','Interlingue; Occidental'),('ig','Igbo'),('ii','Sichuan Yi; Nuosu'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('ka','Georgian'),('kg','Kongo'),('ki','Kikuyu; Gikuyu'),('kj','Kuanyama; Kwanyama'),('kk','Kazakh'),('kl','Kalaallisut; Greenlandic'),('km','Central Khmer'),('kn','Kannada'),('ko','Korean'),('kr','Kanuri'),('ks','Kashmiri'),('ku','Kurdish'),('kv','Komi'),('kw','Cornish'),('ky','Kirghiz; Kyrgyz'),('la','Latin'),('lb','Luxembourgish; Letzeburgesch'),('lg','Ganda'),('li','Limburgan; Limburger; Limburgish'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('mg','Malagasy'),('mh','Marshallese'),('mi','Maori'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mr','Marathi'),('ms','Malay'),('mt','Maltese'),('my','Burmese'),('na','Nauru'),('nb','Bokmål, Norwegian; Norwegian Bokmål'),('nd','Ndebele, North; North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nl','Dutch; Flemish'),('nn','Norwegian Nynorsk; Nynorsk, Norwegian'),('no','Norwegian'),('nr','Ndebele, South; South Ndebele'),('nv','Navajo; Navaho'),('ny','Chichewa; Chewa; Nyanja'),('oc','Occitan (post 1500)'),('oj','Ojibwa'),('om','Oromo'),('or','Oriya'),('os','Ossetian; Ossetic'),('pa','Panjabi; Punjabi'),('pi','Pali'),('pl','Polish'),('ps','Pushto; Pashto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Rundi'),('ro','Romanian; Moldavian; Moldovan'),('ru','Russian'),('rw','Kinyarwanda'),('sa','Sanskrit'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sg','Sango'),('si','Sinhala; Sinhalese'),('sk','Slovak'),('sl','Slovenian'),('sm','Samoan'),('sn','Shona'),('so','Somali'),('sq','Albanian'),('sr','Serbian'),('ss','Swati'),('st','Sotho, Southern'),('su','Sundanese'),('sv','Swedish'),('sw','Swahili'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uighur; Uyghur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','Volapük'),('wa','Walloon'),('wo','Wolof'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang; Chuang'),('zh','Chinese'),('zu','Zulu');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_alias`
--

DROP TABLE IF EXISTS `persons_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_alias`
--

LOCK TABLES `persons_alias` WRITE;
/*!40000 ALTER TABLE `persons_alias` DISABLE KEYS */;
INSERT INTO `persons_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q4491','DE',0,'Anna Kay Faris'),('Q4491','EN',0,'Ana faris'),('Q4491','EN',1,'Anna Farris'),('Q4491','EN',2,'Anna Kay Faris');
/*!40000 ALTER TABLE `persons_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_claim`
--

DROP TABLE IF EXISTS `persons_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_claim`
--

LOCK TABLES `persons_claim` WRITE;
/*!40000 ALTER TABLE `persons_claim` DISABLE KEYS */;
INSERT INTO `persons_claim` (`item_id`, `property`, `property_key`, `value`) VALUES ('Q1083585','P106',1,'Fernsehmoderator'),('Q1083585','P69',0,'Hochschule Fresenius'),('Q1352561','P106',2,'Politiker'),('Q1352561','P69',0,'Hochschule für Philosophie München'),('Q1352561','P69',1,'Ludwig-Maximilians-Universität München'),('Q14623402','P106',4,'Biochemiker'),('Q14623402','P106',5,'Zellbiologe'),('Q14623402','P106',6,'Q484657'),('Q14623402','P69',0,'Hochschule Darmstadt'),('Q14623402','P69',1,'Universität Pierre und Marie Curie'),('Q14623402','P69',2,'Max-Planck-Institut für Biochemie'),('Q14623402','P69',3,'University of California, Berkeley'),('Q1665798','P106',1,'Manager'),('Q1665798','P69',0,'Hochschule Mainz'),('Q4491','P106',1,'television actor'),('Q4491','P106',2,'film actor'),('Q4491','P106',3,'actor'),('Q4491','P106',4,'voice actor'),('Q4491','P106',5,'film producer'),('Q4491','P69',0,'University of Washington'),('Q496323','P106',2,'Q484657'),('Q496323','P69',0,'Hochschule Bremen'),('Q496323','P69',1,'Kunstakademie Düsseldorf'),('Q95898','P106',1,'Q484657'),('Q95898','P69',0,'Hochschule für Wirtschaft und Recht Berlin');
/*!40000 ALTER TABLE `persons_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_desc`
--

DROP TABLE IF EXISTS `persons_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_desc`
--

LOCK TABLES `persons_desc` WRITE;
/*!40000 ALTER TABLE `persons_desc` DISABLE KEYS */;
INSERT INTO `persons_desc` (`item_id`, `language`, `description`) VALUES ('Q1083585','DE','deutsche Fernsehmoderatorin'),('Q1352561','DE','deutscher Politiker der CSU'),('Q1665798','DE','deutscher Manager'),('Q4491','DE','amerikanische Schauspielerin, Filmproduzentin, Synchronsprecherin und Sängerin'),('Q4491','EN','American actress, comedian and singer'),('Q496323','DE','deutscher Architekt und Hochschullehrer'),('Q95898','DE','deutscher Politiker in Berlin');
/*!40000 ALTER TABLE `persons_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_label`
--

DROP TABLE IF EXISTS `persons_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_label`
--

LOCK TABLES `persons_label` WRITE;
/*!40000 ALTER TABLE `persons_label` DISABLE KEYS */;
INSERT INTO `persons_label` (`item_id`, `language`, `label`) VALUES ('Q1083585','DE','Christine Henning'),('Q1352561','DE','Erich Kiesl'),('Q14623402','DE','Anne Spang'),('Q1665798','DE','Robert J. Koehler'),('Q4491','DE','Anna Faris'),('Q4491','EN','Anna Faris'),('Q496323','DE','Andreas Brandt'),('Q95898','DE','Frank Henkel');
/*!40000 ALTER TABLE `persons_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_link`
--

DROP TABLE IF EXISTS `persons_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_link`
--

LOCK TABLES `persons_link` WRITE;
/*!40000 ALTER TABLE `persons_link` DISABLE KEYS */;
INSERT INTO `persons_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q1083585','DE','dewiki','http://de.wikipedia.org/wiki/Christine_Henning'),('Q1352561','DE','dewiki','http://de.wikipedia.org/wiki/Erich_Kiesl'),('Q14623402','DE','dewiki','http://de.wikipedia.org/wiki/Anne_Spang'),('Q1665798','DE','dewiki','http://de.wikipedia.org/wiki/Robert_J._Koehler'),('Q4491','DE','dewiki','http://de.wikipedia.org/wiki/Anna_Faris'),('Q4491','EN','enwiki','http://en.wikipedia.org/wiki/Anna_Faris'),('Q4491','FR','frwiki','http://fr.wikipedia.org/wiki/Anna_Faris'),('Q496323','DE','dewiki','http://de.wikipedia.org/wiki/Andreas_Brandt_(Architekt)'),('Q95898','DE','dewiki','http://de.wikipedia.org/wiki/Frank_Henkel');
/*!40000 ALTER TABLE `persons_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_mview`
--

DROP TABLE IF EXISTS `persons_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_mview` (
  `Name` mediumtext,
  `jobs_title` mediumtext,
  `wikipedia_hyperlink` mediumtext,
  `language` varchar(15) NOT NULL,
  `person_ID` varchar(15) NOT NULL,
  `job_ID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_mview`
--

LOCK TABLES `persons_mview` WRITE;
/*!40000 ALTER TABLE `persons_mview` DISABLE KEYS */;
INSERT INTO `persons_mview` (`Name`, `jobs_title`, `wikipedia_hyperlink`, `language`, `person_ID`, `job_ID`) VALUES ('Christine Henning',NULL,'http://de.wikipedia.org/wiki/Christine_Henning','DE','Q1083585',NULL),('Erich Kiesl',NULL,'http://de.wikipedia.org/wiki/Erich_Kiesl','DE','Q1352561',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Anne Spang',NULL,'http://de.wikipedia.org/wiki/Anne_Spang','DE','Q14623402',NULL),('Robert J. Koehler',NULL,'http://de.wikipedia.org/wiki/Robert_J._Koehler','DE','Q1665798',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://de.wikipedia.org/wiki/Anna_Faris','DE','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Anna Faris',NULL,'http://en.wikipedia.org/wiki/Anna_Faris','EN','Q4491',NULL),('Andreas Brandt',NULL,'http://de.wikipedia.org/wiki/Andreas_Brandt_(Architekt)','DE','Q496323',NULL),('Frank Henkel',NULL,'http://de.wikipedia.org/wiki/Frank_Henkel','DE','Q95898',NULL);
/*!40000 ALTER TABLE `persons_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_alias`
--

DROP TABLE IF EXISTS `states_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_alias` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `language_key` int(4) NOT NULL,
  `alias` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`language_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_alias`
--

LOCK TABLES `states_alias` WRITE;
/*!40000 ALTER TABLE `states_alias` DISABLE KEYS */;
INSERT INTO `states_alias` (`item_id`, `language`, `language_key`, `alias`) VALUES ('Q183','DE',0,'Bundesrepublik Deutschland'),('Q183','DE',1,'BR Deutschland'),('Q183','DE',2,'BRD');
/*!40000 ALTER TABLE `states_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_claim`
--

DROP TABLE IF EXISTS `states_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_claim` (
  `item_id` varchar(15) NOT NULL,
  `property` varchar(6) NOT NULL,
  `property_key` int(4) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`item_id`,`property`,`property_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_claim`
--

LOCK TABLES `states_claim` WRITE;
/*!40000 ALTER TABLE `states_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_desc`
--

DROP TABLE IF EXISTS `states_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_desc` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_desc`
--

LOCK TABLES `states_desc` WRITE;
/*!40000 ALTER TABLE `states_desc` DISABLE KEYS */;
INSERT INTO `states_desc` (`item_id`, `language`, `description`) VALUES ('Q183','DE','Staat in Mitteleuropa');
/*!40000 ALTER TABLE `states_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_label`
--

DROP TABLE IF EXISTS `states_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_label` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `label` mediumtext,
  PRIMARY KEY (`item_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_label`
--

LOCK TABLES `states_label` WRITE;
/*!40000 ALTER TABLE `states_label` DISABLE KEYS */;
INSERT INTO `states_label` (`item_id`, `language`, `label`) VALUES ('Q183','DE','Deutschland');
/*!40000 ALTER TABLE `states_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_link`
--

DROP TABLE IF EXISTS `states_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_link` (
  `item_id` varchar(15) NOT NULL,
  `language` varchar(15) NOT NULL,
  `wiki_id` varchar(20) NOT NULL,
  `url` mediumtext,
  PRIMARY KEY (`item_id`,`language`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_link`
--

LOCK TABLES `states_link` WRITE;
/*!40000 ALTER TABLE `states_link` DISABLE KEYS */;
INSERT INTO `states_link` (`item_id`, `language`, `wiki_id`, `url`) VALUES ('Q183','DE','dewiki','https://de.wikipedia.org/wiki/Deutschland'),('Q183','EN','enwiki','https://en.wikipedia.org/wiki/Germany');
/*!40000 ALTER TABLE `states_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sufu_mview`
--

DROP TABLE IF EXISTS `sufu_mview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sufu_mview` (
  `state_ID` varchar(15) DEFAULT NULL,
  `city_ID` varchar(15) DEFAULT NULL,
  `uni_ID` varchar(15) NOT NULL,
  `person_ID` varchar(15) DEFAULT NULL,
  `job_ID` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sufu_mview`
--

LOCK TABLES `sufu_mview` WRITE;
/*!40000 ALTER TABLE `sufu_mview` DISABLE KEYS */;
INSERT INTO `sufu_mview` (`state_ID`, `city_ID`, `uni_ID`, `person_ID`, `job_ID`) VALUES (NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1262599',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1444899',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622092',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q1622099',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q219563',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q284992',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q459724',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q464443',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL),(NULL,NULL,'Q881849',NULL,NULL);
/*!40000 ALTER TABLE `sufu_mview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wikidata_b'
--

--
-- Dumping routines for database 'wikidata_b'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-13 17:20:43
