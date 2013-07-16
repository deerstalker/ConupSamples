-- MySQL dump 10.10
--
-- Host: localhost    Database: jbpmds
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `bpel_assignoperation`
--

DROP TABLE IF EXISTS `bpel_assignoperation`;
CREATE TABLE `bpel_assignoperation` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `FROM_` bigint(20) default NULL,
  `TO_` bigint(20) default NULL,
  `ASSIGN_` bigint(20) default NULL,
  `ASSIGNINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_OPERATION_ASSIGN` (`ASSIGN_`),
  KEY `FK_COPY_TO` (`TO_`),
  KEY `FK_COPY_FROM` (`FROM_`),
  CONSTRAINT `FK_COPY_FROM` FOREIGN KEY (`FROM_`) REFERENCES `bpel_from` (`ID_`),
  CONSTRAINT `FK_COPY_TO` FOREIGN KEY (`TO_`) REFERENCES `bpel_to` (`ID_`),
  CONSTRAINT `FK_OPERATION_ASSIGN` FOREIGN KEY (`ASSIGN_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_assignoperation`
--


/*!40000 ALTER TABLE `bpel_assignoperation` DISABLE KEYS */;
LOCK TABLES `bpel_assignoperation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_assignoperation` ENABLE KEYS */;

--
-- Table structure for table `bpel_correlation`
--

DROP TABLE IF EXISTS `bpel_correlation`;
CREATE TABLE `bpel_correlation` (
  `id` bigint(20) NOT NULL auto_increment,
  `initiate` varchar(255) default NULL,
  `CORRELATIONSET_` bigint(20) default NULL,
  `CORRELATIONS_` bigint(20) default NULL,
  `CSETNAME_` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_CSETDEF_CORRELATION` (`CORRELATIONSET_`),
  KEY `FK_CORRELATIONS_CORRELATION` (`CORRELATIONS_`),
  CONSTRAINT `FK_CORRELATIONS_CORRELATION` FOREIGN KEY (`CORRELATIONS_`) REFERENCES `bpel_correlations` (`id`),
  CONSTRAINT `FK_CSETDEF_CORRELATION` FOREIGN KEY (`CORRELATIONSET_`) REFERENCES `bpel_correlationsetdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_correlation`
--


/*!40000 ALTER TABLE `bpel_correlation` DISABLE KEYS */;
LOCK TABLES `bpel_correlation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_correlation` ENABLE KEYS */;

--
-- Table structure for table `bpel_correlations`
--

DROP TABLE IF EXISTS `bpel_correlations`;
CREATE TABLE `bpel_correlations` (
  `id` bigint(20) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_correlations`
--


/*!40000 ALTER TABLE `bpel_correlations` DISABLE KEYS */;
LOCK TABLES `bpel_correlations` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_correlations` ENABLE KEYS */;

--
-- Table structure for table `bpel_correlationset_property`
--

DROP TABLE IF EXISTS `bpel_correlationset_property`;
CREATE TABLE `bpel_correlationset_property` (
  `CORRELATIONSET_` bigint(20) NOT NULL,
  `VALUE_` varchar(255) default NULL,
  `LOCALNAME_` varchar(255) NOT NULL,
  `NAMESPACE_` varchar(255) NOT NULL,
  PRIMARY KEY  (`CORRELATIONSET_`,`LOCALNAME_`,`NAMESPACE_`),
  KEY `FK_SETINST_PROPERTY` (`CORRELATIONSET_`),
  CONSTRAINT `FK_SETINST_PROPERTY` FOREIGN KEY (`CORRELATIONSET_`) REFERENCES `bpel_correlationsetinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_correlationset_property`
--


/*!40000 ALTER TABLE `bpel_correlationset_property` DISABLE KEYS */;
LOCK TABLES `bpel_correlationset_property` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_correlationset_property` ENABLE KEYS */;

--
-- Table structure for table `bpel_correlationsetdefinition`
--

DROP TABLE IF EXISTS `bpel_correlationsetdefinition`;
CREATE TABLE `bpel_correlationsetdefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `SCOPE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_SCOPE_CORRELATIONSETS` (`SCOPE_`),
  CONSTRAINT `FK_SCOPE_CORRELATIONSETS` FOREIGN KEY (`SCOPE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_correlationsetdefinition`
--


/*!40000 ALTER TABLE `bpel_correlationsetdefinition` DISABLE KEYS */;
LOCK TABLES `bpel_correlationsetdefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_correlationsetdefinition` ENABLE KEYS */;

--
-- Table structure for table `bpel_correlationsetinstance`
--

DROP TABLE IF EXISTS `bpel_correlationsetinstance`;
CREATE TABLE `bpel_correlationsetinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `DEFINITION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_CSETINST_CSETDEF` (`DEFINITION_`),
  CONSTRAINT `FK_CSETINST_CSETDEF` FOREIGN KEY (`DEFINITION_`) REFERENCES `bpel_correlationsetdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_correlationsetinstance`
--


/*!40000 ALTER TABLE `bpel_correlationsetinstance` DISABLE KEYS */;
LOCK TABLES `bpel_correlationsetinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_correlationsetinstance` ENABLE KEYS */;

--
-- Table structure for table `bpel_endpointreference`
--

DROP TABLE IF EXISTS `bpel_endpointreference`;
CREATE TABLE `bpel_endpointreference` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `SCHEME_` varchar(255) default NULL,
  `PORTTYPELOCALNAME_` varchar(255) default NULL,
  `PORTTYPENAMESPACE_` varchar(255) default NULL,
  `ADDRESS_` varchar(255) default NULL,
  `SERVICELOCALNAME_` varchar(255) default NULL,
  `SERVICENAMESPACE_` varchar(255) default NULL,
  `PORTNAME_` varchar(255) default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_endpointreference`
--


/*!40000 ALTER TABLE `bpel_endpointreference` DISABLE KEYS */;
LOCK TABLES `bpel_endpointreference` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_endpointreference` ENABLE KEYS */;

--
-- Table structure for table `bpel_faultinstance`
--

DROP TABLE IF EXISTS `bpel_faultinstance`;
CREATE TABLE `bpel_faultinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `ELEMENTVALUE_` blob,
  `MESSAGEVALUE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_FLTINST_MSGVALUE` (`MESSAGEVALUE_`),
  CONSTRAINT `FK_FLTINST_MSGVALUE` FOREIGN KEY (`MESSAGEVALUE_`) REFERENCES `bpel_messagevalue` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_faultinstance`
--


/*!40000 ALTER TABLE `bpel_faultinstance` DISABLE KEYS */;
LOCK TABLES `bpel_faultinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_faultinstance` ENABLE KEYS */;

--
-- Table structure for table `bpel_from`
--

DROP TABLE IF EXISTS `bpel_from`;
CREATE TABLE `bpel_from` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VARIABLE_` bigint(20) default NULL,
  `PART_` varchar(255) default NULL,
  `QUERY_` bigint(20) default NULL,
  `PROPERTY_` bigint(20) default NULL,
  `PARTNERLINK_` bigint(20) default NULL,
  `REFERENCE_` varchar(255) default NULL,
  `EXPRESSION_` bigint(20) default NULL,
  `ELEMENT_` blob,
  `TEXT_` text,
  PRIMARY KEY  (`ID_`),
  KEY `FK_FROM_PARTNERLINK` (`PARTNERLINK_`),
  KEY `FK_FROM_VARIABLE` (`VARIABLE_`),
  KEY `FK_FROM_PROPERTY` (`PROPERTY_`),
  KEY `FK_FROM_QUERY` (`QUERY_`),
  KEY `FK_FROM_EXPRESSION` (`EXPRESSION_`),
  CONSTRAINT `FK_FROM_EXPRESSION` FOREIGN KEY (`EXPRESSION_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_FROM_PARTNERLINK` FOREIGN KEY (`PARTNERLINK_`) REFERENCES `bpel_partnerlinkdefinition` (`ID_`),
  CONSTRAINT `FK_FROM_PROPERTY` FOREIGN KEY (`PROPERTY_`) REFERENCES `bpel_property` (`ID_`),
  CONSTRAINT `FK_FROM_QUERY` FOREIGN KEY (`QUERY_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_FROM_VARIABLE` FOREIGN KEY (`VARIABLE_`) REFERENCES `bpel_variabledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_from`
--


/*!40000 ALTER TABLE `bpel_from` DISABLE KEYS */;
LOCK TABLES `bpel_from` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_from` ENABLE KEYS */;

--
-- Table structure for table `bpel_import`
--

DROP TABLE IF EXISTS `bpel_import`;
CREATE TABLE `bpel_import` (
  `id` bigint(20) NOT NULL auto_increment,
  `NAMESPACE_` varchar(255) default NULL,
  `LOCATION_` varchar(255) default NULL,
  `TYPE_` varchar(255) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  `IMPORTSINDEX_` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_IMPORTDEF_IMPORT` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_IMPORT` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_import`
--


/*!40000 ALTER TABLE `bpel_import` DISABLE KEYS */;
LOCK TABLES `bpel_import` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_import` ENABLE KEYS */;

--
-- Table structure for table `bpel_linkdefinition`
--

DROP TABLE IF EXISTS `bpel_linkdefinition`;
CREATE TABLE `bpel_linkdefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `CONDITION_` bigint(20) default NULL,
  `SOURCE_` bigint(20) default NULL,
  `TARGET_` bigint(20) default NULL,
  `SOURCEINDEX_` int(11) default NULL,
  `TARGETINDEX_` int(11) default NULL,
  `FLOW_` bigint(20) default NULL,
  `FLOWINDEX_` varchar(255) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_LINKDEF_CONDITION` (`CONDITION_`),
  KEY `FK_ACTIVITY_TARGET` (`TARGET_`),
  KEY `FK_FLOW_LINK` (`FLOW_`),
  KEY `FK_ACTIVITY_SOURCE` (`SOURCE_`),
  CONSTRAINT `FK_ACTIVITY_SOURCE` FOREIGN KEY (`SOURCE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_ACTIVITY_TARGET` FOREIGN KEY (`TARGET_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_FLOW_LINK` FOREIGN KEY (`FLOW_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LINKDEF_CONDITION` FOREIGN KEY (`CONDITION_`) REFERENCES `bpel_snippet` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_linkdefinition`
--


/*!40000 ALTER TABLE `bpel_linkdefinition` DISABLE KEYS */;
LOCK TABLES `bpel_linkdefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_linkdefinition` ENABLE KEYS */;

--
-- Table structure for table `bpel_linkinstance`
--

DROP TABLE IF EXISTS `bpel_linkinstance`;
CREATE TABLE `bpel_linkinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `STATUS_` bit(1) default NULL,
  `DEFINITION_` bigint(20) default NULL,
  `TARGETTOKEN_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_LINKINST_TOKEN` (`TARGETTOKEN_`),
  KEY `FK_LINKINST_LINKDEF` (`DEFINITION_`),
  CONSTRAINT `FK_LINKINST_LINKDEF` FOREIGN KEY (`DEFINITION_`) REFERENCES `bpel_linkdefinition` (`ID_`),
  CONSTRAINT `FK_LINKINST_TOKEN` FOREIGN KEY (`TARGETTOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_linkinstance`
--


/*!40000 ALTER TABLE `bpel_linkinstance` DISABLE KEYS */;
LOCK TABLES `bpel_linkinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_linkinstance` ENABLE KEYS */;

--
-- Table structure for table `bpel_messagevalue`
--

DROP TABLE IF EXISTS `bpel_messagevalue`;
CREATE TABLE `bpel_messagevalue` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `TYPE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_MSGVALUE_MSGTYPE` (`TYPE_`),
  CONSTRAINT `FK_MSGVALUE_MSGTYPE` FOREIGN KEY (`TYPE_`) REFERENCES `bpel_variabletype` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_messagevalue`
--


/*!40000 ALTER TABLE `bpel_messagevalue` DISABLE KEYS */;
LOCK TABLES `bpel_messagevalue` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_messagevalue` ENABLE KEYS */;

--
-- Table structure for table `bpel_messagevalue_part`
--

DROP TABLE IF EXISTS `bpel_messagevalue_part`;
CREATE TABLE `bpel_messagevalue_part` (
  `MSGVALUE_` bigint(20) NOT NULL,
  `VALUE_` blob,
  `NAME_` varchar(255) NOT NULL,
  PRIMARY KEY  (`MSGVALUE_`,`NAME_`),
  KEY `FK_PART_MSGVALUE` (`MSGVALUE_`),
  CONSTRAINT `FK_PART_MSGVALUE` FOREIGN KEY (`MSGVALUE_`) REFERENCES `bpel_messagevalue` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_messagevalue_part`
--


/*!40000 ALTER TABLE `bpel_messagevalue_part` DISABLE KEYS */;
LOCK TABLES `bpel_messagevalue_part` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_messagevalue_part` ENABLE KEYS */;

--
-- Table structure for table `bpel_namespace`
--

DROP TABLE IF EXISTS `bpel_namespace`;
CREATE TABLE `bpel_namespace` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `URI_` varchar(255) default NULL,
  `PREFIX_` varchar(255) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_PROCESSDEF_NAMESPACE` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_PROCESSDEF_NAMESPACE` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_namespace`
--


/*!40000 ALTER TABLE `bpel_namespace` DISABLE KEYS */;
LOCK TABLES `bpel_namespace` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_namespace` ENABLE KEYS */;

--
-- Table structure for table `bpel_partnerlinkdefinition`
--

DROP TABLE IF EXISTS `bpel_partnerlinkdefinition`;
CREATE TABLE `bpel_partnerlinkdefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `PARTNERFIRST_` bit(1) default NULL,
  `PARTNERLINKTYPE_` bigint(20) default NULL,
  `SCOPE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_SCOPE_PARTNERLINKS` (`SCOPE_`),
  KEY `FK_PLINKTYPE_PLINKDEF` (`PARTNERLINKTYPE_`),
  CONSTRAINT `FK_PLINKTYPE_PLINKDEF` FOREIGN KEY (`PARTNERLINKTYPE_`) REFERENCES `bpel_partnerlinktype` (`id`),
  CONSTRAINT `FK_SCOPE_PARTNERLINKS` FOREIGN KEY (`SCOPE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_partnerlinkdefinition`
--


/*!40000 ALTER TABLE `bpel_partnerlinkdefinition` DISABLE KEYS */;
LOCK TABLES `bpel_partnerlinkdefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_partnerlinkdefinition` ENABLE KEYS */;

--
-- Table structure for table `bpel_partnerlinkinstance`
--

DROP TABLE IF EXISTS `bpel_partnerlinkinstance`;
CREATE TABLE `bpel_partnerlinkinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `DEFINITION_` bigint(20) default NULL,
  `PARTNERREFERENCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_PLINKINST_PARTNERREF` (`PARTNERREFERENCE_`),
  KEY `FK_PLINKINST_PLINKDEF` (`DEFINITION_`),
  CONSTRAINT `FK_PLINKINST_PLINKDEF` FOREIGN KEY (`DEFINITION_`) REFERENCES `bpel_partnerlinkdefinition` (`ID_`),
  CONSTRAINT `FK_PLINKINST_PARTNERREF` FOREIGN KEY (`PARTNERREFERENCE_`) REFERENCES `bpel_endpointreference` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_partnerlinkinstance`
--


/*!40000 ALTER TABLE `bpel_partnerlinkinstance` DISABLE KEYS */;
LOCK TABLES `bpel_partnerlinkinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_partnerlinkinstance` ENABLE KEYS */;

--
-- Table structure for table `bpel_partnerlinktype`
--

DROP TABLE IF EXISTS `bpel_partnerlinktype`;
CREATE TABLE `bpel_partnerlinktype` (
  `id` bigint(20) NOT NULL auto_increment,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `FIRSTROLE_` bigint(20) default NULL,
  `SECONDROLE_` bigint(20) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_PLINKTYPE_FIRSTROLE` (`FIRSTROLE_`),
  KEY `FK_PLINKTYPE_SECONDROLE` (`SECONDROLE_`),
  KEY `FK_IMPORTDEF_PARTNERLINKTYPE` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_PARTNERLINKTYPE` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_PLINKTYPE_FIRSTROLE` FOREIGN KEY (`FIRSTROLE_`) REFERENCES `bpel_role` (`id`),
  CONSTRAINT `FK_PLINKTYPE_SECONDROLE` FOREIGN KEY (`SECONDROLE_`) REFERENCES `bpel_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_partnerlinktype`
--


/*!40000 ALTER TABLE `bpel_partnerlinktype` DISABLE KEYS */;
LOCK TABLES `bpel_partnerlinktype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_partnerlinktype` ENABLE KEYS */;

--
-- Table structure for table `bpel_property`
--

DROP TABLE IF EXISTS `bpel_property`;
CREATE TABLE `bpel_property` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `TYPELOCALNAME_` varchar(255) default NULL,
  `TYPENAMESPACE_` varchar(255) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  `PROPERTIES_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_CSETDEF_PROPERTY` (`PROPERTIES_`),
  KEY `FK_IMPORTDEF_PROPERTY` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_PROPERTY` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_CSETDEF_PROPERTY` FOREIGN KEY (`PROPERTIES_`) REFERENCES `bpel_correlationsetdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_property`
--


/*!40000 ALTER TABLE `bpel_property` DISABLE KEYS */;
LOCK TABLES `bpel_property` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_property` ENABLE KEYS */;

--
-- Table structure for table `bpel_propertyalias`
--

DROP TABLE IF EXISTS `bpel_propertyalias`;
CREATE TABLE `bpel_propertyalias` (
  `id` bigint(20) NOT NULL auto_increment,
  `PROPERTY_` bigint(20) default NULL,
  `MESSAGE_` bigint(20) default NULL,
  `PART_` varchar(255) default NULL,
  `TYPELOCALNAME_` varchar(255) default NULL,
  `TYPENAMESPACE_` varchar(255) default NULL,
  `ELEMENTLOCALNAME_` varchar(255) default NULL,
  `ELEMENTNAMESPACE_` varchar(255) default NULL,
  `QUERY_` bigint(20) default NULL,
  `VARIABLETYPE_` bigint(20) default NULL,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_ALIAS_MESSAGE` (`MESSAGE_`),
  KEY `FK_ALIAS_QUERY` (`QUERY_`),
  KEY `FK_ALIAS_PROPERTY` (`PROPERTY_`),
  KEY `FK_VARIABLETYPE_PROPERTYALIAS` (`VARIABLETYPE_`),
  CONSTRAINT `FK_VARIABLETYPE_PROPERTYALIAS` FOREIGN KEY (`VARIABLETYPE_`) REFERENCES `bpel_variabletype` (`ID_`),
  CONSTRAINT `FK_ALIAS_MESSAGE` FOREIGN KEY (`MESSAGE_`) REFERENCES `wsdl_message` (`ID_`),
  CONSTRAINT `FK_ALIAS_PROPERTY` FOREIGN KEY (`PROPERTY_`) REFERENCES `bpel_property` (`ID_`),
  CONSTRAINT `FK_ALIAS_QUERY` FOREIGN KEY (`QUERY_`) REFERENCES `bpel_snippet` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_propertyalias`
--


/*!40000 ALTER TABLE `bpel_propertyalias` DISABLE KEYS */;
LOCK TABLES `bpel_propertyalias` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_propertyalias` ENABLE KEYS */;

--
-- Table structure for table `bpel_role`
--

DROP TABLE IF EXISTS `bpel_role`;
CREATE TABLE `bpel_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `PORTTYPE_` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_ROLE_PORTTYPE` (`PORTTYPE_`),
  CONSTRAINT `FK_ROLE_PORTTYPE` FOREIGN KEY (`PORTTYPE_`) REFERENCES `wsdl_porttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_role`
--


/*!40000 ALTER TABLE `bpel_role` DISABLE KEYS */;
LOCK TABLES `bpel_role` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_role` ENABLE KEYS */;

--
-- Table structure for table `bpel_scopeinstance`
--

DROP TABLE IF EXISTS `bpel_scopeinstance`;
CREATE TABLE `bpel_scopeinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `STATE_` varchar(255) default NULL,
  `DEFINITION_` bigint(20) default NULL,
  `TOKEN_` bigint(20) default NULL,
  `FAULTINSTANCE_` bigint(20) default NULL,
  `COMPENSATORCLASS_` char(1) default NULL,
  `COMPENSATOR_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_SCOPEINST_TOKEN` (`TOKEN_`),
  KEY `FK_SCOPEINST_FAULTINST` (`FAULTINSTANCE_`),
  KEY `FK_SCOPEINST_SCOPEDEF` (`DEFINITION_`),
  CONSTRAINT `FK_SCOPEINST_SCOPEDEF` FOREIGN KEY (`DEFINITION_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_SCOPEINST_FAULTINST` FOREIGN KEY (`FAULTINSTANCE_`) REFERENCES `bpel_faultinstance` (`ID_`),
  CONSTRAINT `FK_SCOPEINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_scopeinstance`
--


/*!40000 ALTER TABLE `bpel_scopeinstance` DISABLE KEYS */;
LOCK TABLES `bpel_scopeinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_scopeinstance` ENABLE KEYS */;

--
-- Table structure for table `bpel_snippet`
--

DROP TABLE IF EXISTS `bpel_snippet`;
CREATE TABLE `bpel_snippet` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `TEXT_` varchar(255) default NULL,
  `LANGUAGE_` varchar(255) default NULL,
  `IF_` bigint(20) default NULL,
  `IFINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_IF_CONDITION` (`IF_`),
  CONSTRAINT `FK_IF_CONDITION` FOREIGN KEY (`IF_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_snippet`
--


/*!40000 ALTER TABLE `bpel_snippet` DISABLE KEYS */;
LOCK TABLES `bpel_snippet` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_snippet` ENABLE KEYS */;

--
-- Table structure for table `bpel_snippet_namespace`
--

DROP TABLE IF EXISTS `bpel_snippet_namespace`;
CREATE TABLE `bpel_snippet_namespace` (
  `SNIPPET_` bigint(20) NOT NULL,
  `NAMESPACE_` bigint(20) NOT NULL,
  PRIMARY KEY  (`SNIPPET_`,`NAMESPACE_`),
  KEY `FK32DD102F704A8F6C` (`NAMESPACE_`),
  KEY `FK_SNIPPET_NAMESPACE` (`SNIPPET_`),
  CONSTRAINT `FK_SNIPPET_NAMESPACE` FOREIGN KEY (`SNIPPET_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK32DD102F704A8F6C` FOREIGN KEY (`NAMESPACE_`) REFERENCES `bpel_namespace` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_snippet_namespace`
--


/*!40000 ALTER TABLE `bpel_snippet_namespace` DISABLE KEYS */;
LOCK TABLES `bpel_snippet_namespace` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_snippet_namespace` ENABLE KEYS */;

--
-- Table structure for table `bpel_to`
--

DROP TABLE IF EXISTS `bpel_to`;
CREATE TABLE `bpel_to` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VARIABLE_` bigint(20) default NULL,
  `PART_` varchar(255) default NULL,
  `QUERY_` bigint(20) default NULL,
  `PROPERTY_` bigint(20) default NULL,
  `PARTNERLINK_` bigint(20) default NULL,
  `EXPRESSION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_TO_PARTNERLINK` (`PARTNERLINK_`),
  KEY `FK_TO_VARIABLE` (`VARIABLE_`),
  KEY `FK_TO_PROPERTY` (`PROPERTY_`),
  KEY `FK_TO_QUERY` (`QUERY_`),
  KEY `FK_TO_EXPRESSION` (`EXPRESSION_`),
  CONSTRAINT `FK_TO_EXPRESSION` FOREIGN KEY (`EXPRESSION_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_TO_PARTNERLINK` FOREIGN KEY (`PARTNERLINK_`) REFERENCES `bpel_partnerlinkdefinition` (`ID_`),
  CONSTRAINT `FK_TO_PROPERTY` FOREIGN KEY (`PROPERTY_`) REFERENCES `bpel_property` (`ID_`),
  CONSTRAINT `FK_TO_QUERY` FOREIGN KEY (`QUERY_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_TO_VARIABLE` FOREIGN KEY (`VARIABLE_`) REFERENCES `bpel_variabledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_to`
--


/*!40000 ALTER TABLE `bpel_to` DISABLE KEYS */;
LOCK TABLES `bpel_to` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_to` ENABLE KEYS */;

--
-- Table structure for table `bpel_variabledefinition`
--

DROP TABLE IF EXISTS `bpel_variabledefinition`;
CREATE TABLE `bpel_variabledefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `TYPE_` bigint(20) default NULL,
  `SCOPE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_VARIABLEDEF_TYPE` (`TYPE_`),
  KEY `FK_SCOPE_VARIABLES` (`SCOPE_`),
  CONSTRAINT `FK_SCOPE_VARIABLES` FOREIGN KEY (`SCOPE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_VARIABLEDEF_TYPE` FOREIGN KEY (`TYPE_`) REFERENCES `bpel_variabletype` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_variabledefinition`
--


/*!40000 ALTER TABLE `bpel_variabledefinition` DISABLE KEYS */;
LOCK TABLES `bpel_variabledefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_variabledefinition` ENABLE KEYS */;

--
-- Table structure for table `bpel_variabletype`
--

DROP TABLE IF EXISTS `bpel_variabletype`;
CREATE TABLE `bpel_variabletype` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `MESSAGE_` bigint(20) default NULL,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_MESSAGETYPE_MESSAGE` (`MESSAGE_`),
  KEY `FK_IMPORTDEF_MESSAGETYPE` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_MESSAGETYPE` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_MESSAGETYPE_MESSAGE` FOREIGN KEY (`MESSAGE_`) REFERENCES `wsdl_message` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpel_variabletype`
--


/*!40000 ALTER TABLE `bpel_variabletype` DISABLE KEYS */;
LOCK TABLES `bpel_variabletype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bpel_variabletype` ENABLE KEYS */;

--
-- Table structure for table `catalogentry`
--

DROP TABLE IF EXISTS `catalogentry`;
CREATE TABLE `catalogentry` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `BASELOCATION_` varchar(255) default NULL,
  `DESCRIPTIONBODY_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_CATALOGENTRY_ARRAY` (`DESCRIPTIONBODY_`),
  CONSTRAINT `FK_CATALOGENTRY_ARRAY` FOREIGN KEY (`DESCRIPTIONBODY_`) REFERENCES `jbpm_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalogentry`
--


/*!40000 ALTER TABLE `catalogentry` DISABLE KEYS */;
LOCK TABLES `catalogentry` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `catalogentry` ENABLE KEYS */;

--
-- Table structure for table `jbpm_action`
--

DROP TABLE IF EXISTS `jbpm_action`;
CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `ISPROPAGATIONALLOWED_` bit(1) default NULL,
  `ACTIONEXPRESSION_` varchar(255) default NULL,
  `ISASYNC_` bit(1) default NULL,
  `REFERENCEDACTION_` bigint(20) default NULL,
  `ACTIONDELEGATION_` bigint(20) default NULL,
  `EVENT_` bigint(20) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `TIMERNAME_` varchar(255) default NULL,
  `DUEDATE_` varchar(255) default NULL,
  `REPEAT_` varchar(255) default NULL,
  `TRANSITIONNAME_` varchar(255) default NULL,
  `TIMERACTION_` bigint(20) default NULL,
  `FOR_` bigint(20) default NULL,
  `UNTIL_` bigint(20) default NULL,
  `REPEATEVERY_` bigint(20) default NULL,
  `TIMEACTIVITYCLASS_` char(1) default NULL,
  `TIMEACTIVITY_` bigint(20) default NULL,
  `PARTNERLINKDEFINITION_` bigint(20) default NULL,
  `OPERATION_` bigint(20) default NULL,
  `MESSAGEEXCHANGE_` varchar(255) default NULL,
  `VARIABLEDEFINITION_` bigint(20) default NULL,
  `CORRELATIONS_` bigint(20) default NULL,
  `MESSAGEACTIVITYCLASS_` char(1) default NULL,
  `MESSAGEACTIVITY_` bigint(20) default NULL,
  `FAULTLOCALNAME_` varchar(255) default NULL,
  `FAULTNAMESPACE_` varchar(255) default NULL,
  `OUTPUTVARIABLEDEFINITION_` bigint(20) default NULL,
  `RESPONSECORRELATIONS_` bigint(20) default NULL,
  `EXPRESSION_` text,
  `EVENTINDEX_` int(11) default NULL,
  `EXCEPTIONHANDLER_` bigint(20) default NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) default NULL,
  `PICK_MESSAGE_` bigint(20) default NULL,
  `PICKINDEX_` int(11) default NULL,
  `PICK_ALARM_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_ACTION_EVENT` (`EVENT_`),
  KEY `IDX_ACTION_ACTNDL` (`ACTIONDELEGATION_`),
  KEY `IDX_ACTION_PROCDF` (`PROCESSDEFINITION_`),
  KEY `FK_ALARM_UNTIL` (`UNTIL_`),
  KEY `FK_ACTION_EVENT` (`EVENT_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  KEY `FK_ALARM_REPEAT` (`REPEATEVERY_`),
  KEY `FK_PICK_ONALARM` (`PICK_ALARM_`),
  KEY `FK_MESSAGECOMP_OPERATION` (`OPERATION_`),
  KEY `FK_ALARM_FOR` (`FOR_`),
  KEY `FK_INVOKER_CORRELATIONS` (`CORRELATIONS_`),
  KEY `FK_INVOKER_VARIABLEDEF` (`VARIABLEDEFINITION_`),
  KEY `FK_INVOKER_RSPCORRELATIONS` (`RESPONSECORRELATIONS_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  KEY `FK_INVOKER_OUTPUTVARDEF` (`OUTPUTVARIABLEDEFINITION_`),
  KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  KEY `FK_MESSAGECOMP_PLINKDEF` (`PARTNERLINKDEFINITION_`),
  KEY `FK_PICK_ONMESSAGE` (`PICK_MESSAGE_`),
  CONSTRAINT `FK_PICK_ONMESSAGE` FOREIGN KEY (`PICK_MESSAGE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `jbpm_event` (`ID_`),
  CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `jbpm_exceptionhandler` (`ID_`),
  CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_ALARM_FOR` FOREIGN KEY (`FOR_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_ALARM_REPEAT` FOREIGN KEY (`REPEATEVERY_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_ALARM_UNTIL` FOREIGN KEY (`UNTIL_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_INVOKER_CORRELATIONS` FOREIGN KEY (`CORRELATIONS_`) REFERENCES `bpel_correlations` (`id`),
  CONSTRAINT `FK_INVOKER_OUTPUTVARDEF` FOREIGN KEY (`OUTPUTVARIABLEDEFINITION_`) REFERENCES `bpel_variabledefinition` (`ID_`),
  CONSTRAINT `FK_INVOKER_RSPCORRELATIONS` FOREIGN KEY (`RESPONSECORRELATIONS_`) REFERENCES `bpel_correlations` (`id`),
  CONSTRAINT `FK_INVOKER_VARIABLEDEF` FOREIGN KEY (`VARIABLEDEFINITION_`) REFERENCES `bpel_variabledefinition` (`ID_`),
  CONSTRAINT `FK_MESSAGECOMP_OPERATION` FOREIGN KEY (`OPERATION_`) REFERENCES `wsdl_operation` (`ID_`),
  CONSTRAINT `FK_MESSAGECOMP_PLINKDEF` FOREIGN KEY (`PARTNERLINKDEFINITION_`) REFERENCES `bpel_partnerlinkdefinition` (`ID_`),
  CONSTRAINT `FK_PICK_ONALARM` FOREIGN KEY (`PICK_ALARM_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_action`
--


/*!40000 ALTER TABLE `jbpm_action` DISABLE KEYS */;
LOCK TABLES `jbpm_action` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_action` ENABLE KEYS */;

--
-- Table structure for table `jbpm_aspect_log`
--

DROP TABLE IF EXISTS `jbpm_aspect_log`;
CREATE TABLE `jbpm_aspect_log` (
  `id` int(11) NOT NULL auto_increment,
  `recordtime` datetime NOT NULL,
  `processdefid` int(11) default NULL,
  `instanceid` int(11) default NULL,
  `loginfo` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_aspect_log`
--


/*!40000 ALTER TABLE `jbpm_aspect_log` DISABLE KEYS */;
LOCK TABLES `jbpm_aspect_log` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_aspect_log` ENABLE KEYS */;

--
-- Table structure for table `jbpm_aspect_uploadedaspect`
--

DROP TABLE IF EXISTS `jbpm_aspect_uploadedaspect`;
CREATE TABLE `jbpm_aspect_uploadedaspect` (
  `id` int(11) NOT NULL auto_increment,
  `uploadedtime` datetime NOT NULL,
  `processid` int(11) NOT NULL,
  `aspectname` varchar(45) NOT NULL,
  `aspectBytes` mediumblob NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_aspect_uploadedaspect`
--


/*!40000 ALTER TABLE `jbpm_aspect_uploadedaspect` DISABLE KEYS */;
LOCK TABLES `jbpm_aspect_uploadedaspect` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_aspect_uploadedaspect` ENABLE KEYS */;

--
-- Table structure for table `jbpm_aspect_uploadedprocess`
--

DROP TABLE IF EXISTS `jbpm_aspect_uploadedprocess`;
CREATE TABLE `jbpm_aspect_uploadedprocess` (
  `id` int(11) NOT NULL auto_increment,
  `loadedtime` datetime NOT NULL,
  `parentmodelname` varchar(45) NOT NULL,
  `state` int(11) NOT NULL,
  `modelname` varchar(45) NOT NULL,
  `modelbytes` mediumblob NOT NULL,
  `processDefId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_aspect_uploadedprocess`
--


/*!40000 ALTER TABLE `jbpm_aspect_uploadedprocess` DISABLE KEYS */;
LOCK TABLES `jbpm_aspect_uploadedprocess` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_aspect_uploadedprocess` ENABLE KEYS */;

--
-- Table structure for table `jbpm_bytearray`
--

DROP TABLE IF EXISTS `jbpm_bytearray`;
CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `FILEDEFINITION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`),
  CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_bytearray`
--


/*!40000 ALTER TABLE `jbpm_bytearray` DISABLE KEYS */;
LOCK TABLES `jbpm_bytearray` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_bytearray` ENABLE KEYS */;

--
-- Table structure for table `jbpm_byteblock`
--

DROP TABLE IF EXISTS `jbpm_byteblock`;
CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY  (`PROCESSFILE_`,`INDEX_`),
  KEY `FK_BYTEBLOCK_FILE` (`PROCESSFILE_`),
  CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `jbpm_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_byteblock`
--


/*!40000 ALTER TABLE `jbpm_byteblock` DISABLE KEYS */;
LOCK TABLES `jbpm_byteblock` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_byteblock` ENABLE KEYS */;

--
-- Table structure for table `jbpm_comment`
--

DROP TABLE IF EXISTS `jbpm_comment`;
CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) default NULL,
  `TIME_` datetime default NULL,
  `MESSAGE_` text,
  `TOKEN_` bigint(20) default NULL,
  `TASKINSTANCE_` bigint(20) default NULL,
  `TOKENINDEX_` int(11) default NULL,
  `TASKINSTANCEINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_COMMENT_TOKEN` (`TOKEN_`),
  KEY `IDX_COMMENT_TSK` (`TASKINSTANCE_`),
  KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`),
  CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_comment`
--


/*!40000 ALTER TABLE `jbpm_comment` DISABLE KEYS */;
LOCK TABLES `jbpm_comment` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_comment` ENABLE KEYS */;

--
-- Table structure for table `jbpm_decisionconditions`
--

DROP TABLE IF EXISTS `jbpm_decisionconditions`;
CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) default NULL,
  `EXPRESSION_` varchar(255) default NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY  (`DECISION_`,`INDEX_`),
  KEY `FK_DECCOND_DEC` (`DECISION_`),
  CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_decisionconditions`
--


/*!40000 ALTER TABLE `jbpm_decisionconditions` DISABLE KEYS */;
LOCK TABLES `jbpm_decisionconditions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_decisionconditions` ENABLE KEYS */;

--
-- Table structure for table `jbpm_delegation`
--

DROP TABLE IF EXISTS `jbpm_delegation`;
CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASSNAME_` text,
  `CONFIGURATION_` text,
  `CONFIGTYPE_` varchar(255) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_DELEG_PRCD` (`PROCESSDEFINITION_`),
  KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_delegation`
--


/*!40000 ALTER TABLE `jbpm_delegation` DISABLE KEYS */;
LOCK TABLES `jbpm_delegation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_delegation` ENABLE KEYS */;

--
-- Table structure for table `jbpm_event`
--

DROP TABLE IF EXISTS `jbpm_event`;
CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `EVENTTYPE_` varchar(255) default NULL,
  `TYPE_` char(1) default NULL,
  `GRAPHELEMENT_` bigint(20) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `NODE_` bigint(20) default NULL,
  `TRANSITION_` bigint(20) default NULL,
  `TASK_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_event`
--


/*!40000 ALTER TABLE `jbpm_event` DISABLE KEYS */;
LOCK TABLES `jbpm_event` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_event` ENABLE KEYS */;

--
-- Table structure for table `jbpm_exceptionhandler`
--

DROP TABLE IF EXISTS `jbpm_exceptionhandler`;
CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `EXCEPTIONCLASSNAME_` text,
  `TYPE_` char(1) default NULL,
  `GRAPHELEMENT_` bigint(20) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `GRAPHELEMENTINDEX_` int(11) default NULL,
  `NODE_` bigint(20) default NULL,
  `TRANSITION_` bigint(20) default NULL,
  `TASK_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_exceptionhandler`
--


/*!40000 ALTER TABLE `jbpm_exceptionhandler` DISABLE KEYS */;
LOCK TABLES `jbpm_exceptionhandler` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_exceptionhandler` ENABLE KEYS */;

--
-- Table structure for table `jbpm_id_group`
--

DROP TABLE IF EXISTS `jbpm_id_group`;
CREATE TABLE `jbpm_id_group` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `TYPE_` varchar(255) default NULL,
  `PARENT_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_ID_GRP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_ID_GRP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_group`
--


/*!40000 ALTER TABLE `jbpm_id_group` DISABLE KEYS */;
LOCK TABLES `jbpm_id_group` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_id_group` ENABLE KEYS */;

--
-- Table structure for table `jbpm_id_membership`
--

DROP TABLE IF EXISTS `jbpm_id_membership`;
CREATE TABLE `jbpm_id_membership` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `ROLE_` varchar(255) default NULL,
  `USER_` bigint(20) default NULL,
  `GROUP_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_ID_MEMSHIP_GRP` (`GROUP_`),
  KEY `FK_ID_MEMSHIP_USR` (`USER_`),
  CONSTRAINT `FK_ID_MEMSHIP_USR` FOREIGN KEY (`USER_`) REFERENCES `jbpm_id_user` (`ID_`),
  CONSTRAINT `FK_ID_MEMSHIP_GRP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_membership`
--


/*!40000 ALTER TABLE `jbpm_id_membership` DISABLE KEYS */;
LOCK TABLES `jbpm_id_membership` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_id_membership` ENABLE KEYS */;

--
-- Table structure for table `jbpm_id_permissions`
--

DROP TABLE IF EXISTS `jbpm_id_permissions`;
CREATE TABLE `jbpm_id_permissions` (
  `ENTITY_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) default NULL,
  `NAME_` varchar(255) default NULL,
  `ACTION_` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_permissions`
--


/*!40000 ALTER TABLE `jbpm_id_permissions` DISABLE KEYS */;
LOCK TABLES `jbpm_id_permissions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_id_permissions` ENABLE KEYS */;

--
-- Table structure for table `jbpm_id_user`
--

DROP TABLE IF EXISTS `jbpm_id_user`;
CREATE TABLE `jbpm_id_user` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `EMAIL_` varchar(255) default NULL,
  `PASSWORD_` varchar(255) default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_id_user`
--


/*!40000 ALTER TABLE `jbpm_id_user` DISABLE KEYS */;
LOCK TABLES `jbpm_id_user` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_id_user` ENABLE KEYS */;

--
-- Table structure for table `jbpm_job`
--

DROP TABLE IF EXISTS `jbpm_job`;
CREATE TABLE `jbpm_job` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime default NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `TOKEN_` bigint(20) default NULL,
  `TASKINSTANCE_` bigint(20) default NULL,
  `ISSUSPENDED_` bit(1) default NULL,
  `ISEXCLUSIVE_` bit(1) default NULL,
  `LOCKOWNER_` varchar(255) default NULL,
  `LOCKTIME_` datetime default NULL,
  `EXCEPTION_` text,
  `RETRIES_` int(11) default NULL,
  `NAME_` varchar(255) default NULL,
  `REPEAT_` varchar(255) default NULL,
  `TRANSITIONNAME_` varchar(255) default NULL,
  `ACTION_` bigint(20) default NULL,
  `GRAPHELEMENTTYPE_` varchar(255) default NULL,
  `GRAPHELEMENT_` bigint(20) default NULL,
  `NODE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_JOB_TSKINST` (`TASKINSTANCE_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `IDX_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_NODE` (`NODE_`),
  KEY `FK_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_ACTION` (`ACTION_`),
  KEY `FK_JOB_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_JOB_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_JOB_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_JOB_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_JOB_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_JOB_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_job`
--


/*!40000 ALTER TABLE `jbpm_job` DISABLE KEYS */;
LOCK TABLES `jbpm_job` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_job` ENABLE KEYS */;

--
-- Table structure for table `jbpm_log`
--

DROP TABLE IF EXISTS `jbpm_log`;
CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) default NULL,
  `DATE_` datetime default NULL,
  `TOKEN_` bigint(20) default NULL,
  `PARENT_` bigint(20) default NULL,
  `MESSAGE_` text,
  `EXCEPTION_` text,
  `ACTION_` bigint(20) default NULL,
  `NODE_` bigint(20) default NULL,
  `ENTER_` datetime default NULL,
  `LEAVE_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `NEWLONGVALUE_` bigint(20) default NULL,
  `TRANSITION_` bigint(20) default NULL,
  `CHILD_` bigint(20) default NULL,
  `SOURCENODE_` bigint(20) default NULL,
  `DESTINATIONNODE_` bigint(20) default NULL,
  `VARIABLEINSTANCE_` bigint(20) default NULL,
  `OLDBYTEARRAY_` bigint(20) default NULL,
  `NEWBYTEARRAY_` bigint(20) default NULL,
  `OLDDATEVALUE_` datetime default NULL,
  `NEWDATEVALUE_` datetime default NULL,
  `OLDDOUBLEVALUE_` double default NULL,
  `NEWDOUBLEVALUE_` double default NULL,
  `OLDLONGIDCLASS_` varchar(255) default NULL,
  `OLDLONGIDVALUE_` bigint(20) default NULL,
  `NEWLONGIDCLASS_` varchar(255) default NULL,
  `NEWLONGIDVALUE_` bigint(20) default NULL,
  `OLDSTRINGIDCLASS_` varchar(255) default NULL,
  `OLDSTRINGIDVALUE_` varchar(255) default NULL,
  `NEWSTRINGIDCLASS_` varchar(255) default NULL,
  `NEWSTRINGIDVALUE_` varchar(255) default NULL,
  `OLDLONGVALUE_` bigint(20) default NULL,
  `OLDSTRINGVALUE_` text,
  `NEWSTRINGVALUE_` text,
  `TASKINSTANCE_` bigint(20) default NULL,
  `TASKACTORID_` varchar(255) default NULL,
  `TASKOLDACTORID_` varchar(255) default NULL,
  `SWIMLANEINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`),
  CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_log` (`ID_`),
  CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `jbpm_variableinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_log`
--


/*!40000 ALTER TABLE `jbpm_log` DISABLE KEYS */;
LOCK TABLES `jbpm_log` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_log` ENABLE KEYS */;

--
-- Table structure for table `jbpm_moduledefinition`
--

DROP TABLE IF EXISTS `jbpm_moduledefinition`;
CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` text,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `STARTTASK_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_MODDEF_PROCDF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`),
  KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `jbpm_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_moduledefinition`
--


/*!40000 ALTER TABLE `jbpm_moduledefinition` DISABLE KEYS */;
LOCK TABLES `jbpm_moduledefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_moduledefinition` ENABLE KEYS */;

--
-- Table structure for table `jbpm_moduleinstance`
--

DROP TABLE IF EXISTS `jbpm_moduleinstance`;
CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `TASKMGMTDEFINITION_` bigint(20) default NULL,
  `NAME_` varchar(255) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_MODINST_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`),
  CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_moduleinstance`
--


/*!40000 ALTER TABLE `jbpm_moduleinstance` DISABLE KEYS */;
LOCK TABLES `jbpm_moduleinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_moduleinstance` ENABLE KEYS */;

--
-- Table structure for table `jbpm_node`
--

DROP TABLE IF EXISTS `jbpm_node`;
CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `ISASYNC_` bit(1) default NULL,
  `ISASYNCEXCL_` bit(1) default NULL,
  `ACTION_` bigint(20) default NULL,
  `SUPERSTATE_` bigint(20) default NULL,
  `SUBPROCNAME_` varchar(255) default NULL,
  `SUBPROCESSDEFINITION_` bigint(20) default NULL,
  `DECISIONEXPRESSION_` varchar(255) default NULL,
  `DECISIONDELEGATION` bigint(20) default NULL,
  `SCRIPT_` bigint(20) default NULL,
  `SIGNAL_` int(11) default NULL,
  `CREATETASKS_` bit(1) default NULL,
  `ENDTASKS_` bit(1) default NULL,
  `SUPPRESSJOINFAILURE_` bit(1) default NULL,
  `COMPOSITEACTIVITY_` bigint(20) default NULL,
  `JOINCONDITION_` bigint(20) default NULL,
  `CREATEINSTANCE_` bit(1) default NULL,
  `FAULTLOCALNAME_` varchar(255) default NULL,
  `FAULTNAMESPACE_` varchar(255) default NULL,
  `VARIABLE_` bigint(20) default NULL,
  `BEGIN_` bigint(20) default NULL,
  `END_` bigint(20) default NULL,
  `CONDITION_` bigint(20) default NULL,
  `LOOP_` bigint(20) default NULL,
  `COMPENSATIONHANDLER_` bigint(20) default NULL,
  `TERMINATIONHANDLER_` bigint(20) default NULL,
  `CATCHALL_` bigint(20) default NULL,
  `ISOLATED_` bit(1) default NULL,
  `ACTIVITY_` bigint(20) default NULL,
  `TARGET_` bigint(20) default NULL,
  `NODECOLLECTIONINDEX_` int(11) default NULL,
  `STRUCTUREDACTIVITY_` bigint(20) default NULL,
  `SCOPE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_PSTATE_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `IDX_NODE_SUPRSTATE` (`SUPERSTATE_`),
  KEY `IDX_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_NODE_ACTION` (`ACTION_`),
  KEY `FK_HANDLER_ACTIVITY` (`ACTIVITY_`),
  KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `FK_STRUCT_BEGIN` (`BEGIN_`),
  KEY `FK_SCOPE_CATCHALL` (`CATCHALL_`),
  KEY `FK_SCOPE_COMPENSATIONHANDLER` (`COMPENSATIONHANDLER_`),
  KEY `FK_ONEVENT_VARIABLE` (`VARIABLE_`),
  KEY `FK_STRUCT_END` (`END_`),
  KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_STRUCT_ACTIVITY` (`STRUCTUREDACTIVITY_`),
  KEY `FK_ACTIVITY_COMPOSITE` (`COMPOSITEACTIVITY_`),
  KEY `FK_REPETITIVE_CONDITION` (`CONDITION_`),
  KEY `FK_COMPENSATESCOPE_TARGET` (`TARGET_`),
  KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_NODE_SCRIPT` (`SCRIPT_`),
  KEY `FK_NODE_ACTION` (`ACTION_`),
  KEY `FK_SCOPE_ONALARM` (`SCOPE_`),
  KEY `FK_ACTIVITY_JOINCONDITION` (`JOINCONDITION_`),
  KEY `FK_REPETITIVE_LOOP` (`LOOP_`),
  KEY `FK_SCOPE_TERMINATIONHANDLER` (`TERMINATIONHANDLER_`),
  CONSTRAINT `FK_SCOPE_TERMINATIONHANDLER` FOREIGN KEY (`TERMINATIONHANDLER_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_ACTIVITY_COMPOSITE` FOREIGN KEY (`COMPOSITEACTIVITY_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_ACTIVITY_JOINCONDITION` FOREIGN KEY (`JOINCONDITION_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_COMPENSATESCOPE_TARGET` FOREIGN KEY (`TARGET_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_HANDLER_ACTIVITY` FOREIGN KEY (`ACTIVITY_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_NODE_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_ONEVENT_VARIABLE` FOREIGN KEY (`VARIABLE_`) REFERENCES `bpel_variabledefinition` (`ID_`),
  CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_REPETITIVE_CONDITION` FOREIGN KEY (`CONDITION_`) REFERENCES `bpel_snippet` (`ID_`),
  CONSTRAINT `FK_REPETITIVE_LOOP` FOREIGN KEY (`LOOP_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_SCOPE_CATCHALL` FOREIGN KEY (`CATCHALL_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_SCOPE_COMPENSATIONHANDLER` FOREIGN KEY (`COMPENSATIONHANDLER_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_SCOPE_ONALARM` FOREIGN KEY (`SCOPE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_STRUCT_ACTIVITY` FOREIGN KEY (`STRUCTUREDACTIVITY_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_STRUCT_BEGIN` FOREIGN KEY (`BEGIN_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_STRUCT_END` FOREIGN KEY (`END_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_node`
--


/*!40000 ALTER TABLE `jbpm_node` DISABLE KEYS */;
LOCK TABLES `jbpm_node` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_node` ENABLE KEYS */;

--
-- Table structure for table `jbpm_pooledactor`
--

DROP TABLE IF EXISTS `jbpm_pooledactor`;
CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) default NULL,
  `SWIMLANEINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  KEY `IDX_TSKINST_SWLANE` (`SWIMLANEINSTANCE_`),
  KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_pooledactor`
--


/*!40000 ALTER TABLE `jbpm_pooledactor` DISABLE KEYS */;
LOCK TABLES `jbpm_pooledactor` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_pooledactor` ENABLE KEYS */;

--
-- Table structure for table `jbpm_processdefinition`
--

DROP TABLE IF EXISTS `jbpm_processdefinition`;
CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `DESCRIPTION_` text,
  `VERSION_` int(11) default NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) default NULL,
  `STARTSTATE_` bigint(20) default NULL,
  `TARGETNAMESPACE_` varchar(255) default NULL,
  `EXPRESSIONLANG_` varchar(255) default NULL,
  `QUERYLANG_` varchar(255) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_PROCDEF_STRTST` (`STARTSTATE_`),
  KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`),
  CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_processdefinition`
--


/*!40000 ALTER TABLE `jbpm_processdefinition` DISABLE KEYS */;
LOCK TABLES `jbpm_processdefinition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_processdefinition` ENABLE KEYS */;

--
-- Table structure for table `jbpm_processinstance`
--

DROP TABLE IF EXISTS `jbpm_processinstance`;
CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) default NULL,
  `START_` datetime default NULL,
  `END_` datetime default NULL,
  `ISSUSPENDED_` bit(1) default NULL,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `ROOTTOKEN_` bigint(20) default NULL,
  `SUPERPROCESSTOKEN_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_PROCIN_ROOTTK` (`ROOTTOKEN_`),
  KEY `IDX_PROCIN_SPROCTK` (`SUPERPROCESSTOKEN_`),
  KEY `IDX_PROCIN_KEY` (`KEY_`),
  KEY `IDX_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`),
  CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_processinstance`
--


/*!40000 ALTER TABLE `jbpm_processinstance` DISABLE KEYS */;
LOCK TABLES `jbpm_processinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_processinstance` ENABLE KEYS */;

--
-- Table structure for table `jbpm_runtimeaction`
--

DROP TABLE IF EXISTS `jbpm_runtimeaction`;
CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) default NULL,
  `TYPE_` char(1) default NULL,
  `GRAPHELEMENT_` bigint(20) default NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `ACTION_` bigint(20) default NULL,
  `PROCESSINSTANCEINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_RTACTN_PRCINST` (`PROCESSINSTANCE_`),
  KEY `IDX_RTACTN_ACTION` (`ACTION_`),
  KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_RTACTN_ACTION` (`ACTION_`),
  CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_runtimeaction`
--


/*!40000 ALTER TABLE `jbpm_runtimeaction` DISABLE KEYS */;
LOCK TABLES `jbpm_runtimeaction` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_runtimeaction` ENABLE KEYS */;

--
-- Table structure for table `jbpm_swimlane`
--

DROP TABLE IF EXISTS `jbpm_swimlane`;
CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `ACTORIDEXPRESSION_` varchar(255) default NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) default NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) default NULL,
  `TASKMGMTDEFINITION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_swimlane`
--


/*!40000 ALTER TABLE `jbpm_swimlane` DISABLE KEYS */;
LOCK TABLES `jbpm_swimlane` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_swimlane` ENABLE KEYS */;

--
-- Table structure for table `jbpm_swimlaneinstance`
--

DROP TABLE IF EXISTS `jbpm_swimlaneinstance`;
CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `ACTORID_` varchar(255) default NULL,
  `SWIMLANE_` bigint(20) default NULL,
  `TASKMGMTINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_SWIMLINST_SL` (`SWIMLANE_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`),
  CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_swimlaneinstance`
--


/*!40000 ALTER TABLE `jbpm_swimlaneinstance` DISABLE KEYS */;
LOCK TABLES `jbpm_swimlaneinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_swimlaneinstance` ENABLE KEYS */;

--
-- Table structure for table `jbpm_task`
--

DROP TABLE IF EXISTS `jbpm_task`;
CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `ISBLOCKING_` bit(1) default NULL,
  `ISSIGNALLING_` bit(1) default NULL,
  `CONDITION_` varchar(255) default NULL,
  `DUEDATE_` varchar(255) default NULL,
  `PRIORITY_` int(11) default NULL,
  `ACTORIDEXPRESSION_` varchar(255) default NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) default NULL,
  `TASKMGMTDEFINITION_` bigint(20) default NULL,
  `TASKNODE_` bigint(20) default NULL,
  `STARTSTATE_` bigint(20) default NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) default NULL,
  `SWIMLANE_` bigint(20) default NULL,
  `TASKCONTROLLER_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_TASK_TSKNODE` (`TASKNODE_`),
  KEY `IDX_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_TASK_TASKMGTDF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_task`
--


/*!40000 ALTER TABLE `jbpm_task` DISABLE KEYS */;
LOCK TABLES `jbpm_task` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_task` ENABLE KEYS */;

--
-- Table structure for table `jbpm_taskactorpool`
--

DROP TABLE IF EXISTS `jbpm_taskactorpool`;
CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY  (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  KEY `FK_TASKACTPL_TSKI` (`TASKINSTANCE_`),
  CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `jbpm_pooledactor` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskactorpool`
--


/*!40000 ALTER TABLE `jbpm_taskactorpool` DISABLE KEYS */;
LOCK TABLES `jbpm_taskactorpool` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_taskactorpool` ENABLE KEYS */;

--
-- Table structure for table `jbpm_taskcontroller`
--

DROP TABLE IF EXISTS `jbpm_taskcontroller`;
CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `TASKCONTROLLERDELEGATION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`),
  CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskcontroller`
--


/*!40000 ALTER TABLE `jbpm_taskcontroller` DISABLE KEYS */;
LOCK TABLES `jbpm_taskcontroller` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_taskcontroller` ENABLE KEYS */;

--
-- Table structure for table `jbpm_taskinstance`
--

DROP TABLE IF EXISTS `jbpm_taskinstance`;
CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `DESCRIPTION_` text,
  `ACTORID_` varchar(255) default NULL,
  `CREATE_` datetime default NULL,
  `START_` datetime default NULL,
  `END_` datetime default NULL,
  `DUEDATE_` datetime default NULL,
  `PRIORITY_` int(11) default NULL,
  `ISCANCELLED_` bit(1) default NULL,
  `ISSUSPENDED_` bit(1) default NULL,
  `ISOPEN_` bit(1) default NULL,
  `ISSIGNALLING_` bit(1) default NULL,
  `ISBLOCKING_` bit(1) default NULL,
  `TASK_` bigint(20) default NULL,
  `TOKEN_` bigint(20) default NULL,
  `PROCINST_` bigint(20) default NULL,
  `SWIMLANINSTANCE_` bigint(20) default NULL,
  `TASKMGMTINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_TASKINST_TOKN` (`TOKEN_`),
  KEY `IDX_TASKINST_TSK` (`TASK_`,`PROCINST_`),
  KEY `IDX_TSKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `IDX_TSKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  KEY `FK_TSKINS_PRCINS` (`PROCINST_`),
  KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_TASK` (`TASK_`),
  CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TSKINS_PRCINS` FOREIGN KEY (`PROCINST_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_taskinstance`
--


/*!40000 ALTER TABLE `jbpm_taskinstance` DISABLE KEYS */;
LOCK TABLES `jbpm_taskinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_taskinstance` ENABLE KEYS */;

--
-- Table structure for table `jbpm_token`
--

DROP TABLE IF EXISTS `jbpm_token`;
CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `START_` datetime default NULL,
  `END_` datetime default NULL,
  `NODEENTER_` datetime default NULL,
  `NEXTLOGINDEX_` int(11) default NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) default NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) default NULL,
  `ISSUSPENDED_` bit(1) default NULL,
  `LOCK_` varchar(255) default NULL,
  `NODE_` bigint(20) default NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `PARENT_` bigint(20) default NULL,
  `SUBPROCESSINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_TOKEN_PROCIN` (`PROCESSINSTANCE_`),
  KEY `IDX_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  KEY `IDX_TOKEN_NODE` (`NODE_`),
  KEY `IDX_TOKEN_PARENT` (`PARENT_`),
  KEY `FK_TOKEN_PARENT` (`PARENT_`),
  KEY `FK_TOKEN_NODE` (`NODE_`),
  KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_token`
--


/*!40000 ALTER TABLE `jbpm_token` DISABLE KEYS */;
LOCK TABLES `jbpm_token` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_token` ENABLE KEYS */;

--
-- Table structure for table `jbpm_tokenvariablemap`
--

DROP TABLE IF EXISTS `jbpm_tokenvariablemap`;
CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) default NULL,
  `CONTEXTINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  KEY `IDX_TKVVARMP_TOKEN` (`TOKEN_`),
  KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`),
  CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_tokenvariablemap`
--


/*!40000 ALTER TABLE `jbpm_tokenvariablemap` DISABLE KEYS */;
LOCK TABLES `jbpm_tokenvariablemap` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_tokenvariablemap` ENABLE KEYS */;

--
-- Table structure for table `jbpm_transition`
--

DROP TABLE IF EXISTS `jbpm_transition`;
CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) default NULL,
  `FROM_` bigint(20) default NULL,
  `TO_` bigint(20) default NULL,
  `CONDITION_` varchar(255) default NULL,
  `FROMINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_TRANSIT_TO` (`TO_`),
  KEY `IDX_TRANSIT_FROM` (`FROM_`),
  KEY `IDX_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANSITION_TO` (`TO_`),
  KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANSITION_FROM` (`FROM_`),
  CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_transition`
--


/*!40000 ALTER TABLE `jbpm_transition` DISABLE KEYS */;
LOCK TABLES `jbpm_transition` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_transition` ENABLE KEYS */;

--
-- Table structure for table `jbpm_variableaccess`
--

DROP TABLE IF EXISTS `jbpm_variableaccess`;
CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `VARIABLENAME_` varchar(255) default NULL,
  `ACCESS_` varchar(255) default NULL,
  `MAPPEDNAME_` varchar(255) default NULL,
  `PROCESSSTATE_` bigint(20) default NULL,
  `TASKCONTROLLER_` bigint(20) default NULL,
  `INDEX_` int(11) default NULL,
  `SCRIPT_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_variableaccess`
--


/*!40000 ALTER TABLE `jbpm_variableaccess` DISABLE KEYS */;
LOCK TABLES `jbpm_variableaccess` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_variableaccess` ENABLE KEYS */;

--
-- Table structure for table `jbpm_variableinstance`
--

DROP TABLE IF EXISTS `jbpm_variableinstance`;
CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `CONVERTER_` char(1) default NULL,
  `TOKEN_` bigint(20) default NULL,
  `TOKENVARIABLEMAP_` bigint(20) default NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `BYTEARRAYVALUE_` bigint(20) default NULL,
  `DATEVALUE_` datetime default NULL,
  `DOUBLEVALUE_` double default NULL,
  `LONGIDCLASS_` varchar(255) default NULL,
  `LONGVALUE_` bigint(20) default NULL,
  `STRINGIDCLASS_` varchar(255) default NULL,
  `STRINGVALUE_` text,
  `ELEMENTVALUE_` blob,
  `TASKINSTANCE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `IDX_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `IDX_VARINST_PRCINS` (`PROCESSINSTANCE_`),
  KEY `IDX_VARINST_TK` (`TOKEN_`),
  KEY `FK_VARINST_TK` (`TOKEN_`),
  KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `jbpm_tokenvariablemap` (`ID_`),
  CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jbpm_variableinstance`
--


/*!40000 ALTER TABLE `jbpm_variableinstance` DISABLE KEYS */;
LOCK TABLES `jbpm_variableinstance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jbpm_variableinstance` ENABLE KEYS */;

--
-- Table structure for table `wsdl_message`
--

DROP TABLE IF EXISTS `wsdl_message`;
CREATE TABLE `wsdl_message` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_IMPORTDEF_MESSAGE` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_MESSAGE` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wsdl_message`
--


/*!40000 ALTER TABLE `wsdl_message` DISABLE KEYS */;
LOCK TABLES `wsdl_message` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `wsdl_message` ENABLE KEYS */;

--
-- Table structure for table `wsdl_operation`
--

DROP TABLE IF EXISTS `wsdl_operation`;
CREATE TABLE `wsdl_operation` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `INPUT_` bigint(20) default NULL,
  `OUTPUT_` bigint(20) default NULL,
  `PORTTYPE_` bigint(20) default NULL,
  `OPERATIONINDEX_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_OPERATION_INPUT` (`INPUT_`),
  KEY `FK_PORTTYPE_OPERATION` (`PORTTYPE_`),
  KEY `FK_OPERATION_OUTPUT` (`OUTPUT_`),
  CONSTRAINT `FK_OPERATION_OUTPUT` FOREIGN KEY (`OUTPUT_`) REFERENCES `wsdl_operationmember` (`id`),
  CONSTRAINT `FK_OPERATION_INPUT` FOREIGN KEY (`INPUT_`) REFERENCES `wsdl_operationmember` (`id`),
  CONSTRAINT `FK_PORTTYPE_OPERATION` FOREIGN KEY (`PORTTYPE_`) REFERENCES `wsdl_porttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wsdl_operation`
--


/*!40000 ALTER TABLE `wsdl_operation` DISABLE KEYS */;
LOCK TABLES `wsdl_operation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `wsdl_operation` ENABLE KEYS */;

--
-- Table structure for table `wsdl_operationmember`
--

DROP TABLE IF EXISTS `wsdl_operationmember`;
CREATE TABLE `wsdl_operationmember` (
  `id` bigint(20) NOT NULL auto_increment,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `MESSAGE_` bigint(20) default NULL,
  `OPERATION_` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_OPERMEMBER_MESSAGE` (`MESSAGE_`),
  KEY `FK_OPERATION_FAULT` (`OPERATION_`),
  CONSTRAINT `FK_OPERATION_FAULT` FOREIGN KEY (`OPERATION_`) REFERENCES `wsdl_operation` (`ID_`),
  CONSTRAINT `FK_OPERMEMBER_MESSAGE` FOREIGN KEY (`MESSAGE_`) REFERENCES `wsdl_message` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wsdl_operationmember`
--


/*!40000 ALTER TABLE `wsdl_operationmember` DISABLE KEYS */;
LOCK TABLES `wsdl_operationmember` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `wsdl_operationmember` ENABLE KEYS */;

--
-- Table structure for table `wsdl_part`
--

DROP TABLE IF EXISTS `wsdl_part`;
CREATE TABLE `wsdl_part` (
  `ID_` bigint(20) NOT NULL auto_increment,
  `NAME_` varchar(255) default NULL,
  `ELEMENTLOCALNAME_` varchar(255) default NULL,
  `ELEMENTNAMESPACE_` varchar(255) default NULL,
  `TYPELOCALNAME_` varchar(255) default NULL,
  `TYPENAMESPACE_` varchar(255) default NULL,
  `MESSAGE_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `FK_MESSAGE_PART` (`MESSAGE_`),
  CONSTRAINT `FK_MESSAGE_PART` FOREIGN KEY (`MESSAGE_`) REFERENCES `wsdl_message` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wsdl_part`
--


/*!40000 ALTER TABLE `wsdl_part` DISABLE KEYS */;
LOCK TABLES `wsdl_part` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `wsdl_part` ENABLE KEYS */;

--
-- Table structure for table `wsdl_porttype`
--

DROP TABLE IF EXISTS `wsdl_porttype`;
CREATE TABLE `wsdl_porttype` (
  `id` bigint(20) NOT NULL auto_increment,
  `LOCALNAME_` varchar(255) default NULL,
  `NAMESPACE_` varchar(255) default NULL,
  `IMPORTDEF_` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_IMPORTDEF_PORTTYPE` (`IMPORTDEF_`),
  CONSTRAINT `FK_IMPORTDEF_PORTTYPE` FOREIGN KEY (`IMPORTDEF_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wsdl_porttype`
--


/*!40000 ALTER TABLE `wsdl_porttype` DISABLE KEYS */;
LOCK TABLES `wsdl_porttype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `wsdl_porttype` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

