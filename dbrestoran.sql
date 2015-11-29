/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.6.21 : Database - dbrestoran
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbrestoran` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbrestoran`;

/*Table structure for table `bahan_baku` */

DROP TABLE IF EXISTS `bahan_baku`;

CREATE TABLE `bahan_baku` (
  `kdbahan` int(11) NOT NULL AUTO_INCREMENT,
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
  `idcs` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idcs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_services` */

/*Table structure for table `kasir` */

DROP TABLE IF EXISTS `kasir`;

CREATE TABLE `kasir` (
  `idkasir` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idkasir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kasir` */

/*Table structure for table `koki` */

DROP TABLE IF EXISTS `koki`;

CREATE TABLE `koki` (
  `idkoki` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idkoki`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `koki` */

/*Table structure for table `kritiksaran` */

DROP TABLE IF EXISTS `kritiksaran`;

CREATE TABLE `kritiksaran` (
  `kdkritiksaran` int(11) NOT NULL AUTO_INCREMENT,
  `idcs` int(11) DEFAULT NULL,
  `idpelanggan` int(11) DEFAULT NULL,
  `isi` varchar(150) NOT NULL,
  PRIMARY KEY (`kdkritiksaran`),
  KEY `FK10` (`idcs`),
  KEY `FK9` (`idpelanggan`),
  CONSTRAINT `FK10` FOREIGN KEY (`idcs`) REFERENCES `customer_services` (`idcs`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK9` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kritiksaran` */

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `kdlaporan` int(11) NOT NULL AUTO_INCREMENT,
  `kdpemesanan` int(11) DEFAULT NULL,
  `kdpembayaran` int(11) DEFAULT NULL,
  `nama` varchar(25) NOT NULL,
  PRIMARY KEY (`kdlaporan`),
  KEY `FK8` (`kdpemesanan`),
  KEY `FK7` (`kdpembayaran`),
  CONSTRAINT `FK7` FOREIGN KEY (`kdpembayaran`) REFERENCES `pembayaran` (`kdpembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK8` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `laporan` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `kdmenu` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `jenis` enum('Appertizer','Maincorse','Dessert','Drink') NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kdmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

/*Table structure for table `menubahan` */

DROP TABLE IF EXISTS `menubahan`;

CREATE TABLE `menubahan` (
  `kdmenu` int(11) DEFAULT NULL,
  `kdbahan` int(11) DEFAULT NULL,
  KEY `FK12` (`kdmenu`),
  KEY `FK11` (`kdbahan`),
  CONSTRAINT `FK11` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK12` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menubahan` */

/*Table structure for table `menupesanan` */

DROP TABLE IF EXISTS `menupesanan`;

CREATE TABLE `menupesanan` (
  `kdpemesanan` int(11) DEFAULT NULL,
  `kdmenu` int(11) DEFAULT NULL,
  KEY `FK14` (`kdpemesanan`),
  KEY `FK13` (`kdmenu`),
  CONSTRAINT `FK13` FOREIGN KEY (`kdmenu`) REFERENCES `menu` (`kdmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK14` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menupesanan` */

/*Table structure for table `pantry` */

DROP TABLE IF EXISTS `pantry`;

CREATE TABLE `pantry` (
  `idpantry` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idpantry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pantry` */

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `nomeja` int(11) NOT NULL,
  PRIMARY KEY (`idpelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pelanggan` */

/*Table structure for table `pelayan` */

DROP TABLE IF EXISTS `pelayan`;

CREATE TABLE `pelayan` (
  `idpelayan` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `notelp` varchar(14) NOT NULL,
  PRIMARY KEY (`idpelayan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pelayan` */

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `kdpembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `kdpemesanan` int(11) DEFAULT NULL,
  `idkasir` int(11) DEFAULT NULL,
  `idpelanggan` int(11) DEFAULT NULL,
  `totalharga` int(11) DEFAULT NULL,
  PRIMARY KEY (`kdpembayaran`),
  KEY `FK6` (`kdpemesanan`),
  KEY `FK5` (`idkasir`),
  KEY `FK4` (`idpelanggan`),
  CONSTRAINT `FK4` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK5` FOREIGN KEY (`idkasir`) REFERENCES `kasir` (`idkasir`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK6` FOREIGN KEY (`kdpemesanan`) REFERENCES `pemesanan` (`kdpemesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

/*Table structure for table `pemesanan` */

DROP TABLE IF EXISTS `pemesanan`;

CREATE TABLE `pemesanan` (
  `kdpemesanan` int(11) NOT NULL AUTO_INCREMENT,
  `idpelanggan` int(11) DEFAULT NULL,
  `idkoki` int(11) DEFAULT NULL,
  `idpelayan` int(11) DEFAULT NULL,
  `menupesanan` varchar(20) NOT NULL,
  PRIMARY KEY (`kdpemesanan`),
  KEY `FK3` (`idpelanggan`),
  KEY `FK2` (`idkoki`),
  KEY `FK1` (`idpelayan`),
  CONSTRAINT `FK1` FOREIGN KEY (`idpelayan`) REFERENCES `pelayan` (`idpelayan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2` FOREIGN KEY (`idkoki`) REFERENCES `koki` (`idkoki`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pemesanan` */

/*Table structure for table `penyetokan` */

DROP TABLE IF EXISTS `penyetokan`;

CREATE TABLE `penyetokan` (
  `kdstok` int(11) NOT NULL AUTO_INCREMENT,
  `idpantry` int(11) DEFAULT NULL,
  `nama` varchar(25) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglexpired` date NOT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`kdstok`),
  KEY `FK15` (`idpantry`),
  CONSTRAINT `FK15` FOREIGN KEY (`idpantry`) REFERENCES `pantry` (`idpantry`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penyetokan` */

/*Table structure for table `stokbahan` */

DROP TABLE IF EXISTS `stokbahan`;

CREATE TABLE `stokbahan` (
  `kdbahan` int(11) DEFAULT NULL,
  `kdstok` int(11) DEFAULT NULL,
  KEY `FK17` (`kdbahan`),
  KEY `FK16` (`kdstok`),
  CONSTRAINT `FK16` FOREIGN KEY (`kdstok`) REFERENCES `penyetokan` (`kdstok`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK17` FOREIGN KEY (`kdbahan`) REFERENCES `bahan_baku` (`kdbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stokbahan` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
