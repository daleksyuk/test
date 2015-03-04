
CREATE SCHEMA IF NOT EXISTS `my_site` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `my_site`.`news` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(124) NOT NULL,
  `content` VARCHAR(512) NOT NULL,
  `autor` VARCHAR(24) NOT NULL DEFAULT 'World_News',
  `id_rubric` INT(11) NOT NULL,
  `id_subrubric` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_rubric`, `id_subrubric`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE news ADD
FOREGEN KEY (id_rubric)
REFERENCE rubric(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE news ADD
FOREIGN KEY (id_subrubric)
REFERENCES subrubric(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`news` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('В Раде пообещали голосовать честно ', 'В коалиционном соглашении, кроме деклараций - мы вернем Крым и Донбасс - ничего. И комитета нет. Продолжение - на следующей неделе. Обещают плодотворное и конструктивное. Без кнопкодавства и нарушения регламента. С нужными законами и реформами. И желательно - без популизма.', 1, 5);
INSERT INTO `my_site`.`news` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('В Киеве пройдет фестиваль огня', '14 июня на Певческом поле в Киеве пройдет Киевский Фестиваль Огня. Лучшие коллективы и сольные исполнители покажут киевлянам и гостям столицы эффектное огненное шоу.', 2, 6);
INSERT INTO `my_site`.`news` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Под Киевом успешно прошли испытания уникального дирижабля', 'Под Киевом в течение этой недели проходили испытания дирижабля-розьера РФР-1, а также совершены ознакомительные полеты полёты теплового дирижабля Au-37 и осмотр и обсуждение гондолы первого украинского теплового дирижабля.', 3, 7);
INSERT INTO `my_site`.`news` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Тайсон может победить Владимира Кличко', 'Дядя и тренер британского супертяжеловеса Тайсона Фьюри Питер Фьюри поделился впечатлениями от победы своего племянника в матче-реванше с другим британцем Дереком Чисорой.', 4, 8);
INSERT INTO `my_site`.`news` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Microsoft в январе покажет новые возможности Windows 10', 'Операционная система Windows 10 была представлена еще около двух месяцев назад, однако компания Microsoft с того момента ни на минуту не остановила работу по ее улучшению. Как сообщает ресурс TheVerge, софтверный гигант планирует еще одно мероприятие, посвященное новой операционной системе, которое на этот раз должно состояться в январе 2015 года.', 5, 9);


CREATE TABLE IF NOT EXISTS `my_site`.`news_review` (
  `id_news` INT(11) NOT NULL,
  `id_review` INT(11) NOT NULL,
  PRIMARY KEY (`id_news`, `id_review`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE news_review ADD
FOREIGN KEY (id_news)
REFERENCES news(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE news_review ADD
FOREIGN KEY (id_review)
REFERENCES review(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`news_review` (`id_news`, `id_review`) VALUES (1, 6);
INSERT INTO `my_site`.`news_review` (`id_news`, `id_review`) VALUES (2, 7);
INSERT INTO `my_site`.`news_review` (`id_news`, `id_review`) VALUES (3, 8);
INSERT INTO `my_site`.`news_review` (`id_news`, `id_review`) VALUES (4, 9);
INSERT INTO `my_site`.`news_review` (`id_news`, `id_review`) VALUES (5, 10);

CREATE TABLE IF NOT EXISTS `my_site`.`review` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(124) NOT NULL,
  `content` VARCHAR(512) NOT NULL,
  `autor` VARCHAR(24) NOT NULL DEFAULT 'World_Report',
  `id_rubric` INT(11) NOT NULL,
  `id_subrubric` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_rubric`, `id_subrubric`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE review ADD
