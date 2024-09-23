-- Consultar datos del usuario --
SELECT users.username_user, users.name_user, users.lastname_user, users.age_user, typeuser.name_type_user
FROM users
INNER JOIN typeuser ON id_type_user_user = id_type_user;

-- Consultar servicios para mascota --
SELECT services.name_service, offers.price_offers, users.name_user, users.lastname_user, typeuser.name_type_user
FROM services
INNER JOIN  offers ON offers.id_service_offers = services.id_service
INNER JOIN users ON offers.id_user_offers = users.id_usuario
INNER JOIN typeuser ON typeuser.id_type_user = users.id_type_user_user;

-- Consultar datos de las mascotas
SELECT pets.name_pet, pets.age_pet, race.name_race, species.name_specie, biologysex.name_biology_sex, users.username_user
FROM pets
INNER JOIN race ON race.id_race = pets.id_race_pet
INNER JOIN species ON species.id_specie = pets.id_specie_pet
INNER JOIN biologysex ON biologysex.id_biology_sex = pets.id_biology_sex_pet
INNER join users on users.id_usuario = pets.id_user_pet;

-- Consultar citas con servicios --
SELECT services.name_service, offers.price_offers, pets.name_pet, users.name_user
FROM pets
INNER JOIN dating ON dating.id_pet_dating = pets.id_pet
INNER JOIN offers ON offers.id_offers = dating.id_offer_dating
INNER JOIN services ON services.id_service = offers.id_service_offers
INNER JOIN users ON users.id_usuario = offers.id_user_offers;

-- Para ver posts --
