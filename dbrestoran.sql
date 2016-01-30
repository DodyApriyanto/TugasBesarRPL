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

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `kdlaporan` varchar(6) NOT NULL,
  `kdpemesanan` varchar(6) NOT NULL,
  `kdpembayaran` varchar(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  PRIMARY KEY (`kdlaporan`),
  KEY `Fk7` (`kdpemesanan`),
  KEY `Fk8` (`kdpembayaran`),
  CONSTRAINT `Fk7` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk8` FOREIGN KEY (`kdpembayaran`) REFERENCES `pembayaran` (`kdpembayaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `laporan` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `kdmenu` varchar(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jenis` enum('Appertizer','Maincorse','Dessert','Minuman') NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kdmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

/*Table structure for table `menubahan` */

DROP TABLE IF EXISTS `menubahan`;

CREATE TABLE `menubahan` (
  `kdmenu` varchar(6) NOT NULL,
  `kdbahan` varchar(6) NOT NULL,
  KEY `Fk12` (`kdmenu`),
  KEY `Fk13` (`kdbahan`),
  CONSTRAINT `Fk12` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk13` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menubahan` */

/*Table structure for table `menupesanan` */

DROP TABLE IF EXISTS `menupesanan`;

CREATE TABLE `menupesanan` (
  `kdpemesanan` varchar(6) NOT NULL,
  `kdmenu` varchar(6) NOT NULL,
  KEY `Fk14` (`kdpemesanan`),
  KEY `Fk15` (`kdmenu`),
  CONSTRAINT `Fk14` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk15` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menupesanan` */

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
  KEY `Fk4` (`kdpemesanan`),
  KEY `Fk5` (`idkasir`),
  KEY `Fk6` (`idpelanggan`),
  CONSTRAINT `Fk4` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk5` FOREIGN KEY (`idkasir`) REFERENCES `kasir` (`idkasir`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk6` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

/*Table structure for table `pemesanan` */

DROP TABLE IF EXISTS `pemesanan`;

CREATE TABLE `pemesanan` (
  `kdpemesanan` varchar(6) NOT NULL,
  `idpelanggan` int(4) NOT NULL,
  `idkoki` int(4) NOT NULL,
  `idpelayan` int(4) NOT NULL,
  `menupesanan` varchar(20) NOT NULL,
  PRIMARY KEY (`kdpemesanan`),
  KEY `Fk1` (`idpelanggan`),
  KEY `Fk2` (`idkoki`),
  KEY `Fk3` (`idpelayan`),
  CONSTRAINT `Fk1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk2` FOREIGN KEY (`idkoki`) REFERENCES `koki` (`idkoki`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk3` FOREIGN KEY (`idpelayan`) REFERENCES `pelayan` (`idpelayan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pemesanan` */

/*Table structure for table `penyetokkan` */

DROP TABLE IF EXISTS `penyetokkan`;

CREATE TABLE `penyetokkan` (
  `kdstok` varchar(6) NOT NULL,
  `idpantry` int(4) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglexpired` date NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`kdstok`),
  KEY `Fk9` (`idpantry`),
  CONSTRAINT `Fk9` FOREIGN KEY (`idpantry`) REFERENCES `pantry` (`idpantry`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penyetokkan` */

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
