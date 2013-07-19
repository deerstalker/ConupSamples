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
	`RVNM` varchar(30),
	`HNNM` varchar(30),
	`STLC` varchar(30),
	`DRNA` int,
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
	KEY `FK_STATIONID_REL` (`STATIONID_`),
	CONSTRAINT `FK_STATIONID_REL` FOREIGN KEY (`STATIONID_`) REFERENCES `STATIONINFO` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `STATIONRAINFALL` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `CITYWEATHERINFO`;
CREATE TABLE `CITYWEATHERINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`CITYID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WEATHER_` varchar(30), 
	`TEMPERATURE_` varchar(30),
	`WIND_` varchar(30),
	PRIMARY KEY (`id`),
	KEY `FK_CITYID_REL` (`CITYID_`),
	CONSTRAINT `FK_CITYID_REL` FOREIGN KEY (`CITYID_`) REFERENCES `CITY` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CITYWEATHERINFO` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STATIONWEATHERINFO`;
CREATE TABLE `STATIONWEATHERINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`STATIONID_` int(10) unsigned,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WEATHER_` varchar(30),
	`TEMPERATURE_` varchar(30),
	`WIND_` varchar(30),
	PRIMARY KEY (`id`),
	KEY `FK_STATIONID_RE` (`STATIONID_`),
	CONSTRAINT `FK_STATIONID_RE` FOREIGN KEY (`STATIONID_`) REFERENCES `STATIONINFO` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `STATIONWEATHERINFO` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `TYPHOONINFO`;
CREATE TABLE `TYPHOONINFO` (
	`ID_` int(10) unsigned NOT NULL auto_increment,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`LONGITUDE_` float,
	`LATITUDE_` float,
	`PRESSURE_` varchar(30),
	`MAXIMUMWINDSPEED_` varchar(30),
	`GALERADIUS_` varchar(30),
	`WHOLEGALERADIUS_` varchar(30),
	`WARNLEVEL_` varchar(20),
	`FLAG_` float,
	PRIMARY KEY (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TYPHOONINFO` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `RESERVOIRINFO`;
CREATE TABLE `RESERVOIRINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`STCD_` int(10) unsigned,
	`SSW` float,
	`XXSW` float,
	`XLSW` float,
	`SJSW` float,
	`XHSW` float,
	`SKR` int,
	`XXKR` int,
	`XHKR` float,
	`SJKR` float,
	PRIMARY KEY(`id`),
	KEY `FK_STCD` (`STCD_`),
	CONSTRAINT `FK_STCD` FOREIGN KEY (`STCD_`) REFERENCES `STATIONINFO` (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `RESERVOIRINFO` WRITE;
UNLOCK TABLES;
