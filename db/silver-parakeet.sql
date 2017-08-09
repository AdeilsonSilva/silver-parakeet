-- MySQL Script generated by MySQL Workbench
-- ter 08 ago 2017 21:14:40 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema silver-parakeet
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `silver-parakeet` ;

-- -----------------------------------------------------
-- Schema silver-parakeet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `silver-parakeet` DEFAULT CHARACTER SET utf8 ;
USE `silver-parakeet` ;

-- -----------------------------------------------------
-- Table `silver-parakeet`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`users` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`armaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`armaments` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`armaments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serial_number` INT NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`material_reserve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`material_reserve` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`material_reserve` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`reserves`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`reserves` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`reserves` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `initials` VARCHAR(15) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `material_reserve_id` INT NOT NULL,
  PRIMARY KEY (`id`, `material_reserve_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_reserves_material_reserve1_idx` (`material_reserve_id` ASC),
  CONSTRAINT `fk_reserves_material_reserve1`
    FOREIGN KEY (`material_reserve_id`)
    REFERENCES `silver-parakeet`.`material_reserve` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`ammunition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`ammunition` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`ammunition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `caliber` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`accessories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`accessories` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`accessories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`soldier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`soldier` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`soldier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `graduation` VARCHAR(45) NOT NULL,
  `war_name` VARCHAR(45) NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_soldier_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_soldier_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `silver-parakeet`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`material_reserve_has_ammunition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`material_reserve_has_ammunition` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`material_reserve_has_ammunition` (
  `material_reserve_id` INT NOT NULL,
  `ammunition_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`material_reserve_id`, `ammunition_id`),
  INDEX `fk_material_reserve_has_ammunition_ammunition1_idx` (`ammunition_id` ASC),
  INDEX `fk_material_reserve_has_ammunition_material_reserve1_idx` (`material_reserve_id` ASC),
  CONSTRAINT `fk_material_reserve_has_ammunition_material_reserve1`
    FOREIGN KEY (`material_reserve_id`)
    REFERENCES `silver-parakeet`.`material_reserve` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_reserve_has_ammunition_ammunition1`
    FOREIGN KEY (`ammunition_id`)
    REFERENCES `silver-parakeet`.`ammunition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`material_reserve_has_accessories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`material_reserve_has_accessories` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`material_reserve_has_accessories` (
  `material_reserve_id` INT NOT NULL,
  `accessories_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`material_reserve_id`, `accessories_id`),
  INDEX `fk_material_reserve_has_accessories_accessories1_idx` (`accessories_id` ASC),
  INDEX `fk_material_reserve_has_accessories_material_reserve1_idx` (`material_reserve_id` ASC),
  CONSTRAINT `fk_material_reserve_has_accessories_material_reserve1`
    FOREIGN KEY (`material_reserve_id`)
    REFERENCES `silver-parakeet`.`material_reserve` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_reserve_has_accessories_accessories1`
    FOREIGN KEY (`accessories_id`)
    REFERENCES `silver-parakeet`.`accessories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`material_reserve_has_armaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`material_reserve_has_armaments` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`material_reserve_has_armaments` (
  `armaments_id` INT NOT NULL,
  `material_reserve_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`armaments_id`, `material_reserve_id`),
  INDEX `fk_armaments_has_material_reserve_material_reserve1_idx` (`material_reserve_id` ASC),
  INDEX `fk_armaments_has_material_reserve_armaments1_idx` (`armaments_id` ASC),
  CONSTRAINT `fk_armaments_has_material_reserve_armaments1`
    FOREIGN KEY (`armaments_id`)
    REFERENCES `silver-parakeet`.`armaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_armaments_has_material_reserve_material_reserve1`
    FOREIGN KEY (`material_reserve_id`)
    REFERENCES `silver-parakeet`.`material_reserve` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `silver-parakeet`.`loans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `silver-parakeet`.`loans` ;

CREATE TABLE IF NOT EXISTS `silver-parakeet`.`loans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `soldier_id` INT NOT NULL,
  `material_reserve_id` INT NOT NULL,
  `ammunition_id` INT NULL,
  `armaments_id` INT NULL,
  `accessories_id` INT NULL,
  `ammunition_amount` INT NULL,
  `armaments_amount` INT NULL,
  `accessories_amount` INT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `soldier_id`, `material_reserve_id`),
  INDEX `fk_loans_soldier1_idx` (`soldier_id` ASC),
  INDEX `fk_loans_material_reserve_has_ammunition1_idx` (`material_reserve_id` ASC, `ammunition_id` ASC),
  INDEX `fk_loans_armaments_has_material_reserve1_idx` (`armaments_id` ASC),
  INDEX `fk_loans_material_reserve_has_accessories1_idx` (`accessories_id` ASC),
  CONSTRAINT `fk_loans_soldier1`
    FOREIGN KEY (`soldier_id`)
    REFERENCES `silver-parakeet`.`soldier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loans_material_reserve_has_ammunition1`
    FOREIGN KEY (`material_reserve_id` , `ammunition_id`)
    REFERENCES `silver-parakeet`.`material_reserve_has_ammunition` (`material_reserve_id` , `ammunition_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loans_armaments_has_material_reserve1`
    FOREIGN KEY (`armaments_id`)
    REFERENCES `silver-parakeet`.`material_reserve_has_armaments` (`armaments_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loans_material_reserve_has_accessories1`
    FOREIGN KEY (`accessories_id`)
    REFERENCES `silver-parakeet`.`material_reserve_has_accessories` (`accessories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `silver-parakeet`;

DELIMITER $$

USE `silver-parakeet`$$
DROP TRIGGER IF EXISTS `silver-parakeet`.`loans_AFTER_INSERT` $$
USE `silver-parakeet`$$
CREATE DEFINER = CURRENT_USER TRIGGER `silver-parakeet`.`loans_AFTER_INSERT` AFTER INSERT ON `loans` FOR EACH ROW
BEGIN

-- Updates amount of items available in relation table 

IF NEW.armaments_id IS NOT NULL
AND NEW.armaments_amount IS NOT NULL

THEN

UPDATE material_reserve_has_armaments 
SET material_reserve_has_armaments.amount = material_reserve_has_armaments.amount - NEW.armaments_amount
WHERE material_reserve_has_armaments.material_reserve_id = NEW.material_reserve_id
AND  material_reserve_has_armaments.armament_id = NEW.armaments_id;

END IF;

-- Updates amount of items available in relation table 

IF NEW.accessories_id IS NOT NULL
AND NEW.accessories_amount IS NOT NULL

THEN

UPDATE material_reserve_has_accessories 
SET material_reserve_has_accessories.amount = material_reserve_has_accessories.amount - NEW.accessories_amount
WHERE material_reserve_has_accessories.material_reserve_id = NEW.material_reserve_id
AND  material_reserve_has_accessories.accessories_id = NEW.accessories_id;

END IF;

-- Updates amount of items available in relation table 

IF NEW.ammunition_id IS NOT NULL
AND NEW.ammunition_amount IS NOT NULL

THEN

UPDATE material_reserve_has_ammunition 
SET material_reserve_has_ammunition.amount = material_reserve_has_ammunition.amount - NEW.ammunition_amount
WHERE material_reserve_has_ammunition.material_reserve_id = NEW.material_reserve_id
AND  material_reserve_has_ammunition.ammunition_id = NEW.ammunition_id;

END IF;

END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;