/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.17 : Database - yd_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yd_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yd_db`;

/*Table structure for table `t_classify` */

DROP TABLE IF EXISTS `t_classify`;

CREATE TABLE `t_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletestatus` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_classify` */

insert  into `t_classify`(`id`,`deletestatus`,`name`) values (1,0,'111111'),(2,0,'22222');

/*Table structure for table `t_fenlei` */

DROP TABLE IF EXISTS `t_fenlei`;

CREATE TABLE `t_fenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletestatus` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_fenlei` */

/*Table structure for table `t_gonggao` */

DROP TABLE IF EXISTS `t_gonggao`;

CREATE TABLE `t_gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_gonggao` */

/*Table structure for table `t_gouwuche` */

DROP TABLE IF EXISTS `t_gouwuche`;

CREATE TABLE `t_gouwuche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK445E3420F624A07E` (`productid`),
  KEY `FK445E34209F84B2CC` (`userid`),
  CONSTRAINT `FK445E34209F84B2CC` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK445E3420F624A07E` FOREIGN KEY (`productid`) REFERENCES `t_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_gouwuche` */

/*Table structure for table `t_manage` */

DROP TABLE IF EXISTS `t_manage`;

CREATE TABLE `t_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_manage` */

insert  into `t_manage`(`id`,`password`,`username`) values (1,'FF5E61835C355E755EEF9321','admin');

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_notice` */

insert  into `t_notice`(`id`,`biaoti`,`content`,`createtime`,`deletestatus`) values (1,'zzzzzzz','sss','2017-05-04 14:53:31',0);

/*Table structure for table `t_order_goods` */

DROP TABLE IF EXISTS `t_order_goods`;

CREATE TABLE `t_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `orderid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sjname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `xiangqing` varchar(255) DEFAULT NULL,
  `zongjia` double NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8224F8E8471EE685` (`userid`),
  CONSTRAINT `FK8224F8E8471EE685` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_goods` */

insert  into `t_order_goods`(`id`,`address`,`beizhu`,`createtime`,`deletestatus`,`orderid`,`phone`,`sjname`,`status`,`xiangqing`,`zongjia`,`userid`) values (1,'11111','11111111111','2017-05-04 14:15:39',0,'1493878539893','18910588749','33333333','未处理',' 商品名： 2222222,购买数量:1,单价22.0,￥小计22.0',22,1);

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `dianjishu` int(11) NOT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `jiage` double NOT NULL,
  `maoshu` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tuijian` varchar(255) DEFAULT NULL,
  `xiaoliang` int(11) NOT NULL,
  `fenleiid` int(11) DEFAULT NULL,
  `classifyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC585804F4E1ECB1` (`fenleiid`),
  KEY `FKC585804BA45E07E` (`classifyid`),
  CONSTRAINT `FKC585804BA45E07E` FOREIGN KEY (`classifyid`) REFERENCES `t_classify` (`id`),
  CONSTRAINT `FKC585804F4E1ECB1` FOREIGN KEY (`fenleiid`) REFERENCES `t_classify` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`createtime`,`deletestatus`,`dianjishu`,`imgpath`,`jiage`,`maoshu`,`name`,`tuijian`,`xiaoliang`,`fenleiid`,`classifyid`) values (1,'2017-05-04 11:34:25',0,0,'20170504113425.jpg',111,'11','1111111111','未推荐',0,1,NULL),(2,'2017-05-04 14:09:13',0,13,'20170504140913.jpg',22,'2222','2222222','未推荐',1,NULL,1),(3,'2017-05-04 14:53:17',0,0,'20170504145317.jpg',33333,'333333333','333333333','未推荐',0,NULL,2);

/*Table structure for table `t_shop_cart` */

DROP TABLE IF EXISTS `t_shop_cart`;

CREATE TABLE `t_shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK445E34207CDA625` (`productid`),
  KEY `FK445E3420471EE685` (`userid`),
  CONSTRAINT `FK445E3420471EE685` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK445E34207CDA625` FOREIGN KEY (`productid`) REFERENCES `t_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_shop_cart` */

insert  into `t_shop_cart`(`id`,`createtime`,`deletestatus`,`number`,`productid`,`userid`) values (1,'2017-05-04 14:15:26',1,1,2,1);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`address`,`createtime`,`deletestatus`,`email`,`password`,`phone`,`qq`,`truename`,`username`) values (1,'111111','2017-05-04 14:15:04',0,'zdzz@163.com','FF5E61835C355E755EEF9321','18910588749','49849','111111','zdg'),(2,'111111','2017-05-04 17:01:51',0,'111@qq.com','FF5E61835C355E755EEF9321','18910588749','111111','111111','admin2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
