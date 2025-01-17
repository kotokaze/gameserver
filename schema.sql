-- DROP TABLE IF EXISTS `room_user`;
-- DROP TABLE IF EXISTS `room`;
-- DROP TABLE IF EXISTS `user`;

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `leader_card_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
);

CREATE TABLE IF NOT EXISTS `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `live_id` int NOT NULL,
  `host_id` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `live_member` tinyint NOT NULL DEFAULT 0,
  `max_user` tinyint NOT NULL,
  `first_user_end_time` datetime,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`host_id`) REFERENCES `user` (`id`)
);

CREATE TABLE IF NOT EXISTS `room_user` (
  `room_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `difficulty` tinyint NOT NULL,
  `score` int,
  `judge` varchar(255),
  PRIMARY KEY (`room_id`, `user_id`),
  FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);
