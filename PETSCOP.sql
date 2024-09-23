-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PETSCOP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PETSCOP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PETSCOP` DEFAULT CHARACTER SET utf8 ;
USE `PETSCOP` ;

-- -----------------------------------------------------
-- Table `PETSCOP`.`TypeUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`TypeUser` (
  `id_type_user` INT NOT NULL,
  `name_type_user` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Users` (
  `id_usuario` INT NOT NULL,
  `username_user` VARCHAR(45) NULL,
  `password_user` VARCHAR(45) NULL,
  `name_user` VARCHAR(45) NULL,
  `lastname_user` VARCHAR(45) NULL,
  `age_user` INT NULL,
  `id_type_user_user` INT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `type_user_id_idx` (`id_type_user_user` ASC) VISIBLE,
  CONSTRAINT `type_user_id`
    FOREIGN KEY (`id_type_user_user`)
    REFERENCES `PETSCOP`.`TypeUser` (`id_type_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Race`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Race` (
  `id_race` INT NOT NULL,
  `name_race` VARCHAR(45) NULL,
  PRIMARY KEY (`id_race`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Species` (
  `id_specie` INT NOT NULL,
  `name_specie` VARCHAR(45) NULL,
  PRIMARY KEY (`id_specie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`BiologySex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`BiologySex` (
  `id_biology_sex` INT NOT NULL,
  `name_biology_sex` VARCHAR(45) NULL,
  PRIMARY KEY (`id_biology_sex`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Pets` (
  `id_pet` INT NOT NULL,
  `name_pet` VARCHAR(45) NULL,
  `age_pet` INT NULL,
  `id_race_pet` INT NULL,
  `id_user_pet` INT NULL,
  `id_specie_pet` INT NULL,
  `id_biology_sex_pet` INT NULL,
  PRIMARY KEY (`id_pet`),
  INDEX `race_id_idx` (`id_race_pet` ASC) VISIBLE,
  INDEX `user_id_idx` (`id_user_pet` ASC) VISIBLE,
  INDEX `specie_id_idx` (`id_specie_pet` ASC) VISIBLE,
  INDEX `biology_sex_id_idx` (`id_biology_sex_pet` ASC) VISIBLE,
  CONSTRAINT `race_id`
    FOREIGN KEY (`id_race_pet`)
    REFERENCES `PETSCOP`.`Race` (`id_race`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`id_user_pet`)
    REFERENCES `PETSCOP`.`Users` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `specie_id`
    FOREIGN KEY (`id_specie_pet`)
    REFERENCES `PETSCOP`.`Species` (`id_specie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `biology_sex_id`
    FOREIGN KEY (`id_biology_sex_pet`)
    REFERENCES `PETSCOP`.`BiologySex` (`id_biology_sex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Post` (
  `id_post` INT NOT NULL,
  `title_post` VARCHAR(100) NULL,
  `body_post` VARCHAR(255) NULL,
  `id_pet_post` INT NULL,
  PRIMARY KEY (`id_post`),
  INDEX `pet_pots_id_idx` (`id_pet_post` ASC) VISIBLE,
  CONSTRAINT `pet_pots_id`
    FOREIGN KEY (`id_pet_post`)
    REFERENCES `PETSCOP`.`Pets` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Comment` (
  `id_comment` INT NOT NULL,
  `body_comment` VARCHAR(255) NULL,
  `id_post_comment` INT NULL,
  `id_pet_comment` INT NULL,
  PRIMARY KEY (`id_comment`),
  INDEX `comment_post_id_idx` (`id_post_comment` ASC) VISIBLE,
  INDEX `comment_pet_id_idx` (`id_pet_comment` ASC) VISIBLE,
  CONSTRAINT `comment_post_id`
    FOREIGN KEY (`id_post_comment`)
    REFERENCES `PETSCOP`.`Post` (`id_post`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_pet_id`
    FOREIGN KEY (`id_pet_comment`)
    REFERENCES `PETSCOP`.`Pets` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Services` (
  `id_service` INT NOT NULL,
  `name_service` VARCHAR(45) NULL,
  PRIMARY KEY (`id_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Offers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Offers` (
  `id_offers` INT NOT NULL,
  `price_offers` DECIMAL NULL,
  `id_user_offers` INT NULL,
  `id_service_offers` INT NULL,
  PRIMARY KEY (`id_offers`),
  INDEX `offers_user_id_idx` (`id_user_offers` ASC) VISIBLE,
  INDEX `offers_service_id_idx` (`id_service_offers` ASC) VISIBLE,
  CONSTRAINT `offers_user_id`
    FOREIGN KEY (`id_user_offers`)
    REFERENCES `PETSCOP`.`Users` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `offers_service_id`
    FOREIGN KEY (`id_service_offers`)
    REFERENCES `PETSCOP`.`Services` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Dating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Dating` (
  `id_dating` INT NOT NULL,
  `id_pet_dating` INT NULL,
  `id_offer_dating` INT NULL,
  `date_dating` DATE NULL,
  `time_dating` TIME NULL,
  PRIMARY KEY (`id_dating`),
  INDEX `dating_pet_id_idx` (`id_pet_dating` ASC) VISIBLE,
  INDEX `dating_offer_id_idx` (`id_offer_dating` ASC) VISIBLE,
  CONSTRAINT `dating_pet_id`
    FOREIGN KEY (`id_pet_dating`)
    REFERENCES `PETSCOP`.`Pets` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dating_offer_id`
    FOREIGN KEY (`id_offer_dating`)
    REFERENCES `PETSCOP`.`Offers` (`id_offers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETSCOP`.`Friendship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETSCOP`.`Friendship` (
  `id_friendhip` INT NOT NULL,
  `id_pet1_friendship` INT NULL,
  `id_pet2_friendship` INT NULL,
  PRIMARY KEY (`id_friendhip`),
  INDEX `friendship_pet1_id_idx` (`id_pet1_friendship` ASC) VISIBLE,
  INDEX `friendship_pet2_id_idx` (`id_pet2_friendship` ASC) VISIBLE,
  CONSTRAINT `friendship_pet1_id`
    FOREIGN KEY (`id_pet1_friendship`)
    REFERENCES `PETSCOP`.`Pets` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `friendship_pet2_id`
    FOREIGN KEY (`id_pet2_friendship`)
    REFERENCES `PETSCOP`.`Pets` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `PETSCOP`.`TypeUser`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`TypeUser` (`id_type_user`, `name_type_user`) VALUES (1, 'Común');
INSERT INTO `PETSCOP`.`TypeUser` (`id_type_user`, `name_type_user`) VALUES (2, 'Veterinario');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Users` (`id_usuario`, `username_user`, `password_user`, `name_user`, `lastname_user`, `age_user`, `id_type_user_user`) VALUES (1, 'Mataviejitas3000', '1234', 'Juan Francisco', 'Jimenes Pérez', 19, 2);
INSERT INTO `PETSCOP`.`Users` (`id_usuario`, `username_user`, `password_user`, `name_user`, `lastname_user`, `age_user`, `id_type_user_user`) VALUES (2, 'NoobMaster69', '987654321', 'Mark', 'Brown', 27, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Race`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Race` (`id_race`, `name_race`) VALUES (1, 'Chihuahua');
INSERT INTO `PETSCOP`.`Race` (`id_race`, `name_race`) VALUES (2, 'Pitbull');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Species`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Species` (`id_specie`, `name_specie`) VALUES (1, 'Perro');
INSERT INTO `PETSCOP`.`Species` (`id_specie`, `name_specie`) VALUES (2, 'Gato');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`BiologySex`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`BiologySex` (`id_biology_sex`, `name_biology_sex`) VALUES (1, 'Macho');
INSERT INTO `PETSCOP`.`BiologySex` (`id_biology_sex`, `name_biology_sex`) VALUES (2, 'Hembra');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Pets`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Pets` (`id_pet`, `name_pet`, `age_pet`, `id_race_pet`, `id_user_pet`, `id_specie_pet`, `id_biology_sex_pet`) VALUES (1, 'Princesa', 7, 2, 1, 1, 2);
INSERT INTO `PETSCOP`.`Pets` (`id_pet`, `name_pet`, `age_pet`, `id_race_pet`, `id_user_pet`, `id_specie_pet`, `id_biology_sex_pet`) VALUES (2, 'Bonipancio', 5, 1, 2, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Post`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Post` (`id_post`, `title_post`, `body_post`, `id_pet_post`) VALUES (1, 'post de prueba', 'Post de prueba, probando probando', 2);
INSERT INTO `PETSCOP`.`Post` (`id_post`, `title_post`, `body_post`, `id_pet_post`) VALUES (2, 'Ayuda Fernan', 'Ayuda Fernan, mi mascota se está desangrandp', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Comment` (`id_comment`, `body_comment`, `id_post_comment`, `id_pet_comment`) VALUES (1, 'No puedo ayudarte, bye', 2, 1);
INSERT INTO `PETSCOP`.`Comment` (`id_comment`, `body_comment`, `id_post_comment`, `id_pet_comment`) VALUES (2, 'Porfa me mueroooooo', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Services`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Services` (`id_service`, `name_service`) VALUES (1, 'Desparasitación');
INSERT INTO `PETSCOP`.`Services` (`id_service`, `name_service`) VALUES (2, 'Esterilización');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Offers`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Offers` (`id_offers`, `price_offers`, `id_user_offers`, `id_service_offers`) VALUES (1, 200.00, 1, 1);
INSERT INTO `PETSCOP`.`Offers` (`id_offers`, `price_offers`, `id_user_offers`, `id_service_offers`) VALUES (2, 2000.00, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Dating`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Dating` (`id_dating`, `id_pet_dating`, `id_offer_dating`, `date_dating`, `time_dating`) VALUES (1, 2, 1, '2024-06-12', '12:00:00');
INSERT INTO `PETSCOP`.`Dating` (`id_dating`, `id_pet_dating`, `id_offer_dating`, `date_dating`, `time_dating`) VALUES (2, 2, 1, '2006-06-06', '9:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PETSCOP`.`Friendship`
-- -----------------------------------------------------
START TRANSACTION;
USE `PETSCOP`;
INSERT INTO `PETSCOP`.`Friendship` (`id_friendhip`, `id_pet1_friendship`, `id_pet2_friendship`) VALUES (1, 1, 2);
INSERT INTO `PETSCOP`.`Friendship` (`id_friendhip`, `id_pet1_friendship`, `id_pet2_friendship`) VALUES (2, 2, 1);

COMMIT;

