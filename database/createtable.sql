/*
** author: chendong
** last modified: 2013.7.16
*/
DROP TABLE IF EXISTS `CITY`;
CREATE TABLE `CITY`(
	`ID_` int(10) unsigned NOT NULL auto_increment,
	`NAME_` varchar(80) character set utf8 NOT NULL default '',
	`ALIAS_` varchar(80) NOT NULL default '',
	PRIMARY KEY  (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CITY` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `RAINFALL`;
CREATE TABLE `RAINFALL` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`CITYID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`AMOUNT_` float,	
	PRIMARY KEY (`id`),
	KEY `FK_CITYID` (`CITYID_`),
	CONSTRAINT `FK_CITYID` FOREIGN KEY (`CITYID_`) REFERENCES `CITY` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `RAINFALL` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STATIONINFO`;
CREATE TABLE `STATIONINFO`(
	`ID_` int(10) unsigned NOT NULL,
	`NAME_` varchar(80) character set utf8 NOT NULL default '',
	`ALIAS_` varchar(80) NOT NULL default '',
	`TYPE_` int unsigned,
	PRIMARY KEY  (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `STATIONINFO` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PONDAGE`;
CREATE TABLE `PONDAGE` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`STATIONID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WATERLEVEL_` float,
	PRIMARY KEY (`id`),
	KEY `FK_STATIONID` (`STATIONID_`),
	CONSTRAINT `FK_STATIONID` FOREIGN KEY (`STATIONID_`) REFERENCES `STATIONINFO` (`ID_`)
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PONDAGE` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STATIONRAINFALL`;
CREATE TABLE `STATIONRAINFALL` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`STATIONID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`AMOUNT_` float,
	PRIMARY KEY (`id`),
	KEY `FK_STATIONIDS` (`STATIONID_`),
	CONSTRAINT `FK_STATIONIDS` FOREIGN KEY (`STATIONID_`) REFERENCES `STATIONINFO` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `STATIONRAINFALL` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `CITYWEATHERINFO`;
CREATE TABLE `CITYWEATHERINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`CITYID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WEATHER_` varchar(30), 
	`TemperatureMax_` Decimal(3,1),
	`TemperatureMin_` Decimal(3,1),
	`WindSpeedMax_` int,
	`WindSpeedMin_` int,
	PRIMARY KEY (`id`),
	KEY `FK_CITYID` (`PLACEID_`),
	CONSTRAINT `FK_CITYID` FOREIGN KEY (CITYID_) REFERENCES `CITY` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `WEATHERINFO` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STATIONWEATHERINFO`
CREATE TABLE `STATIONWEATHERINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`STATIONID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WEATHER_` varchar(30),
	`TemperatureMax_` Decimal(3,1),
	`TemperatureMin_` Decimal(3,1),
	`WindSpeedMax_` int,
	`WindSpeedMin_` int,
	PRIMARY KEY (`id`),
	KEY `FK_STATIONID` (STATIONID_),
	CONSTRAINT `FK_STATIONID` FOREIGN KEY (STATIONID_) REFERENCES `STATIONINFO` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `STATIONWEATHERINFO` WRITE;
UNLOCK TABLES;


