DROP TABLE IF EXISTS `CITY`;
CREATE TABLE `CITY`(
	`ID_` int(10) unsigned NOT NULL auto_increment,
	`NAME_` varchar(80) character set utf8 NOT NULL default '',
	`ALIAS_` varchar(80) NOT NULL default '',
	PRIMARY KEY  (`ID_`)
);

DROP TABLE IF EXISTS `RAINFALL`;
CREATE TABLE `RAINFALL` (
	`id` int(10) unsigned NOT NULL,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`AMOUNT_` float,
	FOREIGN KEY (`id`) REFERENCES `CITY` (`ID_`)
);

DROP TABLE IF EXISTS `STATIONINFO`;
CREATE TABLE `STATIONINFO`(
	`ID_` int(10) unsigned NOT NULL auto_increment,
	`NAME_` varchar(80) character set utf8 NOT NULL default '',
	`ALIAS_` varchar(80) NOT NULL default '',
	`TYPE_` int unsigned,
	PRIMARY KEY  (`ID_`)
);

DROP TABLE IF EXISTS `PONDAGE`;
CREATE TABLE `PONDAGE` (
	`id` int(10) unsigned NOT NULL,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`WATERLEVEL_` float,
	FOREIGN KEY (`id`) REFERENCES `STATIONINFO` (`ID_`)
);

DROP TABLE IF EXISTS `STATIONRAINFALL`;
CREATE TABLE `STATIONRAINFALL` (
	`id` int(10) unsigned NOT NULL,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`AMOUNT_` float,
	FOREIGN KEY (`id`) REFERENCES `STATIONINFO` (`ID_`)
);




