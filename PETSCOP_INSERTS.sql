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

