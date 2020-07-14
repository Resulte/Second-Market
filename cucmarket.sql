/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.5.40 : Database - cucmarket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cucmarket` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cucmarket`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add goods info',8,'add_goodsinfo'),(23,'Can change goods info',8,'change_goodsinfo'),(24,'Can delete goods info',8,'delete_goodsinfo'),(25,'Can add cart info',9,'add_cartinfo'),(26,'Can change cart info',9,'change_cartinfo'),(27,'Can delete cart info',9,'delete_cartinfo');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$30000$14dozOowH3vS$xsZrUcSqqsxhCxJiI/JO/OuBQn2AVXunbpgjh7i80sc=','2020-06-30 02:42:51',1,'admin','','','',1,1,'2020-06-23 01:18:45');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `cart_cartinfo` */

DROP TABLE IF EXISTS `cart_cartinfo`;

CREATE TABLE `cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartinfo_buyer_id_b65eceb6_fk_user_userinfo_id` (`buyer_id`),
  KEY `cart_cartinfo_589eff59` (`good_id`),
  CONSTRAINT `cart_cartinfo_good_id_87c55252_fk_goods_goodsinfo_id` FOREIGN KEY (`good_id`) REFERENCES `goods_goodsinfo` (`id`),
  CONSTRAINT `cart_cartinfo_buyer_id_b65eceb6_fk_user_userinfo_id` FOREIGN KEY (`buyer_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `cart_cartinfo` */

insert  into `cart_cartinfo`(`id`,`title`,`type`,`picture`,`number`,`price`,`buyer_id`,`good_id`) values (1,'活着，为了什么','books','goods/2.jpg','1','48.00',1,5),(10,'hefanxi','cloth','goods/1_Rd030aK.jpg','1','2500.00',1,10);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2020-06-23 01:28:42','1','test',1,'[{\"added\": {}}]',8,1),(2,'2020-06-23 01:34:40','2','test',1,'[{\"added\": {}}]',8,1),(3,'2020-06-23 01:37:10','3','test2',1,'[{\"added\": {}}]',8,1),(4,'2020-06-23 01:39:11','3','test2',3,'',8,1),(5,'2020-06-23 01:39:56','4','test2',1,'[{\"added\": {}}]',8,1),(6,'2020-06-23 01:48:32','5','活着，为了什么',1,'[{\"added\": {}}]',8,1),(7,'2020-06-23 01:51:25','6','追风筝的人',1,'[{\"added\": {}}]',8,1),(8,'2020-06-23 02:09:08','7','索尼FDR-AX60',1,'[{\"added\": {}}]',8,1),(9,'2020-06-23 02:11:53','8','JVC GZ-RY980',1,'[{\"added\": {}}]',8,1),(10,'2020-06-23 04:27:54','9','GZ-RY775',1,'[{\"added\": {}}]',8,1),(11,'2020-06-23 04:38:02','10','hefanxi',1,'[{\"added\": {}}]',8,1),(12,'2020-06-23 04:39:06','11','NEWFOUNDN',1,'[{\"added\": {}}]',8,1),(13,'2020-06-23 04:40:02','12','ONE ONLY',1,'[{\"added\": {}}]',8,1),(14,'2020-06-23 07:00:34','13','木梳',1,'[{\"added\": {}}]',8,1),(15,'2020-06-23 07:01:24','14','陶碗',1,'[{\"added\": {}}]',8,1),(16,'2020-06-23 07:02:09','15','迷你灯',1,'[{\"added\": {}}]',8,1),(17,'2020-06-23 07:07:00','16','永久山地车',1,'[{\"added\": {}}]',8,1),(18,'2020-06-23 07:07:39','17','桑浦山地车',1,'[{\"added\": {}}]',8,1),(19,'2020-06-23 07:08:52','18','猛犸王山地车',1,'[{\"added\": {}}]',8,1),(20,'2020-06-23 07:17:23','19','纸板材料',1,'[{\"added\": {}}]',8,1),(21,'2020-06-23 07:17:55','20','布料',1,'[{\"added\": {}}]',8,1),(22,'2020-06-23 07:18:21','21','手工纸',1,'[{\"added\": {}}]',8,1),(23,'2020-06-23 07:29:30','22','小王子',1,'[{\"added\": {}}]',8,1),(24,'2020-06-23 07:39:22','23','撒哈拉的故事',1,'[{\"added\": {}}]',8,1),(25,'2020-06-23 07:41:36','24','挪威的森林',1,'[{\"added\": {}}]',8,1),(26,'2020-06-23 07:42:47','25','月亮和六便士',1,'[{\"added\": {}}]',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(9,'cart','cartinfo'),(5,'contenttypes','contenttype'),(8,'goods','goodsinfo'),(6,'sessions','session'),(7,'user','userinfo');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2020-06-20 13:59:20'),(2,'auth','0001_initial','2020-06-20 13:59:20'),(3,'admin','0001_initial','2020-06-20 13:59:20'),(4,'admin','0002_logentry_remove_auto_add','2020-06-20 13:59:20'),(5,'contenttypes','0002_remove_content_type_name','2020-06-20 13:59:21'),(6,'auth','0002_alter_permission_name_max_length','2020-06-20 13:59:21'),(7,'auth','0003_alter_user_email_max_length','2020-06-20 13:59:21'),(8,'auth','0004_alter_user_username_opts','2020-06-20 13:59:21'),(9,'auth','0005_alter_user_last_login_null','2020-06-20 13:59:21'),(10,'auth','0006_require_contenttypes_0002','2020-06-20 13:59:21'),(11,'auth','0007_alter_validators_add_error_messages','2020-06-20 13:59:21'),(12,'auth','0008_alter_user_username_max_length','2020-06-20 13:59:21'),(13,'sessions','0001_initial','2020-06-20 13:59:21'),(14,'user','0001_initial','2020-06-21 12:54:09'),(15,'goods','0001_initial','2020-06-23 01:19:42'),(16,'goods','0002_auto_20200623_1005','2020-06-23 02:05:55'),(17,'goods','0003_auto_20200623_1512','2020-06-23 07:13:02'),(18,'goods','0004_auto_20200623_1516','2020-06-23 07:16:41'),(19,'goods','0005_goodsinfo_userid','2020-06-30 01:16:41'),(20,'goods','0006_auto_20200630_0917','2020-06-30 01:18:04'),(21,'cart','0001_initial','2020-06-30 06:44:01'),(22,'cart','0002_auto_20200630_1443','2020-06-30 06:44:01');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('t8cp893c5coqauzam6kygrd7k49z86nz','ZmM4NThkMzIyNzVkOTI5N2FiZmI4OGNjNzI1YTQxMTQ0ZWY5MTVhYjp7InVzZXJfaWQiOjEsIm51bWJlciI6IjIwMTcxMTExMTExIiwidXNlcm5hbWUiOiJcdTY3NGVcdTU2ZGIifQ==','2020-07-06 10:25:21'),('t9r67iqunz98nemg2p5r89wlff7qu7xr','ZmM4NThkMzIyNzVkOTI5N2FiZmI4OGNjNzI1YTQxMTQ0ZWY5MTVhYjp7InVzZXJfaWQiOjEsIm51bWJlciI6IjIwMTcxMTExMTExIiwidXNlcm5hbWUiOiJcdTY3NGVcdTU2ZGIifQ==','2020-07-14 06:54:54');

/*Table structure for table `goods_goodsinfo` */

DROP TABLE IF EXISTS `goods_goodsinfo`;

CREATE TABLE `goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsinfo_3491001b` (`user_id`),
  CONSTRAINT `goods_goodsinfo_user_id_84b4d3d0_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goodsinfo` */

insert  into `goods_goodsinfo`(`id`,`title`,`type`,`picture`,`price`,`isDelete`,`address`,`description`,`user_id`) values (1,'特别的猫','books','goods/1.jpg','28.00',0,'梆子井','2007年诺贝尔文学奖得主多丽丝·莱辛一部非虚构类代表作《特别的猫》中文版，多丽丝·莱辛是个爱猫成痴的作家，她在《特别的猫》里讲述了人与猫之间的动人故事，细数曾经让她欢欣也让她忧愁的猫。在她笔下，猫的世界精彩纷呈。故事从莱辛在非洲的童年开始。娇美的公主灰咪咪和低调的黑猫咪因为争宠上演了一出出情景剧；同为猫妈妈，育儿之道却大相径庭，令观者莞尔；',1),(5,'活着，为了什么','books','goods/2.jpg','48.00',0,'中蓝公寓','在2004年法国举行的最受喜爱女性评选活动中，出人意料，法国人心中最受喜爱的女性，既不是美丽的苏菲·玛索，也不是法国宝贝朱丽叶·比诺什，而是已经95岁高龄的以马内利修女。马内利修女(Soeur Emmanuelle)原名玛德莲·桑刚，1908年出生在比利时首都布鲁塞尔，1928年正式宣誓成为修女。正如以马内利的名字一样，以马内利修女一生践行着“神与我们同在”的上帝的旨意，几乎将毕生精力都献给了穷人',1),(6,'追风筝的人','books','goods/3.jpg','20.00',0,'48教','小说以第一人称的角度讲述了阿米尔的故事。阿米尔生于1963年喀布尔的一个富人社区中的一个富裕家庭。其父亲“爸爸”是普什图人，一名法官的儿子，成功的地毯商人。 阿米尔家的仆人阿里的儿子哈桑则出身哈扎拉人。阿米尔和哈桑是好玩伴，哈桑是一个特别忠实，正直，一心只为阿米尔少爷着想的人， 两个人经常一起玩耍、游戏。阿米尔是出色的“风筝斗士”，即善于用自己的风筝切断别人的风筝的线；哈桑也是杰出的“风筝追逐者”',1),(7,'索尼FDR-AX60','digital','goods/1_bmWin2J.png','15100.00',0,'孔子雕像','中关村在线 济南行情）近日，索尼HXR-NX100摄像机在济南经销商山东影视器材广电商场促销',1),(8,'JVC GZ-RY980','digital','goods/2_YGjBABk.jpg','18200.00',0,'1号楼','JVC GZ-RY980是一款具备五米防水、1.5米防摔、IPX5防尘以及-10°C防寒性能的四防高清摄像机。这款摄像机可以拍摄1080P的高清影像，拥有60倍动态变焦能力，在低照度下也能轻松拍摄，A.I.S增强稳定器提供防抖支持。',1),(9,'GZ-RY775','digital','goods/3_RPyHLn4.jpg','25000.00',0,'星光超市','四防一直是JVC旗下主力摄像机产品的一大特色，优异的防护性能使得JVC摄像机可以在各种拍摄环境下使用起来更加让人放心。而随着如今4KUHD规格的逐渐普及，JVC也应势推出了全新的4K四防摄像机GZ-RY775。',1),(10,'hefanxi','cloth','goods/1_Rd030aK.jpg','2500.00',0,'中蓝公寓','全蕾丝，有内衬，这个裙子在一家精品店意外发现的，真的是超华丽超美， 版型也很好，袖口丝带小心机可以绑成一个小蝴蝶结，细节处见精致。不是超级软的那种蕾丝，这个比较有质感，这样的蕾丝比较饱满，可以保证版型。颜色也很少见，我个人定义为粉杏色，就是很春夏的颜色没错了。',1),(11,'NEWFOUNDN','cloth','goods/2_aqOMSrn.jpg','1800.00',0,'孔子雕像','做内搭在风衣里面或者是单穿都可以，可以很甜美，也可以很女人。 蕾丝裙，女人衣柜必备。',1),(12,'ONE ONLY','cloth','goods/3_ApP1Wp3.jpg','1500.00',0,'1号楼','春装款。俏皮刺绣圆领羊羔毛 不是超级软的那种蕾丝，这个比较有质感，这样的蕾丝比较饱满，可以保证版型。',1),(13,'木梳','daily','goods/1_m2elpKp.jpg','25.00',0,'梆子井','法国一个艺术家把一些日用品加上了萌萌的设计，看完简直要忘记物品原来的用途了。。',1),(14,'陶碗','daily','goods/2_Bt42jOr.jpg','18.00',0,'48教','汉代的烧陶工艺吸收了原始瓷器的器表着釉技术，并创制了以铜为呈色剂的低温铅釉陶器。 这种陶器的应用和推广，为我国后来各种不同颜色低温铅釉陶器的出现与发展奠定了基础。',1),(15,'迷你灯','daily','goods/3_oFZXwG1.jpg','350.00',0,'1号楼','小巧精致，方便携带。此电器主要放置在写字台或餐桌上，以供照明之用。台灯的光亮照射范围相对比较小和集中.',1),(16,'永久山地车','traffic','goods/1_ei1iL23.jpg','2500.00',0,'梆子井','如果说日常骑行公路车是一个温柔的孩子，那此款公路探险车，则是一个淘气冒险的少年，它给你带来的不仅仅是舒适的骑行体验，更是让你在骑行中尽情领略奇妙的大自然世界带给你的美妙骑行感觉！',1),(17,'桑浦山地车','traffic','goods/2_YNUOz7o.jpg','1820.00',0,'孔子雕像','魅惑的设计、创新的科技、完美的架构、盛名的威望、独一无二的拥有，飞奔骑闯天路、勇闯川藏、穿越山径、碾轧碎石、穿梭泥泞、飞奔柏油，',1),(18,'猛犸王山地车','traffic','goods/3_K0cpvKq.jpg','850.00',0,'南门门口','名字取自藏文，涂装设计，延续了骑闯天路限量版的涂装灵感西藏文化中“五彩经幡”的颜色， 整体色调灵感源自西藏三大圣湖，纳木措、玛旁雍措、羊卓雍措的色彩， 上管图案为串联起来的米拉山、折多山、东达山的等高线地形图，三座圣山与三片圣湖的交相辉映',1),(19,'纸板材料','other','goods/1_pPAtEq0.jpg','75.00',0,'中蓝公寓','',1),(20,'布料','other','goods/2_PWXvWS6.jpg','140.00',0,'中蓝公寓','',1),(21,'手工纸','other','goods/3_dZT6zi0.jpg','60.00',0,'梆子井','',1),(22,'小王子','books','goods/11.jpg','25.00',0,'星光超市','本书的主人公是来自外星球的小王子。书中以一位飞行员作为故事叙述者，讲述了小王子从自己星球出发前往地球的过程中，所经历的各种历险。作者以小王子的孩子式的眼光，透视出成人的空虚、盲目，愚妄和死板教条，用浅显天真的语言写出了人类的孤独寂寞、没有根基随风流浪的命运。同时，也表达出作者对金钱关系的批判，对真善美的讴歌。',1),(23,'撒哈拉的故事','books','goods/22.jpg','30.00',0,'梆子井','《撒哈拉的故事》是一系列以沙漠为背景的故事。 因为一本地理杂志的吸引，三毛背着行囊走进了荒凉单调的撒哈拉沙漠，在沙漠中寻找感受生活的真善美，书中每个故事都充溢着一种浪漫、浓情的异域情调，字里行间反映着大沙漠独有的地形地貌与风土人情。',1),(24,'挪威的森林','books','goods/33.jpg','27.00',0,'中蓝公寓','《挪威的森林》是日本作家村上春树于1987年所著的一部长篇爱情小说。 故事讲述主角纠缠在情绪不稳定且患有精神疾病的直子和开朗活泼的小林绿子之间，展开了自我成长的旅程。',1),(25,'月亮和六便士','books','goods/44.jpg','37.00',0,'孔子雕像','作品以法国印象派画家保罗·高更的生平为素材，描述了一个原本平凡的伦敦证券经纪人思特里克兰德，突然着了艺术的魔，抛妻弃子，绝弃了旁人看来优裕美满的生活，奔赴南太平洋的塔希提岛，用画笔谱写出自己光辉灿烂的生命，把生命的价值全部注入绚烂的画布的故事。',1),(26,'索尼α77','digital','goods/111.jpg','11450.00',0,'梆子井','索尼（Sony）发布中端半透镜单电SLT-A77，搭载2430万像素APS-C Exmor HD CMOS传感器，19点相位检测式对焦系统，感光度ISO 100-16000，机身防抖，1200区测光系统，快门速度30-1/8000s，连拍速度13fps（RAW），3\" 92万点Xtra Fine TruBlack LCD屏幕，240万点OLED电子取景器（EVF），可拍摄1080@60fps全高清视频。',1);

/*Table structure for table `user_userinfo` */

DROP TABLE IF EXISTS `user_userinfo`;

CREATE TABLE `user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `number` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_userinfo` */

insert  into `user_userinfo`(`id`,`username`,`password`,`number`) values (1,'李四','3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d','20171111111');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
