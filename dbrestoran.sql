/*
SQLyog Ultimate v10.42 
MySQL - 5.6.24 : Database - dbrestoran
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbrestoran` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbrestoran`;

/*Table structure for table `bahan_baku` */

DROP TABLE IF EXISTS `bahan_baku`;

CREATE TABLE `bahan_baku` (
  `kdbahan` varchar(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglexpired` date NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`kdbahan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bahan_baku` */

insert  into `bahan_baku`(`kdbahan`,`nama`,`tglmasuk`,`tglexpired`,`qty`) values ('KB0001','Wortel','2015-12-25','2016-01-25',500),('KB0002','Sawi Putih','2015-12-25','2016-01-10',100),('KB0003','Beras','2015-12-25','2016-12-25',100),('KB0004','Bawang Merah','2015-12-25','2016-01-25',100),('KB0005','Bawang Putih','2015-12-25','2016-01-25',100),('KB0006','Bawang Bombay','2015-12-25','2016-01-25',100),('KB0007','Spagheti','2015-12-25','2016-12-25',100),('KB0008','Pisang','2015-12-25','2016-01-08',25),('KB0009','Daging Ayam','2015-12-25','2016-01-15',10),('KB0010','Daging Sapi','2016-01-31','2016-01-15',10);

/*Table structure for table `customer_services` */

DROP TABLE IF EXISTS `customer_services`;

CREATE TABLE `customer_services` (
  `idcs` int(4) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idcs`)
) ENGINE=InnoDB AUTO_INCREMENT=5003 DEFAULT CHARSET=latin1;

/*Data for the table `customer_services` */

insert  into `customer_services`(`idcs`,`pass`,`nama`,`alamat`,`notelp`) values (5001,'pass5001','Cust','Jl. Dago No. 156 Bandung','087722767654'),(5002,'pass5002','Sadness','Jl. Aceh No. 56 Bandung','082345671234');

/*Table structure for table `kasir` */

DROP TABLE IF EXISTS `kasir`;

CREATE TABLE `kasir` (
  `idkasir` int(4) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idkasir`)
) ENGINE=InnoDB AUTO_INCREMENT=2003 DEFAULT CHARSET=latin1;

/*Data for the table `kasir` */

insert  into `kasir`(`idkasir`,`pass`,`nama`,`alamat`,`notelp`) values (2001,'pass2001','Chef','Jl. Juanda No. 105 Bandung','087734562345'),(2002,'pass2002','Khaki','Jl. Dago No. 10 Bandung','082312345460');

/*Table structure for table `koki` */

DROP TABLE IF EXISTS `koki`;

CREATE TABLE `koki` (
  `idkoki` int(4) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idkoki`)
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=latin1;

/*Data for the table `koki` */

insert  into `koki`(`idkoki`,`pass`,`nama`,`alamat`,`notelp`) values (3001,'pass3001','Khan','Jl. Gerlong No. 10 Bandung','087756432341'),(3002,'pass3002','Aaron','Jl. Dipatiukur No. 112 Bandung','081122334239'),(3003,'pass3003','Bea','Jl. Setiabudi No. 57 Bandung','082345678769'),(3004,'pass3004','Jack','Jl. Dago No. 105 Bandung','087834563456'),(3005,'pass3005','Al','Jl. Lewipanjang No. 11 Bandung','081122345624');

/*Table structure for table `kritiksaran` */

DROP TABLE IF EXISTS `kritiksaran`;