FOREIGN KEY (id_rubric)
REFERENCES rubric(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE review ADD
FOREIGN KEY (id_subrubric)
REFERENCES subrubric(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`review` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Игорь Жданов избран министром молодежи и спорта Украины', 'Во вторник, 2 декабря, Верховная Рада избрала новый Кабинет министров. Министром молодежи и спорта был избран Игорь Жданов из партии \"Батькивщина\".', 1, 5);
INSERT INTO `my_site`.`review` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Альбом группы U2 возглавил топ-50 лучших пластинок', 'Издание \"Rolling Stone\" опубликовало список лучших пластинок 2014 года.', 2, 6);
INSERT INTO `my_site`.`review` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Специальное зеркальное покрытие позволит охладить здания', 'Группа ученых и инженеров их Стэндфордского университета нашла путь сокращения затрат на кондиционирование помещений. Они разработали специализированное зеркальное покрытие, многослойны нанофотонный материал, которые не только отражает потоки тепла от стен и крыш зданий, он также направляет поток тепла извне здания наружу, охлаждая таким образом внутренности здания.', 3, 7);
INSERT INTO `my_site`.`review` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('В Испании хотят покончить с футбольными ультрас', 'Глава футбольной лиги Испании Хавьер Тебас заявил, что смерть болельщика Депортиво станет концом испанских ультрас.', 4, 8);
INSERT INTO `my_site`.`review` (`title`, `content`, `id_rubric`, `id_subrubric`) VALUES ('Windows XP потеряла еще одно место в рейтинге популярности ОС', 'Несмотря на то, что некоторые пользователи до сих пор предпочитают операционную систему Windows XP, она постепенно теряет свои позиции, уступая место более новым ОС от Microsoft.', 5, 9);


CREATE TABLE IF NOT EXISTS `my_site`.`rubric` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`, `title`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

INSERT INTO `my_site`.`rubric` (`title`) VALUES ('Политика');
INSERT INTO `my_site`.`rubric` (`title`) VALUES ('Культура');
INSERT INTO `my_site`.`rubric` (`title`) VALUES ('Наука');
INSERT INTO `my_site`.`rubric` (`title`) VALUES ('Спорт');
INSERT INTO `my_site`.`rubric` (`title`) VALUES ('Технологии');


CREATE TABLE IF NOT EXISTS `my_site`.`subrubric` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(26) NOT NULL,
  `id_rubric` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_rubric`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE subrubric ADD
FOREIGN KEY (id_rubric)
REFERENCES rubric(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`subrubric` (`title`, `id_rubric`) VALUES ('Мировая политика', 1);
INSERT INTO `my_site`.`subrubric` (`title`, `id_rubric`) VALUES ('Мировая культура', 2);
INSERT INTO `my_site`.`subrubric` (`title`, `id_rubric`) VALUES ('Мировая наука', 3);
INSERT INTO `my_site`.`subrubric` (`title`, `id_rubric`) VALUES ('Мировой спорт', 4);
INSERT INTO `my_site`.`subrubric` (`title`, `id_rubric`) VALUES ('Мировые технологии', 5);


CREATE TABLE IF NOT EXISTS `my_site`.`news_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tag` INT(11) NOT NULL,
  `id_news` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_tag`, `id_news`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE news_tag ADD
FOREIGN KEY (id_news)
REFERENCES news(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE news_tag ADD
FOREIGN KEY (id_tag)
REFERENCES tag(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`news_tag` (`id_tag`, `id_news`) VALUES (4, 1);
INSERT INTO `my_site`.`news_tag` (`id_tag`, `id_news`) VALUES (5, 2);
INSERT INTO `my_site`.`news_tag` (`id_tag`, `id_news`) VALUES (6, 3);
INSERT INTO `my_site`.`news_tag` (`id_tag`, `id_news`) VALUES (7, 4);
INSERT INTO `my_site`.`news_tag` (`id_tag`, `id_news`) VALUES (8, 5);

CREATE TABLE IF NOT EXISTS `my_site`.`tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

INSERT INTO `my_site`.`tag` (`name`) VALUES ('Политика Украины');
INSERT INTO `my_site`.`tag` (`name`) VALUES ('Культура Киева');
INSERT INTO `my_site`.`tag` (`name`) VALUES ('Наука Киева');
INSERT INTO `my_site`.`tag` (`name`) VALUES ('Спорт Бокс');
INSERT INTO `my_site`.`tag` (`name`) VALUES ('Технологии Microsoft');

CREATE TABLE IF NOT EXISTS `my_site`.`review_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tag` INT(11) NOT NULL,
  `id_review` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_tag`, `id_review`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

ALTER TABLE review_tag ADD
FOREIGN KEY (id_review)
REFERENCES review(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE review_tag ADD
FOREIGN KEY (id_tag)
REFERENCES tag(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO `my_site`.`review_tag` (`id_tag`, `id_review`) VALUES (4, 6);
INSERT INTO `my_site`.`review_tag` (`id_tag`, `id_review`) VALUES (5, 7);
INSERT INTO `my_site`.`review_tag` (`id_tag`, `id_review`) VALUES (6, 8);
INSERT INTO `my_site`.`review_tag` (`id_tag`, `id_review`) VALUES (7, 9);
INSERT INTO `my_site`.`review_tag` (`id_tag`, `id_review`) VALUES (8, 10);