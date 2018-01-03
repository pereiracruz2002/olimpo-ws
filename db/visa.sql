-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localserver    Database: fsdc
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `checkins`
--

DROP TABLE IF EXISTS `checkins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkins` (
  `checkin_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `participante_id` int(11) NOT NULL,
  PRIMARY KEY (`checkin_id`),
  KEY `fk_checkins_terminais1_idx` (`terminal_id`),
  KEY `index5` (`data`),
  KEY `fk_checkins_participantes1_idx` (`participante_id`),
  CONSTRAINT `fk_checkins_participantes1` FOREIGN KEY (`participante_id`) REFERENCES `participantes` (`participante_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_checkins_terminais1` FOREIGN KEY (`terminal_id`) REFERENCES `terminais` (`terminal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkins`
--

LOCK TABLES `checkins` WRITE;
/*!40000 ALTER TABLE `checkins` DISABLE KEYS */;
INSERT INTO `checkins` VALUES (1,1,'2017-07-24 08:00:00',11),(2,2,'2017-07-24 13:01:25',11),(8,1,'2017-07-24 12:00:57',11),(9,2,'2017-07-24 17:11:55',11),(11,1,'2017-07-27 08:00:00',9),(12,1,'2017-07-27 12:00:00',9),(13,2,'2017-07-27 13:00:00',9),(14,2,'2017-07-27 18:00:00',9),(15,1,'2017-07-27 08:00:00',10),(16,2,'2017-07-27 13:00:00',10),(17,2,'2017-07-27 17:00:00',10),(18,1,'2017-07-27 12:16:28',12),(19,2,'2017-07-27 12:17:00',12),(20,1,'2017-07-27 12:17:15',12);
/*!40000 ALTER TABLE `checkins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantes` (
  `participante_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `personId` varchar(100) DEFAULT NULL,
  `cargo` varchar(155) DEFAULT NULL,
  `num_doc` varchar(45) DEFAULT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participante_id`),
  KEY `fk_participantes_tipos_documentos_idx` (`tipo_documento_id`),
  KEY `index3` (`ativo`),
  CONSTRAINT `fk_participantes_tipos_documentos` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipos_documentos` (`tipo_documento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` VALUES (9,'Mauro Marssola','mauro@wvtodoz.com.br','1198765589','f4158bdf-8d11-4d16-8e0b-b967d0f4c5b3','Programador','23487358-3',3,1,'2017-07-20 16:38:53'),(10,'Fenelon Ursilino da Silva','marssolinha@hotmail.com','11980484949','6298ac00-9201-4336-bc6a-43b8792a3272','Programador','1234567890',1,1,'2017-07-21 10:22:21'),(11,'Flávio','flavio@wvcomunicacao.com.br','65656565','d5a1e372-c0fd-42de-8d27-a2a6d2773071','programador','665565665',1,1,'2017-07-21 14:58:21'),(12,'WVFacileme','wvfacileme@facileme','1180568745','bde35db4-2cc3-404b-b77c-194e3a9e367a','1357924680','1234567890',1,1,'2017-07-26 16:06:00');
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes_fotos`
--

DROP TABLE IF EXISTS `participantes_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantes_fotos` (
  `participante_foto_id` int(11) NOT NULL AUTO_INCREMENT,
  `participante_id` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `persistedFaceId` varchar(100) NOT NULL,
  PRIMARY KEY (`participante_foto_id`),
  KEY `fk_participantes_fotos_participantes1_idx` (`participante_id`),
  KEY `index3` (`persistedFaceId`),
  CONSTRAINT `fk_participantes_fotos_participantes1` FOREIGN KEY (`participante_id`) REFERENCES `participantes` (`participante_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes_fotos`
--

LOCK TABLES `participantes_fotos` WRITE;
/*!40000 ALTER TABLE `participantes_fotos` DISABLE KEYS */;
INSERT INTO `participantes_fotos` VALUES (17,10,'https://app.letswork.com.br/uploads/1/c972953c87af39cf89f1651d54e2ab7f.jpg','a02cd821-5575-42ba-b641-255b3b4a0c53'),(20,12,'https://app.letswork.com.br/uploads/1/c972953c87af39cf89f1651d54e2ab7f.jpg','ab37b8fc-0a1f-4930-b24c-423c6cc29460');
/*!40000 ALTER TABLE `participantes_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(128) CHARACTER SET utf8 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0087tq2amgvg1puihnqhl0vfe2fmrkvc','127.0.0.1',1500553655,'__ci_last_regenerate|i:1500553654;'),('01k5r8576vhoa984phi10hqqb710h77n','192.168.1.146',1500582589,'__ci_last_regenerate|i:1500582589;'),('03riq1o2ci1ob1t8ofn0nocq6n963pqs','192.168.1.146',1500581651,'__ci_last_regenerate|i:1500581651;'),('09526oklafi40t7u2g8kh37o08uijko4','127.0.0.1',1500558461,'__ci_last_regenerate|i:1500558461;'),('0bb2im1r3k25gpcmn5rpj67087kug997','127.0.0.1',1500558174,'__ci_last_regenerate|i:1500558174;'),('0cg2p7t15rsqe86lfsh4tbhes1spj3co','127.0.0.1',1500555992,'__ci_last_regenerate|i:1500555992;'),('0ds0n7jv4f7teu20v7fkmik7msvcpsq3','192.168.1.146',1500643233,'__ci_last_regenerate|i:1500643233;'),('0i7k0qgmqbce92f4ua5mv8i9o5pca0p9','192.168.1.146',1500640832,'__ci_last_regenerate|i:1500640832;'),('0mu6ro8fesral65245cc5t6ps0a9ch5o','192.168.1.146',1500581780,'__ci_last_regenerate|i:1500581780;'),('0r7aj2utqaelf68kng51crihltp00kvj','127.0.0.1',1501176894,'__ci_last_regenerate|i:1501176894;'),('0slph6rq2glaretvjuf1g9oi76n9dsru','192.168.1.146',1500581683,'__ci_last_regenerate|i:1500581683;'),('0velis67sgindnr9ll9p3ui31kevn7vp','127.0.0.1',1500556116,'__ci_last_regenerate|i:1500556116;'),('1b4tkk1fisdvmrgq8j6bjpgds07oke69','127.0.0.1',1500555401,'__ci_last_regenerate|i:1500555401;'),('1b8b6le0gsck58mhtv58nqrci7jplcd7','192.168.1.146',1500582419,'__ci_last_regenerate|i:1500582419;'),('1f3f87ts5qhshnk39a477panmu8i4jdp','192.168.1.146',1500582259,'__ci_last_regenerate|i:1500582259;'),('1j53dua5552shpdrcdnpeq8uimngltgg','127.0.0.1',1500560912,'__ci_last_regenerate|i:1500560912;'),('1sqi51liavni9rk8u8ulmiu1a8ggv7lb','192.168.1.146',1500641198,'__ci_last_regenerate|i:1500641198;'),('1v9k2lfsg1com0mpoi8n0jd798tp0oaa','127.0.0.1',1500558283,'__ci_last_regenerate|i:1500558283;'),('1vb9b89npndpjq2cjsm905tg378igjm0','192.168.1.146',1500641727,'__ci_last_regenerate|i:1500641727;'),('218hr3rv2uhajqo8lmejaqvkkbg1d5jd','127.0.0.1',1500558313,'__ci_last_regenerate|i:1500558313;'),('2593hreplbv5eejp07e099ie9labd5b5','127.0.0.1',1500564466,'__ci_last_regenerate|i:1500564466;'),('27i1280rd0ch35sih367ic8nf2clg7tj','192.168.1.146',1500641165,'__ci_last_regenerate|i:1500641165;'),('2tpq3nfqdvcc9klv45qvqke1o59f22vg','127.0.0.1',1500491265,'__ci_last_regenerate|i:1500491084;'),('2uia5ogh6kpl541cqln8k4t0hjsp7trn','192.168.1.146',1500908182,'__ci_last_regenerate|i:1500908037;'),('34ilvutcset9th9t102hdmplampaajr3','192.168.1.146',1500582356,'__ci_last_regenerate|i:1500582356;'),('34pgfrkc186lbdg6naiorkkqu50qhljj','127.0.0.1',1500559410,'__ci_last_regenerate|i:1500559410;'),('35hl1kfottlsmtkdn0sab1a9t0uo0tt4','192.168.1.146',1500643891,'__ci_last_regenerate|i:1500643891;'),('3dsu694rdlrmtbdq3j3tpgdimj5cojkh','127.0.0.1',1500560924,'__ci_last_regenerate|i:1500560924;'),('3ou1tq3p8fosrei8qbeaerhe5hojh8aa','127.0.0.1',1500555995,'__ci_last_regenerate|i:1500555995;'),('3utiqrl6rm46jb24nt2i1obq7vgrmdmn','192.168.1.146',1500584063,'__ci_last_regenerate|i:1500584063;'),('3vfrf4jjhk6pimk6qmsv1pfrlftfea0j','192.168.1.146',1500581968,'__ci_last_regenerate|i:1500581968;'),('40p5cn5b89rjnkbucsk21dgl6afn4jep','127.0.0.1',1501099685,'__ci_last_regenerate|i:1501099494;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('42lhqrtrh5epgciibso1gj9dm034tqop','127.0.0.1',1500555037,'__ci_last_regenerate|i:1500555037;'),('46vtfit33iohopm4pj041pfqvs21qrdj','127.0.0.1',1500558817,'__ci_last_regenerate|i:1500558817;'),('4bl91rmstg2j2cputf48e7pbud76dqb9','127.0.0.1',1500564626,'__ci_last_regenerate|i:1500564626;'),('4dte9bph4f20mi41jlmbiqc5gl4ncbqc','127.0.0.1',1500554659,'__ci_last_regenerate|i:1500554659;'),('4fv8bl8lh18nb18k4dhevaahb50eph5e','192.168.1.169',1500640258,'__ci_last_regenerate|i:1500640258;'),('4iki9grclicmkje2sr6jirm9c16hc01j','192.168.1.146',1500641477,'__ci_last_regenerate|i:1500641477;'),('4ml0ps809caufg6vv1ud2uu8f5plms44','192.168.1.146',1500581664,'__ci_last_regenerate|i:1500581664;'),('4n348m13f60vj0k478g6go4dkshqrqt0','127.0.0.1',1500558866,'__ci_last_regenerate|i:1500558866;'),('4rjvj9ab1r88hl2ad53fk2gtdnib5ip6','192.168.1.146',1500582981,'__ci_last_regenerate|i:1500582981;'),('4t9cif081rdhv3jh5lj8vdauu8orcl71','127.0.0.1',1500558556,'__ci_last_regenerate|i:1500558556;'),('4vegljmq9lp9coj6vvfa2vqfbb025110','192.168.1.146',1500580787,'__ci_last_regenerate|i:1500580787;'),('51g8pkos13m0c109au1la70b8rmiurm1','192.168.1.146',1500581859,'__ci_last_regenerate|i:1500581859;'),('521t20kepae0bgpebgq4pcvv5h7gh4bu','127.0.0.1',1500555148,'__ci_last_regenerate|i:1500555148;'),('545top2jngle01m8357hbisna83v5e07','192.168.1.146',1500643453,'__ci_last_regenerate|i:1500643453;'),('55kd1ilesusd3va42ju1nnmq5aqnuohj','127.0.0.1',1500559360,'__ci_last_regenerate|i:1500559360;'),('580clcuhr6ile2edpt166t9lddubtt4r','192.168.1.146',1500642720,'__ci_last_regenerate|i:1500642720;'),('583t8rd7q3ved45fphqkcp0m9r40h7ah','127.0.0.1',1500555136,'__ci_last_regenerate|i:1500555136;'),('58mu8kto0651e4hhh0dooahv2lp5gk7f','192.168.1.146',1500581831,'__ci_last_regenerate|i:1500581831;'),('5doa6vj7u46rl8pg0njsh84j00mi2pfh','192.168.1.146',1500582454,'__ci_last_regenerate|i:1500582453;'),('5fjtrbdb72m4cp1tbkgpr0jmpstp07rl','192.168.1.146',1500643562,'__ci_last_regenerate|i:1500643562;'),('5h3evt5hvs484rkmmj4ga90se3p2ofue','192.168.1.146',1500641642,'__ci_last_regenerate|i:1500641642;'),('5jcteme3kvuac36be74cf2iam3g61fvq','127.0.0.1',1500555496,'__ci_last_regenerate|i:1500555496;'),('5kjuht6luhkdo77bhgjqa815o6f76t31','192.168.1.146',1500582306,'__ci_last_regenerate|i:1500582306;'),('5kq925b8so6r3rr3jcgqaqltfeofrbsd','192.168.1.146',1500582422,'__ci_last_regenerate|i:1500582422;'),('5nrgjn1ujmphe5ct7enoc11f3lfjrobq','127.0.0.1',1500670816,'__ci_last_regenerate|i:1500670816;'),('5rtvqohvphue2jrtk5h4j0vgibblj2rc','192.168.1.122',1501076219,'__ci_last_regenerate|i:1501076205;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('5spl4mjo200ruq0hdgg9u1h9vn8i5sjq','192.168.1.146',1500583313,'__ci_last_regenerate|i:1500583313;'),('5tbvgs7qu4fhigb792ri6qanfvps2jf5','192.168.1.146',1500642275,'__ci_last_regenerate|i:1500642275;'),('62cq7pc8fv9nuc241b7ltupfur6dceln','192.168.1.146',1500582991,'__ci_last_regenerate|i:1500582991;'),('69uhshpcj1a5req7rb1hs7rs6abkk22m','127.0.0.1',1500554178,'__ci_last_regenerate|i:1500554178;'),('6b4jk3ld3qphr5ntkj1jcn7ide1bj3vl','127.0.0.1',1500553817,'__ci_last_regenerate|i:1500553817;'),('6d0iplaqh219vonm0aq0eeh723cnp3dn','127.0.0.1',1501186578,'__ci_last_regenerate|i:1501186562;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('6i5tlqlif5t37b7l79nlj5o83h45kl4q','127.0.0.1',1500405958,'__ci_last_regenerate|i:1500405957;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:88:\"TglXkFiKbR1e+kpq+bW2eSlNT7YGGPrdWgpl1TidhiTALjZjN4O3ip9FaqQQekFmn9c4KFN8EAf5QLpckbCvWA==\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('6sdt43hcekn0unmsg5g7s2i4d34i0hit','192.168.1.146',1500582637,'__ci_last_regenerate|i:1500582637;'),('6sebm8n41asqt9reigavh73h8uq8v36i','127.0.0.1',1500555700,'__ci_last_regenerate|i:1500555700;'),('6slf6u1ibffvbamqu9l21r87svvag7tr','127.0.0.1',1500482512,'__ci_last_regenerate|i:1500482507;'),('6t6rd075bdj017bjr71210eh70i7rtq3','192.168.1.146',1500582494,'__ci_last_regenerate|i:1500582494;'),('75j8ohpi24rja8b7e2cfhl1bpmrtejme','192.168.1.146',1500643847,'__ci_last_regenerate|i:1500643847;'),('7774nmvd86828akinf4v8oq7m1ila4fu','127.0.0.1',1501091987,'__ci_last_regenerate|i:1501091709;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('79499mcrmp0uf7eens1d47ani12v1ar6','127.0.0.1',1500495137,'__ci_last_regenerate|i:1500494997;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('79h068v7irg68oe0d4k9b4qufbg44gjp','127.0.0.1',1500493003,'__ci_last_regenerate|i:1500492951;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('7cbc4ghm5r5r3jcld89gadfojkmkj7vd','127.0.0.1',1500407338,'__ci_last_regenerate|i:1500407338;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:88:\"TglXkFiKbR1e+kpq+bW2eSlNT7YGGPrdWgpl1TidhiTALjZjN4O3ip9FaqQQekFmn9c4KFN8EAf5QLpckbCvWA==\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('7f361npamnssrg51nc08nuv20l6tela8','192.168.1.146',1500582380,'__ci_last_regenerate|i:1500582380;'),('7hh93qdbnr47piiaf3tdkvaolr6op1h5','127.0.0.1',1500559205,'__ci_last_regenerate|i:1500559205;'),('7nrlmllno7qjmdb8fdkrko7ok827b4qu','127.0.0.1',1500555188,'__ci_last_regenerate|i:1500555188;'),('7u2c545hj5126c17pnlhk8gb7jsf46i9','127.0.0.1',1500648380,'__ci_last_regenerate|i:1500648362;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"4\";s:4:\"nome\";s:16:\"Fenelon Ursulino\";s:5:\"email\";s:21:\"marssolinha@gmail.com\";s:5:\"senha\";s:60:\"$2y$10$C36329YubAmaFJ7eujfrNeIg02yRwCNrGfVMvo.0mCbdvi30xzmX6\";s:16:\"usuarios_tipo_id\";s:1:\"2\";s:5:\"ativo\";s:1:\"1\";}'),('7v420q3e1ahdkchg1k1be56kvmd45ikd','127.0.0.1',1500554878,'__ci_last_regenerate|i:1500554878;'),('80vth4u9m744mbv5fbq0au5mqfv9ir2r','127.0.0.1',1500561088,'__ci_last_regenerate|i:1500561088;'),('8414m8sk5qragpk0oq24thnn4976qksr','127.0.0.1',1500554470,'__ci_last_regenerate|i:1500554470;'),('87am6j441511hfse0kq81eohft9a26hi','192.168.1.146',1500643068,'__ci_last_regenerate|i:1500643068;'),('8bdu2fim4tjfv69ime50mnmrjmj7svl6','127.0.0.1',1500559618,'__ci_last_regenerate|i:1500559618;'),('8bl22d7rfokn04u7r91fu7h4ajnvtc7n','127.0.0.1',1500559385,'__ci_last_regenerate|i:1500559385;'),('8cpkmubbe0l2oh1r3ajidvscatsq4nfm','192.168.1.146',1500640963,'__ci_last_regenerate|i:1500640963;'),('8e32udacnjbf0i2uiojpbn6tl4f09hm6','192.168.1.146',1500582554,'__ci_last_regenerate|i:1500582554;'),('8gvsfarqli3aoqhesoenlf2sq6jh6t29','127.0.0.1',1500558852,'__ci_last_regenerate|i:1500558852;'),('8ha16dbidv3ht6d8bn1224vr1b2mor21','127.0.0.1',1500557063,'__ci_last_regenerate|i:1500557063;'),('8lroornn99ofcc13n0di4lpi3i25rca7','127.0.0.1',1500564598,'__ci_last_regenerate|i:1500564598;'),('8nj0tm595jqc25l1i9r9l8fp87fg3r9j','192.168.1.146',1500580805,'__ci_last_regenerate|i:1500580805;'),('8vi43agu1uqi2pqt8pahqoa0o6piq72v','127.0.0.1',1500558475,'__ci_last_regenerate|i:1500558475;'),('91eon7ase3airvjcfk2g4k2fdsn0aab0','192.168.1.146',1500583961,'__ci_last_regenerate|i:1500583961;'),('91keg10oguo5c4a98vffmd516u99as5d','127.0.0.1',1500558593,'__ci_last_regenerate|i:1500558593;'),('95cicui6l24kt20ftc53kop272udlq8m','127.0.0.1',1500556037,'__ci_last_regenerate|i:1500556037;'),('97tbc5egbqfrhg0a5hkf3kpj0sgnmpeu','127.0.0.1',1500559072,'__ci_last_regenerate|i:1500559072;'),('983tuqd56it2gl4is22shlbtv44igegp','127.0.0.1',1500560823,'__ci_last_regenerate|i:1500560823;'),('9cm4r9fu2lom6vmij37plltq4a0opmea','127.0.0.1',1500569583,'__ci_last_regenerate|i:1500569583;'),('9j1hak3vb24si13ekeqk27jm6d3e5tef','127.0.0.1',1500559327,'__ci_last_regenerate|i:1500559327;'),('9jmnh7ih67hlig1e7fvl5dgj1rugkj2e','127.0.0.1',1500553707,'__ci_last_regenerate|i:1500553707;'),('9tki04pc0uiqah5454vd2csu2pu62nl3','192.168.1.146',1500639286,'__ci_last_regenerate|i:1500639286;'),('9vn784amm2dao1tbmggspjt6r63dno9c','192.168.1.146',1500642312,'__ci_last_regenerate|i:1500642312;'),('9vom7mt7cfltqqbofsv2jd8e11l156kb','192.168.1.146',1500644181,'__ci_last_regenerate|i:1500644181;'),('9vr5vf5qqb4ip8rlg2r7c1jbsnfnt64g','192.168.1.146',1500580633,'__ci_last_regenerate|i:1500580633;'),('a295iplcupm2bja7m5kfoai7bpvojpel','127.0.0.1',1500558409,'__ci_last_regenerate|i:1500558409;'),('a493arockpjf7rf6s6jeg156gisn53rq','127.0.0.1',1500558336,'__ci_last_regenerate|i:1500558336;'),('a7epsmt6b0foijoadjq1bur9bkv4h17e','127.0.0.1',1500558820,'__ci_last_regenerate|i:1500558820;'),('a7k8gnr9ftte8msnm9lo7ruvigmc5asp','192.168.1.146',1500581585,'__ci_last_regenerate|i:1500581585;'),('a84co6gt7ot59dh9aaitdlqs9v71eevi','192.168.1.122',1501090742,'__ci_last_regenerate|i:1501090742;'),('aepp7ll2533u8dn906qip8li1kilfou4','127.0.0.1',1500579899,'__ci_last_regenerate|i:1500579738;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('af2ncmlgm16nb75k64fajteq8iep04cn','127.0.0.1',1500558374,'__ci_last_regenerate|i:1500558374;'),('ak8rdbh8ho451o1gu5b1vprjbpugcdei','192.168.1.146',1500641357,'__ci_last_regenerate|i:1500641357;'),('aklcjuoet37bltv595029830vevblkn3','127.0.0.1',1500560968,'__ci_last_regenerate|i:1500560968;'),('al27v5ddtranjeap40rpc2umbvedlgbv','192.168.1.146',1500582737,'__ci_last_regenerate|i:1500582737;'),('al4tio3a96429kugktj2fdl8ja43m68e','127.0.0.1',1500555433,'__ci_last_regenerate|i:1500555433;'),('amc92f2fv4fidmkh5agm38rl9hldemup','127.0.0.1',1500558188,'__ci_last_regenerate|i:1500558188;'),('amv8sfd5fmf10u4sdi8r6oh4f48emdoi','127.0.0.1',1500558300,'__ci_last_regenerate|i:1500558300;'),('aspfk7ojvce520aqevhoou8tp9huodm5','192.168.1.146',1500582551,'__ci_last_regenerate|i:1500582551;'),('b39innge2vtv854qe0r6k51dmks79u7v','127.0.0.1',1500494088,'__ci_last_regenerate|i:1500494048;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('b3ker6o2v4f5qmck033avpuhf3d5r6ol','127.0.0.1',1500558777,'__ci_last_regenerate|i:1500558777;'),('b5bm54erriscch3q1t01j1ci0munv05c','127.0.0.1',1500557770,'__ci_last_regenerate|i:1500557770;'),('b5fnhva7bgp5i21d1so76kre4r46p2ob','192.168.1.122',1501075563,'__ci_last_regenerate|i:1501075525;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('b97t7h5mlkiar2lsf4mk3norm8f3qq56','127.0.0.1',1501088423,'__ci_last_regenerate|i:1501088423;'),('bd1thsv5alq2ic8kbq42sra9q0km5tqq','127.0.0.1',1500472825,'__ci_last_regenerate|i:1500472825;'),('bdfffot7vl2d93s3la1t3vl3fd9e25f8','127.0.0.1',1500559621,'__ci_last_regenerate|i:1500559621;'),('bg619or24ltclhe6s3mbo1ka8rcgao24','192.168.1.122',1501097394,'__ci_last_regenerate|i:1501097192;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('bi4vhrj5j6c5aef30474j2e547a3mq7s','192.168.1.146',1500641840,'__ci_last_regenerate|i:1500641840;'),('bnu9b3gd7nonhqvljogqsi06u73qs5jo','127.0.0.1',1500558733,'__ci_last_regenerate|i:1500558733;'),('bpoosr5ofionj3bsh0scc4gogdr3s0dm','192.168.1.146',1500640785,'__ci_last_regenerate|i:1500640785;'),('bqklt9e50kku9up9puqv6470f98e6h1h','127.0.0.1',1500481926,'__ci_last_regenerate|i:1500481925;'),('c7mg3vlls35m4o374bvjauq14ss74dtd','127.0.0.1',1500561012,'__ci_last_regenerate|i:1500561012;'),('cjnvge7imnatihsj5drur6en1j6372fb','127.0.0.1',1500559444,'__ci_last_regenerate|i:1500559444;'),('ckaf5t2sf96m1boial0km7gq909k200f','127.0.0.1',1500558347,'__ci_last_regenerate|i:1500558347;'),('cp4u9uu6dg4iaa42h82n0b5501go66vt','192.168.1.146',1500639613,'__ci_last_regenerate|i:1500639613;'),('cs3f2b4fsm4o8u4puvc2hrjjhclpvb73','192.168.1.146',1500582679,'__ci_last_regenerate|i:1500582679;'),('cvrgfost3ep67j3epv4sdbpfulslmf3p','192.168.1.146',1500580845,'__ci_last_regenerate|i:1500580845;'),('d0deblskk5ospqvrkutc8i1lkahu5oja','192.168.1.146',1500581929,'__ci_last_regenerate|i:1500581929;'),('d36ud0t83onhm98auefk3nteeg6sh2rs','127.0.0.1',1500903565,'__ci_last_regenerate|i:1500903565;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('d8s50cso9dt5q44gi6qsa07t5ad9b3os','127.0.0.1',1500559467,'__ci_last_regenerate|i:1500559467;'),('ded26jc0ms5tj87e4be8g4vpq4ofqg3g','127.0.0.1',1500472121,'__ci_last_regenerate|i:1500472121;'),('dg5qd74mi4ibeeev92lovscpcdo3p4eu','127.0.0.1',1500558188,'__ci_last_regenerate|i:1500558188;'),('dk6j070tqt2itji7lfsq2fjkilobftiu','127.0.0.1',1500560614,'__ci_last_regenerate|i:1500560614;'),('dprsasbrengk76vmli651v5pvgcacq95','192.168.1.146',1500641074,'__ci_last_regenerate|i:1500641074;'),('dqubm1hdptpmkbvmkr0ot6kvvto56rrj','127.0.0.1',1500558387,'__ci_last_regenerate|i:1500558387;'),('drdbpfmrpt37uc294241u04r0hcm30l2','192.168.1.146',1500580726,'__ci_last_regenerate|i:1500580726;'),('drsc2n08sag93pltc6motr9m3km0mi3m','192.168.1.146',1500643491,'__ci_last_regenerate|i:1500643491;'),('duk1qdj0a7nt7ieb7tslukqr050be4bt','127.0.0.1',1500553810,'__ci_last_regenerate|i:1500553743;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('e11q00234mainrpkartdddh5n5krq836','127.0.0.1',1500561248,'__ci_last_regenerate|i:1500561248;'),('e3tiphd63s21k3e4sao1v617pn4mkkpe','127.0.0.1',1500579278,'__ci_last_regenerate|i:1500579278;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('e41pkbcep3ksli2n17oqo1etv3ov1v9m','127.0.0.1',1500561248,'__ci_last_regenerate|i:1500561248;'),('e4n2mlivr6qraabc79n9b8a3vfs70ep7','192.168.1.146',1500641793,'__ci_last_regenerate|i:1500641793;'),('emcgc93kjljhbessi5hcqv5arcahr0gb','127.0.0.1',1500555983,'__ci_last_regenerate|i:1500555983;'),('en85dk3p01kj42toui0ik7j1bd9htp4v','127.0.0.1',1500558416,'__ci_last_regenerate|i:1500558416;'),('f0ce808o7lu8rc6mbcns2rfss0jeef6a','127.0.0.1',1500555488,'__ci_last_regenerate|i:1500555488;'),('f0oruhj7vg0idruank7h0djdl8h3igao','127.0.0.1',1500559108,'__ci_last_regenerate|i:1500559108;'),('f21ikhmhuffgtpu2hogsjf4d9tvjjdeh','127.0.0.1',1500555065,'__ci_last_regenerate|i:1500555065;'),('f485vckpuc7rsdg5e61prulh1m5817hb','192.168.1.146',1500641846,'__ci_last_regenerate|i:1500641846;'),('f9cthkaobli2clpjoif7nr3ept6h4hbj','127.0.0.1',1500559317,'__ci_last_regenerate|i:1500559317;'),('fc9lmeo9g47i40lb82739b0onsllf1iu','127.0.0.1',1500558439,'__ci_last_regenerate|i:1500558439;'),('fe6gevven9ih7d4uv7gu5b0kpukq3jue','192.168.1.146',1500642111,'__ci_last_regenerate|i:1500642111;'),('feh1f6a9b8q24v0oposuncluprltr191','192.168.1.146',1500581599,'__ci_last_regenerate|i:1500581599;'),('fev4deighto7gls99t6tunnh3ig1h2ah','192.168.1.146',1500582450,'__ci_last_regenerate|i:1500582450;'),('fk072nohajh7jcpka8v0vvr9gfi141ps','192.168.1.146',1500641980,'__ci_last_regenerate|i:1500641980;'),('fl48buuq5vnl0uhctri0ellak2cnqf36','127.0.0.1',1500554345,'__ci_last_regenerate|i:1500554345;'),('fp77mh79nteu78rk4slo00sioi5e2tmi','192.168.1.146',1500642059,'__ci_last_regenerate|i:1500642059;'),('frj8hgv4n7hq8kd11i0ple27guq1a0h3','127.0.0.1',1500558276,'__ci_last_regenerate|i:1500558276;'),('fu06h3ug8tqbkmjb001rko9v4nnhli5u','127.0.0.1',1500561226,'__ci_last_regenerate|i:1500561226;'),('g43ft11l4m43sheivgi7lt0a2dbqk3n6','192.168.1.146',1500639807,'__ci_last_regenerate|i:1500639807;'),('g4m6nbmvvhmkgiorlunmc53njllcbd9o','127.0.0.1',1500560984,'__ci_last_regenerate|i:1500560984;'),('g4nsir66c2d72j8h2qmjb32cklsjdi8m','127.0.0.1',1500555384,'__ci_last_regenerate|i:1500555384;'),('g4qn2uis6nop6icr7tlrhoj13jqbopmo','192.168.1.146',1500641748,'__ci_last_regenerate|i:1500641748;'),('g5b1g5sdg8lkluknmvv67h0s7ps9mhla','127.0.0.1',1500554646,'__ci_last_regenerate|i:1500554646;'),('g6k22ops8mnckcgh6f0vckqp6roeu0h8','192.168.1.146',1500580673,'__ci_last_regenerate|i:1500580673;'),('gbim4o1j6alnij7kahueuivu8c3jueov','127.0.0.1',1500556048,'__ci_last_regenerate|i:1500556048;'),('gi4cisgsdp80he5qhle7i3ramra1fqup','192.168.1.146',1500642494,'__ci_last_regenerate|i:1500642494;'),('h1ngvre77s36iaj3dfs0959gciq96ee6','192.168.1.146',1500643844,'__ci_last_regenerate|i:1500643844;'),('h25593jlbf1pm7jrrk4svf8bj5rhk3us','127.0.0.1',1500553696,'__ci_last_regenerate|i:1500553696;'),('h2a2j31u56hssk0s5vdubvl9pi3th5tm','192.168.1.146',1500643027,'__ci_last_regenerate|i:1500643027;'),('h39r0i3hh7dbnt01uaohuoeokl6cb40m','127.0.0.1',1500564249,'__ci_last_regenerate|i:1500564249;'),('h515cedv8ojjh3ifso5au6f5h2dan2ma','127.0.0.1',1500558478,'__ci_last_regenerate|i:1500558478;'),('h791qb4m2gue6kg44adsso2rcnhk0psi','192.168.1.146',1500580766,'__ci_last_regenerate|i:1500580766;'),('h8pbgi1mblllfnu2hi7env0uhgna94b4','192.168.1.146',1500642405,'__ci_last_regenerate|i:1500642405;'),('hdjc5mgs5ri1a83v9m61ssehfahcgeju','192.168.1.146',1500641746,'__ci_last_regenerate|i:1500641746;'),('hg9sacu11q0bcsps9mth13gesltgp4qn','127.0.0.1',1500555356,'__ci_last_regenerate|i:1500555356;'),('hj1ab1lucca4ttv6iktoj42aholm44he','127.0.0.1',1500558276,'__ci_last_regenerate|i:1500558276;'),('hkackcqpu8q0dao9482r660n9tm086fr','192.168.1.146',1500639786,'__ci_last_regenerate|i:1500639786;'),('i7021uf6no055poojskgu2f5no08ds75','192.168.1.146',1500642933,'__ci_last_regenerate|i:1500642933;'),('ib2n8dpe4me3aj93u5j912go6rj44ku7','192.168.1.146',1500642622,'__ci_last_regenerate|i:1500642622;'),('ie70ad8hmbeitc71luufbq0jdpddahe1','192.168.1.146',1500641949,'__ci_last_regenerate|i:1500641949;'),('if4plnvk9g1ko9urmb9oiuhrjfggqo1f','127.0.0.1',1500557210,'__ci_last_regenerate|i:1500557210;'),('imhgq4i1caeuk2or5a4ff3i0ebct1tkt','127.0.0.1',1500560971,'__ci_last_regenerate|i:1500560971;'),('ishloedk1gg14ocm7jmg5q5vp02br3g8','127.0.0.1',1500580457,'__ci_last_regenerate|i:1500580457;'),('it8r8gi7397kmauapjtlam7a4v0klf9o','127.0.0.1',1500560831,'__ci_last_regenerate|i:1500560831;'),('j9dhnncqtjm0jj4cas2a9oi2hvkt9lh2','192.168.1.146',1500582428,'__ci_last_regenerate|i:1500582428;'),('jae6f7kepng9dv3smom7b770b4oj8kh1','192.168.1.146',1500580665,'__ci_last_regenerate|i:1500580665;'),('jl62di2h3vmob3bohmj3m0btbfne8jmv','127.0.0.1',1501245341,'__ci_last_regenerate|i:1501245341;'),('k0jn2o0s266e0u3ddistj2d54fm5s98a','127.0.0.1',1500558330,'__ci_last_regenerate|i:1500558330;'),('k3l0860tckmmddiarho299f9ijg9h8o4','127.0.0.1',1500559055,'__ci_last_regenerate|i:1500559055;'),('k4kjf05p75qh2g3t14t8ghnvmq2pu58f','192.168.1.146',1500669854,'__ci_last_regenerate|i:1500669753;'),('k88voc75gmj4pnjuja6ofd1d7a41700m','127.0.0.1',1500407727,'__ci_last_regenerate|i:1500407640;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:88:\"TglXkFiKbR1e+kpq+bW2eSlNT7YGGPrdWgpl1TidhiTALjZjN4O3ip9FaqQQekFmn9c4KFN8EAf5QLpckbCvWA==\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('kd0fo0g90k2pc43hm66pj0jvfhj3iipq','127.0.0.1',1501080907,'__ci_last_regenerate|i:1501080906;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('kf1s8f0j57ra1a7k8qj9s8ago0cihn5g','192.168.1.146',1500642984,'__ci_last_regenerate|i:1500642984;'),('kkb1u7l4on9n968b1t2r1cu0bgh2evpj','127.0.0.1',1500557219,'__ci_last_regenerate|i:1500557219;'),('kmpc3ukg80mshbk1b6af4st8s58geuo7','127.0.0.1',1500557271,'__ci_last_regenerate|i:1500557271;'),('kp3doadmtkv5p389g5t39o2k884t48a1','192.168.1.146',1500641853,'__ci_last_regenerate|i:1500641853;'),('krd4kbk7sue4s4ngjnhmk68fp2bjp3si','192.168.1.146',1500580561,'__ci_last_regenerate|i:1500580561;'),('ku3953nj7joel02v45memg5ijk1nchtg','127.0.0.1',1500472518,'__ci_last_regenerate|i:1500472518;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('l1sakvhmubrptt2t4eonnvlqr81373ff','127.0.0.1',1500407640,'__ci_last_regenerate|i:1500407640;'),('l3q824gm4hkm8noncsoq38moucajn50m','192.168.1.126',1501168647,'__ci_last_regenerate|i:1501168535;'),('lcj78t5b8vnme3o2r8s2panu07l6ti8b','192.168.1.146',1500643550,'__ci_last_regenerate|i:1500643550;'),('ld6e33aluderrlfi7c4a2qe958bt06lf','192.168.1.146',1500643236,'__ci_last_regenerate|i:1500643236;'),('lhc93g770qns13se7av40jruid6j10lm','127.0.0.1',1500580279,'__ci_last_regenerate|i:1500580269;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('ljhlljrqbjt2vgubgobbrc5nuqla4cpt','127.0.0.1',1500558487,'__ci_last_regenerate|i:1500558487;'),('lo57sqq21mn4olirspuctu5gkm5l9l0u','127.0.0.1',1500471636,'__ci_last_regenerate|i:1500471636;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('lu8kbge4mkl4j84td8gfon6ln4mjfjpi','192.168.1.146',1500580817,'__ci_last_regenerate|i:1500580817;'),('lukq6in7mmpuavpcamc7jvherl93dbk2','127.0.0.1',1500554748,'__ci_last_regenerate|i:1500554748;'),('lv53e4htafibluokoustcj52bbngbl9b','192.168.1.146',1500582718,'__ci_last_regenerate|i:1500582718;'),('m114lkes5vuq3n9nnoj84lfimbpjas6o','192.168.1.146',1500580723,'__ci_last_regenerate|i:1500580723;'),('m12t6bg4c0c9m7se10vg10e91s9ldsir','127.0.0.1',1500555971,'__ci_last_regenerate|i:1500555971;'),('m17qiaghhpht16m3nd0jtppobnoqc9gs','127.0.0.1',1500560915,'__ci_last_regenerate|i:1500560915;'),('m1pjcup5d8kjblkjsqreq3mr30p8959c','127.0.0.1',1500554668,'__ci_last_regenerate|i:1500554668;'),('m211m7ojgvjctmcagaqdhe4o1c22npfd','127.0.0.1',1500561196,'__ci_last_regenerate|i:1500561196;'),('m67m67f6982vnkm8r2qc2t0do52cgg8q','192.168.1.146',1500643763,'__ci_last_regenerate|i:1500643763;'),('m9p5j4boj5g9q0dod1dlokb15ebsdh8q','127.0.0.1',1500579122,'__ci_last_regenerate|i:1500579122;'),('mil0t3pq7r6lh8n9o4tlnvaf622hvbk8','192.168.1.146',1500641401,'__ci_last_regenerate|i:1500641401;'),('mlcams2f47u5fql3m1m9qupaav3nm9a7','127.0.0.1',1500558777,'__ci_last_regenerate|i:1500558777;'),('mqo1hei2ovdo4r1au2sn1aigurkl0371','127.0.0.1',1500554788,'__ci_last_regenerate|i:1500554788;'),('n221mj26h072sdqe0s6qlbsupj29mikv','192.168.1.122',1501075698,'__ci_last_regenerate|i:1501075675;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('n8kum46q24e4phpucvai3st6ots9ffq2','127.0.0.1',1500558540,'__ci_last_regenerate|i:1500558540;'),('nbiquaa9qe4j616smgnequ77hror7t2d','127.0.0.1',1500558174,'__ci_last_regenerate|i:1500558174;'),('nh0fu78p3u3ajcn3o4oqah3mm302fefh','127.0.0.1',1500410651,'__ci_last_regenerate|i:1500410651;'),('nm8mqjfsstti8412hs1aaho67ln2n313','127.0.0.1',1500561078,'__ci_last_regenerate|i:1500561078;'),('nmqei61ca4kvsuvfn3p2vphh8sak4mc2','127.0.0.1',1500558333,'__ci_last_regenerate|i:1500558333;'),('nppjco2bjnjandfnpljabsktm0k8lodj','127.0.0.1',1500560595,'__ci_last_regenerate|i:1500560595;'),('nrbrpbgpb5lualb493o9j4dtqa5bc25u','192.168.1.146',1500582391,'__ci_last_regenerate|i:1500582391;'),('nrq347f7537v1oh7rifj1q1704afak9j','127.0.0.1',1500560631,'__ci_last_regenerate|i:1500560631;'),('ns8h1bsfjop4eji7fbkmesh15d00tve1','127.0.0.1',1500560971,'__ci_last_regenerate|i:1500560971;'),('o0ieupkrlp3d22moe7opeffipgi6lonl','192.168.1.146',1500643343,'__ci_last_regenerate|i:1500643343;'),('o1hh9f09iar40ass233tuj1b0bg34mfl','127.0.0.1',1500561141,'__ci_last_regenerate|i:1500561141;'),('o57lct38sg2fessovo3rc4dikdifdelp','192.168.1.146',1500581540,'__ci_last_regenerate|i:1500581540;'),('o58c3oiqg4v82bg56tgmad7fnaeq80i5','127.0.0.1',1500561081,'__ci_last_regenerate|i:1500561081;'),('o7823gn2lrrlhmpb832sfougan2cgju8','127.0.0.1',1500559339,'__ci_last_regenerate|i:1500559339;'),('o7bjg5993ivgjpr9a4nc9jc488123itt','192.168.1.122',1501011013,'__ci_last_regenerate|i:1501010965;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('oaa2cdtcn6u25nmt7e5569m7kjk0h2f8','127.0.0.1',1500575635,'__ci_last_regenerate|i:1500575635;'),('odugolb7sha5hpqfrr0pm85f55dpm9qd','127.0.0.1',1500557773,'__ci_last_regenerate|i:1500557773;'),('okfl86jj4smqh1sg698qjrqhfcm1tmji','127.0.0.1',1500558826,'__ci_last_regenerate|i:1500558826;'),('om7rtlp5vgfvjc5bol1dpbaplvf2g6ml','192.168.1.146',1500582029,'__ci_last_regenerate|i:1500582029;'),('oo9dcs106n8guq67d6gr24u88bi9njlk','192.168.1.146',1500643597,'__ci_last_regenerate|i:1500643597;'),('orreoarq4ig3nequjaoa4josoljst5j4','127.0.0.1',1500557838,'__ci_last_regenerate|i:1500557838;'),('p09379ue0a68nclm1r8u9rt2t2u29ont','192.168.1.146',1500581698,'__ci_last_regenerate|i:1500581698;'),('pb25jri1opitktcoc5nv8ktb7to1kp5k','127.0.0.1',1500558181,'__ci_last_regenerate|i:1500558181;'),('pctqu04s5p42dkir1484d2gffg9p78ar','192.168.1.146',1500639905,'__ci_last_regenerate|i:1500639905;'),('pf1bopfnlp2904dlkb6std4q60mob780','192.168.1.146',1500643289,'__ci_last_regenerate|i:1500643289;'),('pg4hb237i675pq0j02d3gr155s1veaej','192.168.1.146',1500580814,'__ci_last_regenerate|i:1500580814;'),('phgj83tfk3o13o6mbn792lbr6mc2t06v','192.168.1.146',1500641837,'__ci_last_regenerate|i:1500641837;'),('pipskqg6fsvs7hob3mjnu9d2hci0uopu','127.0.0.1',1500476306,'__ci_last_regenerate|i:1500476122;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('pj4mt991ip6p16oiuhj3f2pfhi1p14qp','127.0.0.1',1500558670,'__ci_last_regenerate|i:1500558670;'),('ppf4k5s6mk1q528lm474848nhflvabmd','127.0.0.1',1500554734,'__ci_last_regenerate|i:1500554734;'),('pq3pjs7q5k43hdssq8tnqlbep9jntghs','192.168.1.146',1500584069,'__ci_last_regenerate|i:1500584069;'),('pr2m763scu75vmmifv235b5ei1v1phmo','127.0.0.1',1500554748,'__ci_last_regenerate|i:1500554748;'),('ps5a0g4d01pj3ha3opuh3jnb10k5ok5u','127.0.0.1',1500556127,'__ci_last_regenerate|i:1500556127;'),('psqld2qtcj1bak9ble7o6q79l9je5kqd','127.0.0.1',1500561001,'__ci_last_regenerate|i:1500561001;'),('q1951utovp5et8kbk7iinvgumcvh546h','127.0.0.1',1500397875,'__ci_last_regenerate|i:1500397875;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:88:\"TglXkFiKbR1e+kpq+bW2eSlNT7YGGPrdWgpl1TidhiTALjZjN4O3ip9FaqQQekFmn9c4KFN8EAf5QLpckbCvWA==\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('q3opnigu4jgp8tflh1d1mkhp1nqma2hk','192.168.1.146',1500580697,'__ci_last_regenerate|i:1500580697;'),('qafrn1nm79oqif18cv424hnk9gpk9fkj','192.168.1.146',1500641234,'__ci_last_regenerate|i:1500641234;'),('qalnv8r9iavs847gbu83ovd3c0begbaa','127.0.0.1',1500554250,'__ci_last_regenerate|i:1500554250;'),('qdvofh5n1b15lf933r5ah5dspblhpd4l','192.168.1.146',1500641686,'__ci_last_regenerate|i:1500641686;'),('qe3undgn609fs9pdohlg1ane5f3iu9q3','192.168.1.146',1500639842,'__ci_last_regenerate|i:1500639842;'),('qjbb79ok9tsbpkkmcflnhncqagkoi8kb','127.0.0.1',1500555417,'__ci_last_regenerate|i:1500555417;'),('qjsfb410g674i4jghb5grfmfrmom26d8','192.168.1.146',1500643035,'__ci_last_regenerate|i:1500643035;'),('ql8767rec8ird0fc94rsvvvogtm169sn','192.168.1.146',1500582562,'__ci_last_regenerate|i:1500582562;'),('queh1sh7olpmi3s4ehi6cae7qigrjvg3','127.0.0.1',1500558993,'__ci_last_regenerate|i:1500558993;'),('r1vnku65vqu1baddri5uhbc1445n5rf0','127.0.0.1',1500913598,'__ci_last_regenerate|i:1500913598;'),('r3jpt8otua3dbl24o6k2jm2j35t0vvd8','192.168.1.146',1500581288,'__ci_last_regenerate|i:1500581288;'),('r97vrga4l0n7sf75enapbvhvlu8v1l66','127.0.0.1',1500470951,'__ci_last_regenerate|i:1500470744;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('rbt245ucdhr1oumpq85s4klicrco2nlo','127.0.0.1',1500555479,'__ci_last_regenerate|i:1500555479;'),('rovl3lff558pvi7ctmj3eum3vfvr6sna','192.168.1.146',1500643218,'__ci_last_regenerate|i:1500643218;'),('s8lapg018h20u2ihunok8775rj96tksd','192.168.1.146',1500582005,'__ci_last_regenerate|i:1500582005;'),('sa92nt184bfklju5riclfoa1i4ergvqv','127.0.0.1',1500560888,'__ci_last_regenerate|i:1500560888;'),('sbmh1lurpfgr55bakuequ04t20irk904','127.0.0.1',1500409990,'__ci_last_regenerate|i:1500409958;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:88:\"TglXkFiKbR1e+kpq+bW2eSlNT7YGGPrdWgpl1TidhiTALjZjN4O3ip9FaqQQekFmn9c4KFN8EAf5QLpckbCvWA==\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('se6e4u7j3cegjqm7fltj9mvq5qm2kei0','127.0.0.1',1500481930,'__ci_last_regenerate|i:1500481925;'),('sfkb0rh3l369upkkv5c1l3pahhgi0h5g','192.168.1.146',1500639765,'__ci_last_regenerate|i:1500639765;'),('shbjph6fbqnjr5umrkkhtsrtvf18pn45','127.0.0.1',1500558587,'__ci_last_regenerate|i:1500558587;'),('simmndfs9832nhu5iis0oo5madrsr1vl','192.168.1.146',1500581543,'__ci_last_regenerate|i:1500581543;'),('smrqrpgplo1fns8gbopp3qef2gssqofm','127.0.0.1',1500559452,'__ci_last_regenerate|i:1500559452;'),('so911cmqblus5cd800qfuek7reo8rchg','192.168.1.146',1500580595,'__ci_last_regenerate|i:1500580595;'),('sotq4n1hjefmg180ljauso33u93cae63','127.0.0.1',1500559007,'__ci_last_regenerate|i:1500559007;'),('sovmk2r168clqvln2ru3f2eks046g7ao','127.0.0.1',1500558156,'__ci_last_regenerate|i:1500558156;'),('sr1nu7e3mb6ub2ik0nd1oqb2kh0cca9a','192.168.1.146',1500580756,'__ci_last_regenerate|i:1500580756;'),('sr9uoufmtlu44i0ramn3jpjqc466rfln','127.0.0.1',1500553661,'__ci_last_regenerate|i:1500553661;'),('st9kkcnmq56vs94ooailnjgv6dbvdq7k','127.0.0.1',1500646263,'__ci_last_regenerate|i:1500646231;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('sv4n601fntdsbdlo28dufumpv12lip38','127.0.0.1',1500555029,'__ci_last_regenerate|i:1500555029;'),('tbj9bg5ed21d3161vlutfrl00a40mre8','192.168.1.146',1500581167,'__ci_last_regenerate|i:1500581167;'),('tnd050p6lv4o8c3mdondiqh2auidnkpq','127.0.0.1',1500560623,'__ci_last_regenerate|i:1500560623;'),('tnkk5e6i2on0vb37vmq1hhtfk8btiq1b','192.168.1.146',1500639882,'__ci_last_regenerate|i:1500639882;'),('tp1clmjaur2obqknl1qo5gcv9sjqhnvc','127.0.0.1',1500559486,'__ci_last_regenerate|i:1500559486;'),('tshkmslunfo7vflnv5ace9qhgemtk6b7','192.168.1.146',1500643285,'__ci_last_regenerate|i:1500643285;'),('u8ts5tp9kuov6sr920m074kigrop9suf','127.0.0.1',1500554659,'__ci_last_regenerate|i:1500554659;'),('u9d134tj2mvtrtiqg2h9go6csvr1huja','127.0.0.1',1500554126,'__ci_last_regenerate|i:1500554126;'),('ualros8jj1ovk48lj9a2k1br7hq33d59','192.168.1.146',1500642765,'__ci_last_regenerate|i:1500642765;'),('udlcv96o5qc577nvsvvukg2o313bemeb','127.0.0.1',1500555337,'__ci_last_regenerate|i:1500555337;'),('uiqo8ieto80uce9132s97mf7hsrbl30t','192.168.1.146',1500642333,'__ci_last_regenerate|i:1500642333;'),('ukq1mouc6hu3eafm4qb90q0fc27b5h58','127.0.0.1',1500564820,'__ci_last_regenerate|i:1500564820;'),('unjcdr2io8e8652nc8ld4o1pbioau0f7','127.0.0.1',1500899442,'__ci_last_regenerate|i:1500899381;admin|O:8:\"stdClass\":6:{s:10:\"usuario_id\";s:1:\"1\";s:4:\"nome\";s:13:\"Administrador\";s:5:\"email\";s:18:\"admin@admin.com.br\";s:5:\"senha\";s:60:\"$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.\";s:16:\"usuarios_tipo_id\";s:1:\"1\";s:5:\"ativo\";s:1:\"1\";}'),('upue920n7ehfammdqsrrtkvukn52cn2q','192.168.1.146',1500643776,'__ci_last_regenerate|i:1500643776;'),('v1efap4qvl1r4tis2983udmm7ksbjkmv','192.168.1.146',1500642353,'__ci_last_regenerate|i:1500642353;'),('v8dtvskqcrkiqj7toif7kj3rc0jse7cv','192.168.1.146',1500641297,'__ci_last_regenerate|i:1500641297;'),('vmqh0ea14ja3527oajocc1oittp4f17o','127.0.0.1',1500554875,'__ci_last_regenerate|i:1500554875;'),('vtegigjs19aifju7kmsugs7s25lopsi3','192.168.1.146',1500582456,'__ci_last_regenerate|i:1500582456;');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminais`
--

DROP TABLE IF EXISTS `terminais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminais` (
  `terminal_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`terminal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminais`
--

LOCK TABLES `terminais` WRITE;
/*!40000 ALTER TABLE `terminais` DISABLE KEYS */;
INSERT INTO `terminais` VALUES (1,'Painel 1'),(2,'Painel 2'),(3,'Painel 3');
/*!40000 ALTER TABLE `terminais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_documentos` (
  `tipo_documento_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_documento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` VALUES (1,'RG'),(2,'CPF'),(3,'CNH');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `usuarios_tipo_id` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `index4` (`email`),
  KEY `fk_usuarios_usuarios_tipo1_idx` (`usuarios_tipo_id`),
  KEY `index3` (`email`),
  CONSTRAINT `fk_usuarios_usuarios_tipo1` FOREIGN KEY (`usuarios_tipo_id`) REFERENCES `usuarios_tipo` (`usuarios_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin@admin.com.br','$2y$10$S6FlYL/kFg.eyelxzYiAveWrq.CTQsChubXqAy.LOXPxzm4K.Sva.',1,1),(2,'tiago Feminino de almeida','admin@admiin.com.br','$2y$10$5...g4kqkPtJZBmrnF9pne7i3o4yvbhySpqATfYADBIkhYUDNSxQ6',1,1),(3,'Mauro Marssola','marssolinha@hotmail.com','$2y$10$DJHNq.CURnO7llsJi/N4Hu9TFJoZZoA8vCGYULRGHfCejUL5ty/8i',1,1),(4,'Fenelon Ursulino','marssolinha@gmail.com','$2y$10$FqC3QeQrn40qCEMOhSnbHudwlD8UVk4s8Lf5cjW1L8Siewp8SEdxS',2,1),(5,'Flávio Pereira da Cruz','flavio@wvtodoz.com.br','$2y$10$W6bkG7/VLis/W.2v0gUfd.3kkmsWE3zetLJZxfBU3c7q9iiGGpWAS',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_tipo`
--

DROP TABLE IF EXISTS `usuarios_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_tipo` (
  `usuarios_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuarios_tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_tipo`
--

LOCK TABLES `usuarios_tipo` WRITE;
/*!40000 ALTER TABLE `usuarios_tipo` DISABLE KEYS */;
INSERT INTO `usuarios_tipo` VALUES (1,'admin'),(2,'usuario');
/*!40000 ALTER TABLE `usuarios_tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-04 15:02:51
