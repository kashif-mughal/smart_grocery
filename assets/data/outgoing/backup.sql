INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 3912, '2020-09-03 19:42:11', 0);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 3237, '2020-09-03 19:44:09', 0);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923460030582', 5343, '2020-09-03 19:46:28', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-03 19:45:54'
WHERE `phone_number` = '923460030582';
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 9006, '2020-09-07 15:25:50', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-07 15:25:15'
WHERE `phone_number` = '923458113142';
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '16';
INSERT INTO `grocery_user_address` (`Address`, `UserId`, `Status`) VALUES ('bbbbbbb', '4d50106bfd5ab578634e', 1);
INSERT INTO `grocery_user_address` (`Address`, `UserId`, `Status`) VALUES ('ab;lkasjdf', '4d50106bfd5ab578634e', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 400, 'd6de49bd0e112a7da5952c0e51059902b2b8a23c', '2020-09-07 16:22:06', '2020-09-08', '2020-09-08 10:00 am', '2020-09-08 19:00 pm', '24', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (39, '7', 2, '200', '2020-09-07 16:22:06', 1);
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '23';
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '24';
INSERT INTO `grocery_user_address` (`Address`, `UserId`, `Status`) VALUES ('eeee', '4d50106bfd5ab578634e', 1);
INSERT INTO `grocery_user_address` (`Address`, `UserId`, `Status`) VALUES ('dddd', '4d50106bfd5ab578634e', 1);
INSERT INTO `grocery_user_address` (`Address`, `UserId`, `Status`) VALUES ('ccc', '4d50106bfd5ab578634e', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 210, 'd131e20dff8aebf48c907b99d39284f3a0bc971a', '2020-09-07 16:26:56', '2020-09-07', '2020-09-07 10:00 am', '2020-09-07 19:00 pm', '26', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (40, '10', 3, '70', '2020-09-07 16:26:56', 1);
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '25';
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '28';
UPDATE `grocery_user_address` SET `Status` = 0
WHERE `AddressId` = '26';
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 600, 'e979ed5284ee56e8303998d85162944fb9cfa77a', '2020-09-07 16:28:32', '2020-09-07', '2020-09-07 10:00 am', '2020-09-07 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (41, '7', 3, '200', '2020-09-07 16:28:32', 1);
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 2 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 3 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 4 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 3 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 2 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 1 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 2 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 3 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 4 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 1 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 1 WHERE `OrderId` = 41;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 2 WHERE `OrderId` = 40;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 3 WHERE `OrderId` = 40;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 4 WHERE `OrderId` = 40;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 1 WHERE `OrderId` = 40;
UPDATE `grocery_order` go set  `PreviousOrderStep` = go.`OrderStep`, `OrderStep` = 2 WHERE `OrderId` = 40;
INSERT INTO `grocery_products` (`ProductName`, `Unit`, `OriginalPrice`, `Price`, `SalePrice`, `IsFeatured`, `IsHot`, `Category`, `CreatedOn`, `status`, `SaleUnitQty`, `SaleUnit`, `ProductImg`) VALUES ('P1', NULL, '20', '30', '26', 0, 0, '7', '2020-09-07 18:36:12', 1, '1', '1', 'assets/img/product.png');
INSERT INTO `grocery_products` (`ProductName`, `Unit`, `OriginalPrice`, `Price`, `SalePrice`, `IsFeatured`, `IsHot`, `Category`, `CreatedOn`, `status`, `SaleUnitQty`, `SaleUnit`, `ProductImg`) VALUES ('P1', NULL, '20', '30', '26', 0, 0, '7', '2020-09-07 18:45:25', 1, '1', '1', 'assets/img/product.png');
INSERT INTO `grocery_products` (`ProductName`, `Unit`, `OriginalPrice`, `Price`, `SalePrice`, `IsFeatured`, `IsHot`, `Category`, `CreatedOn`, `status`, `SaleUnitQty`, `SaleUnit`, `ProductImg`) VALUES ('P1', '1', '20', '30', '26', 0, 0, '7', '2020-09-07 18:47:58', 1, '1', '1', 'assets/img/product.png');
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('16', '2020-09-09', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('5', '2020-09-09', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('6', '2020-09-09', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('18', '2020-09-09', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('1', '2020-09-09', 1);
INSERT INTO `grocery_brand` (`BrandName`, `Alias`, `CreatedOn`, `Status`, `Img`) VALUES ('Habib', 'Habib', '2020-09-09 21:24:52', 1, 'assets/img/brand.jpg');
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 6555, '2020-09-10 16:38:56', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-10 16:38:23'
WHERE `phone_number` = '923458113142';
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 600, 'e979ed5284ee56e8303998d85162944fb9cfa77a', '2020-09-10 17:18:35', '2020-09-10', '2020-09-10 10:00 am', '2020-09-10 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (42, '7', 3, '200', '2020-09-10 17:18:35', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 2085, '99d55b86492baa6df39199826699ed778598fe1a', '2020-09-10 17:19:51', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (43, '7', 5, '200', '2020-09-10 17:19:51', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (43, '16', 5, '55', '2020-09-10 17:19:51', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (43, '17', 5, '92', '2020-09-10 17:19:51', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (43, '10', 5, '70', '2020-09-10 17:19:51', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 2415, 'f57951d5361d0e01b3a4bd12a91b00de21619fa6', '2020-09-10 17:26:48', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (44, '6', 3, '400', '2020-09-10 17:26:48', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (44, '1', 3, '55', '2020-09-10 17:26:48', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (44, '7', 3, '200', '2020-09-10 17:26:48', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (44, '3', 3, '150', '2020-09-10 17:26:48', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 420, '226415438d27552547abe8c96e68ffd1008be7a2', '2020-09-10 17:32:07', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (45, '10', 6, '70', '2020-09-10 17:32:07', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 490, 'ebe5589f069df42fc67aeac50772e42bdcd6e4cf', '2020-09-10 17:32:37', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (46, '10', 7, '70', '2020-09-10 17:32:37', 1);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 3653, '2020-09-10 22:11:46', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-10 22:11:11'
WHERE `phone_number` = '923458113142';
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 184, '9799b0f441aeb9fdac44957a6ef32f89dee7b051', '2020-09-10 22:35:59', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (47, '17', 2, '92', '2020-09-10 22:35:59', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 334, '9799b0f441aeb9fdac44957a6ef32f89dee7b051', '2020-09-11 01:52:21', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (48, '17', 2, '92', '2020-09-11 01:52:21', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 570, '226415438d27552547abe8c96e68ffd1008be7a2', '2020-09-11 01:53:04', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (49, '10', 6, '70', '2020-09-11 01:53:04', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `Status`) VALUES ('4d50106bfd5ab578634e', 710, 'f64db88587e8854e1a3b2f37f197bd7015a5f395', '2020-09-11 01:54:18', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (50, '10', 8, '70', '2020-09-11 01:54:18', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `deliveryCharges`, `Status`) VALUES ('4d50106bfd5ab578634e', 386, 'c9b5f4b4968e7642b95ba9500e48e0c25e05eb41', '2020-09-11 01:57:44', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 150, 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (51, '16', 2, '55', '2020-09-11 01:57:44', 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (51, '17', 3, '92', '2020-09-11 01:57:44', 1);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 3199, '2020-09-11 06:37:49', 0);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 4115, '2020-09-11 06:47:22', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-11 06:46:50'
WHERE `phone_number` = '923458113142';
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('6', '2020-09-11', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('7', '2020-09-11', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('1', '2020-09-11', 1);
INSERT INTO `grocery_assistant` (`ProductId`, `CreatedOn`, `Status`) VALUES ('16', '2020-09-11', 1);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 1899, '2020-09-11 16:11:24', 0);
INSERT INTO `grocery_otp` (`phone_number`, `code`, `expiry_date`, `verified`) VALUES ('923458113142', 8001, '2020-09-11 16:13:37', 0);
UPDATE `grocery_otp` SET `verified` = 1, `verified_on` = '2020-09-11 16:13:05'
WHERE `phone_number` = '923458113142';
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `deliveryCharges`, `Status`) VALUES ('4d50106bfd5ab578634e', 1000, '55a429579b14add3aced548b2cbe90e371cca2f7', '2020-09-11 20:56:41', '2020-09-11', '2020-09-11 10:00 am', '2020-09-11 19:00 pm', '27', 150, 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (52, '7', 5, '200', '2020-09-11 20:56:41', 1);
INSERT INTO `grocery_order` (`CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `deliveryCharges`, `Status`) VALUES ('4d50106bfd5ab578634e', 1800, 'a1a586e9a3c29220bec62cdc65e99943eb0988ab', '2020-09-11 20:57:09', '2020-09-12', '2020-09-12 10:00 am', '2020-09-12 19:00 pm', '27', 0, 1);
INSERT INTO `grocery_order_detail` (`OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `CreatedOn`, `Status`) VALUES (53, '7', 9, '200', '2020-09-11 20:57:09', 1);
