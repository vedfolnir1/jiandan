/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.27 : Database - jiandan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiandan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiandan`;

/*Table structure for table `j_board` */

DROP TABLE IF EXISTS `j_board`;

CREATE TABLE `j_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `boardName` varchar(50) NOT NULL COMMENT '板块名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `j_board` */

insert  into `j_board`(`id`,`boardName`) values (1,'树洞'),(2,'树洞');

/*Table structure for table `j_comment` */

DROP TABLE IF EXISTS `j_comment`;

CREATE TABLE `j_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '评论用户的id',
  `uname` varchar(50) DEFAULT NULL COMMENT '评论用户的姓名',
  `ctext` text COMMENT '评论内容',
  `bgid` int(11) DEFAULT NULL COMMENT '贴子的id',
  `cdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uname` (`uname`),
  KEY `bgid` (`bgid`),
  CONSTRAINT `j_comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `juser` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `j_comment_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `juser` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `j_comment_ibfk_3` FOREIGN KEY (`bgid`) REFERENCES `jblog` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `j_comment` */

insert  into `j_comment`(`id`,`uid`,`uname`,`ctext`,`bgid`,`cdate`) values (1,2,'user1',NULL,2,NULL),(2,2,'user1','评论',5,'2019-10-22 22:25'),(3,2,'user1','评论2',5,'2019-10-23 23:18'),(4,6,'user3','这是一张笑脸图',6,'2019-10-23 23:10'),(5,7,'user4','评论最终测试1 用户：user4',7,'2019-10-10 10:28'),(6,2,'user1','评论最终测试 2 用户：用户：user1',7,'2019-10-10 10:15'),(7,2,'user1','评论最终测试 3  用户：user1',7,'2019-10-10 10:57'),(8,2,'user1','评论最终测试 3  用户：user1',7,'2019-10-10 10:2'),(9,2,'user1','sd',7,'2019-10-20 20:28');

/*Table structure for table `jblog` */

DROP TABLE IF EXISTS `jblog`;

CREATE TABLE `jblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '帖子发表人的id',
  `jdate` varchar(50) NOT NULL COMMENT '发帖时间',
  `bid` int(11) DEFAULT NULL COMMENT '板块id',
  `profile` text COMMENT '正文内容',
  `imageurl` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `blogtitle` varchar(50) DEFAULT NULL COMMENT '帖子标题',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `bid` (`bid`),
  CONSTRAINT `jblog_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `juser` (`id`),
  CONSTRAINT `jblog_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `j_board` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `jblog` */

insert  into `jblog`(`id`,`uid`,`jdate`,`bid`,`profile`,`imageurl`,`blogtitle`) values (1,2,'2019-10-17 17:36',2,'测试用正文','https://wx1.sinaimg.cn/mw690/771d5a55ly1g95say0qujj21kw145atg.jpg','测试用标题1'),(2,2,'2019-10-17 17:17',2,'测试用正文2','','测试用标题2'),(3,2,'2019-10-22 22:2',2,'测试用标题3','https://wx2.sinaimg.cn/mw690/b36f5f00ly1g95el274dyj20k50drwmw.jpg','测试用标题3'),(4,2,'2019-10-9 9:5',2,'测试正文排版，以下内容无意义/','https://wx2.sinaimg.cn/mw690/b36f5f00ly1g95el274dyj20k50drwmw.jpg','测试用标题4'),(5,2,'2019-10-11 11:4',2,'测试用正文5，测试分页效果，size=4 ，使用bootscarp分页插件','https://wx1.sinaimg.cn/mw690/4abc2d1fgy1g97re22ly7j20dv09c0t0.jpg','测试用标题5'),(6,6,'2019-10-23 23:53',2,'测试发帖+评论功能','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574534444221&di=6ceafac7ea8e9554601935a5827b810c&imgtype=0&src=http%3A%2F%2Fimg1.doubanio.com%2Flpic%2Fs26869937.jpg','测试用标题5'),(7,7,'2019-10-10 10:48',2,'这是一张 ACG 的 城市图/发帖+评论+显示最终测试/','http://img.cntraveler.com.cn/userfiles/201312/138673394679.jpg','user4的标题'),(8,2,'2019-10-21 21:58',1,'仿煎蛋的简易论坛','http://wx3.sinaimg.cn/mw1024/007mAZuUly1g9a70fenipg30m80xc4qv.gif','公告1'),(9,2,'2019-10-21 21:55',1,'测试首页','http://wx4.sinaimg.cn/mw600/007aPnLRgy1g99cmlnq37j30dw0g778h.jpg','公告2');

/*Table structure for table `juser` */

DROP TABLE IF EXISTS `juser`;

CREATE TABLE `juser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `isAdmin` int(11) DEFAULT NULL COMMENT '是否是管理员，1代表是，0代表不是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `juser` */

insert  into `juser`(`id`,`username`,`password`,`email`,`nickname`,`isAdmin`) values (1,'hcv96','hcv96123','hcv96@qq.com','海上漫步',0),(2,'user1','07ccd8d35a33f50a1ccae009e036fa13','user1@qq.com','user1',1),(5,'user2','07ccd8d35a33f50a1ccae009e036fa13','user2@qq.com','user2',0),(6,'user3','07ccd8d35a33f50a1ccae009e036fa13','user3@qq.com','user3',0),(7,'user4','07ccd8d35a33f50a1ccae009e036fa13','user4@qq.com','user4',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