CREATE TABLE `kritiksaran` (
  `kdkritiksaran` varchar(6) NOT NULL,
  `idcs` int(4) NOT NULL,
  `idpelanggan` int(4) NOT NULL,
  `isi` varchar(150) NOT NULL,
  PRIMARY KEY (`kdkritiksaran`),
  KEY `Fk10` (`idcs`),
  KEY `Fk11` (`idpelanggan`),
  CONSTRAINT `Fk10` FOREIGN KEY (`idcs`) REFERENCES `customer_services` (`idcs`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk11` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kritiksaran` */

insert  into `kritiksaran`(`kdkritiksaran`,`idcs`,`idpelanggan`,`isi`) values ('KS0001',5001,6002,'tidak ada'),('KS0002',5002,6001,'lebih menarik lagi'),('KS0003',5002,6006,'lebih cepat'),('KS0004',5001,6005,'Lebih banyak menu baru');

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `kdlaporan` varchar(6) NOT NULL,
  `kdpemesanan` varchar(6) NOT NULL,
  `kdpembayaran` varchar(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kdlaporan`,`kdpembayaran`),
  KEY `Fk8` (`kdpemesanan`),
  KEY `Fk12` (`kdpembayaran`),
  CONSTRAINT `Fk12` FOREIGN KEY (`kdpembayaran`) REFERENCES `pembayaran` (`kdpembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk8` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `laporan` */

insert  into `laporan`(`kdlaporan`,`kdpemesanan`,`kdpembayaran`,`nama`) values ('LP0001','PS0004','PB0001','Laporan Pemesanan dan Pembayaran Tanggal 21'),('LP0001','PS0004','PB0002','Laporan Pemesanan dan Pembayaran Tanggal 21'),('LP0001','PS0004','PB0003','Laporan Pemesanan dan Pembayaran Tanggal 21'),('LP0001','PS0004','PB0004','Laporan Pemesanan dan Pembayaran Tanggal 21'),('LP0002','PS0005','PB0005','Laporan Pemesanan dan Pembayaran Tanggal 22'),('LP0002','PS0006','PB0006','Laporan Pemesanan dan Pembayaran Tanggal 22'),('LP0002','PS0007','PB0007','Laporan Pemesanan dan Pembayaran Tanggal 22'),('LP0002','PS0008','PB0008','Laporan Pemesanan dan Pembayaran Tanggal 22');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `kdmenu` varchar(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jenis` enum('Appertizer','Maincorse','Dessert','Drink') NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kdmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`kdmenu`,`nama`,`jenis`,`harga`) values ('AP0001','Fruit Salad','Appertizer',150000),('AP0002','Shrimp Cocktail Salad','Appertizer',47000),('AP0003','Orange Chicken Salad','Appertizer',38000),('AP0004','Rujak Cuka','Appertizer',27000),('DR0001','Frozen Capucino','Drink',13637),('DR0002','Milkshake Strowberry','Drink',12728),('DR0003','Ice Green Tea','Drink',10000),('DR0004','Orange Juice','Drink',14546),('DR0005','Teh Tarik','Drink',13637),('DR0006','Es Lemonade','Drink',10000),('DR0007','Es Lemon Tea','Drink',10000),('DR0008','Juice Alpukat/Strowberry','Drink',14546),('DR0009','Es Teh Tawar','Drink',4500),('DS0001','Banana Split','Dessert',32000),('DS0002','Ice Cream Sundae','Dessert',34000),('DS0003','Banana Cake','Dessert',23000),('DS0004','Deep Fried Ice Cream','Dessert',26000),('MC0001','Spagheti Olio Oglio','Maincorse',100000),('MC0002','Wiener Schnitzel','Maincorse',70000),('MC0004','Mie Tom Yam','Maincorse',50000),('MC0005','Steak Tenderloin','Maincorse',80000),('MC0006','Nasi Goreng Ikan Bakar','Maincorse',30000),('MC0007','Fettucini Carbonara','Maincorse',50000),('MC0008','Ayam Bakar Madu','Maincorse',36000),('MC0009','Nasi Goreng Ikan Asin','Maincorse',24000);

/*Table structure for table `menubahan` */

DROP TABLE IF EXISTS `menubahan`;

CREATE TABLE `menubahan` (
  `kdmenu` varchar(6) NOT NULL,
  `kdbahan` varchar(6) NOT NULL,
  KEY `Fk14` (`kdmenu`),
  KEY `Fk15` (`kdbahan`),
  CONSTRAINT `Fk14` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk15` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menubahan` */

insert  into `menubahan`(`kdmenu`,`kdbahan`) values ('MC0001','KB0006'),('MC0001','KB0006'),('MC0001','KB0007'),('MC0005','KB0004'),('MC0005','KB0005'),('MC0005','KB0006'),('MC0005','KB0010');

/*Table structure for table `menupesanan` */

DROP TABLE IF EXISTS `menupesanan`;

CREATE TABLE `menupesanan` (
  `kdpemesanan` varchar(6) NOT NULL,
  `kdmenu` varchar(6) NOT NULL,
  KEY `Fk18` (`kdpemesanan`),
  KEY `Fk19` (`kdmenu`),
  CONSTRAINT `Fk18` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk19` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menupesanan` */

insert  into `menupesanan`(`kdpemesanan`,`kdmenu`) values ('PS0001','AP0001'),('PS0001','DR0001'),('PS0001','DS0001'),('PS0001','MC0001'),('PS0002','AP0002'),('PS0002','DR0003'),('PS0002','DS0002'),('PS0002','MC0004');

/*Table structure for table `pantry` */

DROP TABLE IF EXISTS `pantry`;

CREATE TABLE `pantry` (
  `idpantry` int(4) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idpantry`)
) ENGINE=InnoDB AUTO_INCREMENT=4003 DEFAULT CHARSET=latin1;

/*Data for the table `pantry` */

insert  into `pantry`(`idpantry`,`pass`,`nama`,`alamat`,`notelp`) values (4001,'pass4001','Deasy','Jl. Soekarno Hatta No.105 Bandung','087722765432'),(4002,'pass4002','Hilman','Jl. Kosambi No. 188 Bandung','085723007654');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `idpelanggan` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `nomeja` int(11) NOT NULL,
  PRIMARY KEY (`idpelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=6011 DEFAULT CHARSET=latin1;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`idpelanggan`,`nama`,`nomeja`) values (6001,'Miftah',1),(6002,'Andrea',5),(6003,'Joy',3),(6004,'Anger',11),(6005,'Disgust',15),(6006,'Katie',20),(6007,'Many',10),(6008,'Hiccup',12),(6009,'Sally',17),(6010,'Brown',7);

/*Table structure for table `pelayan` */

DROP TABLE IF EXISTS `pelayan`;

CREATE TABLE `pelayan` (
  `idpelayan` int(4) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idpelayan`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;

/*Data for the table `pelayan` */

insert  into `pelayan`(`idpelayan`,`pass`,`nama`,`alamat`,`notelp`) values (1001,'pass1001','Alfatah','Jl.Sekeloa gg.12 no 2 Bandung','085123321123'),(1002,'pass1002','Legimin','Jl.Bangbayang 12 Bandung','081234561239'),(1003,'pass1003','Raharjo','Jl.Katapang 2 Bandung','087765456798'),(1004,'pass1004','Rahardian','Jl.Banda No.67 Bandung','085678906543'),(1005,'pass1005','Michael','Jl. Aceh N0.57 Bandung','081322334259');

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `kdpembayaran` varchar(6) NOT NULL,
  `kdpemesanan` varchar(6) NOT NULL,
  `idkasir` int(4) NOT NULL,
  `idpelanggan` int(4) NOT NULL,
  `totalharga` int(11) NOT NULL,
  PRIMARY KEY (`kdpembayaran`),
  KEY `Fk5` (`kdpemesanan`),
  KEY `Fk6` (`idkasir`),
  KEY `Fk7` (`idpelanggan`),
  CONSTRAINT `Fk5` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk6` FOREIGN KEY (`idkasir`) REFERENCES `kasir` (`idkasir`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk7` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`kdpembayaran`,`kdpemesanan`,`idkasir`,`idpelanggan`,`totalharga`) values ('PB0001','PS0001',2001,6001,295637),('PB0002','PS0002',2002,6002,141000),('PB0003','PS0003',2001,6003,134546),('PB0004','PS0004',2002,6004,93637),('PB0005','PS0005',2001,6005,134546),('PB0006','PS0006',2002,6006,124637),('PB0007','PS0007',2001,6007,98637),('PB0008','PS0008',2002,6008,166637);

/*Table structure for table `pemesanan` */

DROP TABLE IF EXISTS `pemesanan`;

CREATE TABLE `pemesanan` (
  `kdpemesanan` varchar(6) NOT NULL,
  `idpelanggan` int(4) NOT NULL,
  `idkoki` int(4) NOT NULL,
  `idpelayan` int(4) NOT NULL,
  `kdmenu` varchar(6) NOT NULL,
  PRIMARY KEY (`kdpemesanan`,`kdmenu`),
  KEY `Fk1` (`idpelanggan`),
  KEY `Fk2` (`idkoki`),
  KEY `Fk3` (`idpelayan`),
  KEY `Fk4` (`kdmenu`),
  CONSTRAINT `Fk1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk2` FOREIGN KEY (`idkoki`) REFERENCES `koki` (`idkoki`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk3` FOREIGN KEY (`idpelayan`) REFERENCES `pelayan` (`idpelayan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk4` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pemesanan` */

insert  into `pemesanan`(`kdpemesanan`,`idpelanggan`,`idkoki`,`idpelayan`,`kdmenu`) values ('PS0001',6001,3002,1003,'AP0001'),('PS0001',6001,3004,1003,'DR0001'),('PS0001',6001,3003,1003,'DS0001'),('PS0001',6001,3001,1003,'MC0001'),('PS0002',6002,3005,1001,'AP0002'),('PS0002',6002,3001,1001,'DR0003'),('PS0002',6002,3004,1001,'DS0002'),('PS0002',6002,3002,1001,'MC0004'),('PS0003',6003,3003,1004,'AP0003'),('PS0003',6003,3005,1004,'DR0001'),('PS0003',6003,3002,1004,'DS0004'),('PS0003',6003,3004,1004,'MC0007'),('PS0004',6004,3001,1002,'AP0004'),('PS0004',6004,3004,1002,'DR0001'),('PS0004',6004,3003,1002,'DS0003'),('PS0004',6004,3002,1002,'MC0006'),('PS0005',6005,3005,1005,'AP0002'),('PS0005',6005,3002,1005,'DR0004'),('PS0005',6005,3003,1005,'DS0003'),('PS0005',6005,3004,1005,'MC0007'),('PS0006',6006,3002,1003,'AP0003'),('PS0006',6006,3005,1003,'DR0001'),('PS0006',6006,3004,1003,'DS0003'),('PS0006',6006,3003,1003,'MC0007'),('PS0007',6007,3004,1002,'AP0004'),('PS0007',6007,3001,1002,'DR0005'),('PS0007',6007,3002,1002,'DS0002'),('PS0007',6007,3003,1002,'MC0009'),('PS0008',6008,3002,1005,'AP0002'),('PS0008',6008,3005,1005,'DR0001'),('PS0008',6008,3004,1005,'DS0004'),('PS0008',6008,3003,1005,'MC0005'),('PS0009',6009,3002,1001,'AP0004'),('PS0009',6009,3004,1001,'DR0006'),('PS0009',6009,3001,1001,'DS0003'),('PS0009',6009,3005,1001,'MC0001'),('PS0010',6010,3005,1004,'AP0002'),('PS0010',6010,3002,1004,'DR0002'),('PS0010',6010,3004,1004,'DS0001'),('PS0010',6010,3003,1004,'MC0008');

/*Table structure for table `penyetokkan` */

DROP TABLE IF EXISTS `penyetokkan`;

CREATE TABLE `penyetokkan` (
  `kdstok` varchar(6) NOT NULL,
  `idpantry` int(4) NOT NULL,
  `kdbahan` varchar(6) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglexpired` date NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`kdstok`),
  KEY `Fk9` (`idpantry`),
  KEY `Fk13` (`kdbahan`),
  CONSTRAINT `Fk13` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk9` FOREIGN KEY (`idpantry`) REFERENCES `pantry` (`idpantry`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penyetokkan` */

insert  into `penyetokkan`(`kdstok`,`idpantry`,`kdbahan`,`tglmasuk`,`tglexpired`,`qty`) values ('KS0001',4001,'KB0002','2015-12-25','2016-01-10',100),('KS0002',4002,'KB0008','2015-12-25','2016-01-28',25);

/*Table structure for table `stokbahan` */

DROP TABLE IF EXISTS `stokbahan`;

CREATE TABLE `stokbahan` (
  `kdbahan` varchar(6) NOT NULL,
  `kdstok` varchar(6) NOT NULL,
  KEY `Fk16` (`kdbahan`),
  KEY `Fk17` (`kdstok`),
  CONSTRAINT `Fk16` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk17` FOREIGN KEY (`kdstok`) REFERENCES `penyetokkan` (`kdstok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stokbahan` */

insert  into `stokbahan`(`kdbahan`,`kdstok`) values ('KB0002','KS0001'),('KB0008','KS0002');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
