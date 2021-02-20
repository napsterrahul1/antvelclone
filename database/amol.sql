ALTER TABLE `users` CHANGE `type` `type` ENUM('normal','trusted','rejected') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal';

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'pune', '2016-12-04 04:38:30', '0000-00-00 00:00:00'),
(2, 'mumbai', '2016-12-04 04:43:52', '0000-00-00 00:00:00');

ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `configuration` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'visitor', '1', '2016-12-04 11:09:01', '2016-12-04 05:54:54');
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `users` ADD `nickname` VARCHAR(255) NOT NULL AFTER `email`;

-----------------11 dec -------
ALTER TABLE `products` CHANGE `features` `features` VARCHAR(65000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;



---------------------13-dec-2016-----------------

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mihpayid` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `productinfo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `PG_TYPE` varchar(255) NOT NULL,
  `name_on_card` varchar(255) NOT NULL,
  `cardnum` varchar(255) NOT NULL,
  `payuMoneyId` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `net_amount_debit` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `users` CHANGE `role` `role` ENUM('admin','business','nonprofit','person','subadmin') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'person';
ALTER TABLE  `products` CHANGE  `product_status`  `product_status` ENUM(  'active',  'approved',  'rejected' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;
ALTER TABLE `orders` ADD `pay_mode` ENUM('cod','online') NOT NULL AFTER `type`

ALTER TABLE `orders` ADD `order_track_status` ENUM('initialted','packed','dispatched','delivered') NULL DEFAULT NULL AFTER `pay_mode`;
ALTER TABLE `orders` CHANGE `order_track_status` `order_track_status` ENUM('initiated','packed','dispatched','delivered') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE  `orders` CHANGE  `order_track_status`  `order_track_status` ENUM(  'initiated',  'packed',  'dispatched',  'delivered' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT  'initiated';
-----------------8 jan 2017------
ALTER TABLE `company` ADD `other_poicy` LONGTEXT NOT NULL AFTER `terms_of_service`, ADD `user_agreement` LONGTEXT NOT NULL AFTER `other_poicy`;