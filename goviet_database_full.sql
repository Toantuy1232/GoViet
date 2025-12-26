-- GoViet Database Full Setup
-- Run this script to create the complete database structure with sample data

-- Create database
CREATE DATABASE IF NOT EXISTS `goviet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `goviet`;

-- Categories table
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image_url` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Products table
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100),
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `price_old` decimal(10,2),
  `stock` int(11) DEFAULT 0,
  `image_url` varchar(255),
  `category_id` int(11),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Destinations table
CREATE TABLE IF NOT EXISTS `destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image_url` varchar(255),
  `country` varchar(100),
  `category_id` int(11),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tours table
CREATE TABLE IF NOT EXISTS `tours` (
  `tour_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11),
  `category_id` int(11),
  `title` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `price_old` decimal(10,2),
  `duration_days` int(11),
  `start_date` timestamp NULL,
  `end_date` timestamp NULL,
  `available_slots` int(11) DEFAULT 0,
  `main_image` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tour_id`),
  KEY `idx_destination_id` (`destination_id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Blogposts table
CREATE TABLE IF NOT EXISTS `blogposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `excerpt` text,
  `image_url` varchar(255),
  `author_id` int(11),
  `status` varchar(20) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Users table
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL UNIQUE,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'USER',
  `fullname` varchar(255),
  `phone` varchar(20),
  `address` text,
  `avatar_url` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Category Gallery table
CREATE TABLE IF NOT EXISTS `category_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),
  `image_url` varchar(255) NOT NULL,
  `title` varchar(255),
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Banners table
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255),
  `image_url` varchar(255) NOT NULL,
  `link_url` varchar(255),
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data
INSERT INTO `categories` (`name`, `description`, `image_url`) VALUES
('Tour Trong Nước', 'Các tour du lịch trong nước Việt Nam', 'category-domestic.jpg'),
('Tour Nước Ngoài', 'Các tour du lịch quốc tế', 'category-international.jpg'),
('Tour Biển', 'Các tour du lịch biển đảo', 'category-beach.jpg'),
('Tour Núi', 'Các tour du lịch miền núi', 'category-mountain.jpg');

INSERT INTO `destinations` (`name`, `description`, `country`, `category_id`) VALUES
('Hạ Long', 'Vịnh Hạ Long - Di sản thế giới', 'Việt Nam', 1),
('Sapa', 'Thị trấn Sapa - Miền núi phía Bắc', 'Việt Nam', 4),
('Phú Quốc', 'Đảo Phú Quốc - Ngọc đảo', 'Việt Nam', 3),
('Bangkok', 'Thủ đô Bangkok - Thái Lan', 'Thái Lan', 2),
('Singapore', 'Đảo quốc Singapore', 'Singapore', 2);

INSERT INTO `tours` (`title`, `description`, `price`, `price_old`, `duration_days`, `available_slots`, `main_image`, `destination_id`, `category_id`) VALUES
('Tour Hạ Long 2N1Đ', 'Khám phá vịnh Hạ Long với du thuyền 5 sao', 1200000, 1500000, 2, 20, 'tour-halong.jpg', 1, 1),
('Tour Sapa 3N2Đ', 'Trekking Sapa - Chinh phục Fansipan', 1800000, 2200000, 3, 15, 'tour-sapa.jpg', 2, 4),
('Tour Phú Quốc 4N3Đ', 'Nghỉ dưỡng tại đảo Phú Quốc', 2500000, 3000000, 4, 25, 'tour-phuquoc.jpg', 3, 3),
('Tour Bangkok 4N3Đ', 'Khám phá Bangkok - Thái Lan', 3500000, 4000000, 4, 18, 'tour-bangkok.jpg', 4, 2),
('Tour Singapore 3N2Đ', 'City tour Singapore hiện đại', 4200000, 5000000, 3, 12, 'tour-singapore.jpg', 5, 2);

INSERT INTO `products` (`name`, `description`, `price`, `price_old`, `stock`, `image_url`, `category_id`) VALUES
('Vé máy bay Hà Nội - TP.HCM', 'Vé máy bay khứ hồi', 2500000, 3000000, 50, 'ticket-hanoi-hcm.jpg', 1),
('Khách sạn 5 sao Hạ Long', 'Phòng khách sạn view vịnh', 1800000, 2200000, 20, 'hotel-halong.jpg', 1),
('Tour guide tiếng Anh', 'Hướng dẫn viên chuyên nghiệp', 500000, 600000, 10, 'guide-english.jpg', 1);

INSERT INTO `blogposts` (`title`, `content`, `excerpt`, `image_url`) VALUES
('10 Điểm Đến Hấp Dẫn Nhất Việt Nam', 'Việt Nam có rất nhiều điểm đến tuyệt vời...', 'Khám phá những điểm đến đẹp nhất Việt Nam', 'blog-vietnam-destinations.jpg'),
('Kinh Nghiệm Du Lịch Sapa Mùa Đông', 'Sapa mùa đông có gì đặc biệt...', 'Hướng dẫn du lịch Sapa mùa đông', 'blog-sapa-winter.jpg'),
('Ẩm Thực Đường Phố Bangkok', 'Bangkok nổi tiếng với ẩm thực đường phố...', 'Khám phá ẩm thực Bangkok', 'blog-bangkok-food.jpg');

INSERT INTO `users` (`email`, `password_hash`, `role`, `fullname`, `phone`, `avatar_url`) VALUES
('admin@goviet.com', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'ADMIN', 'Admin GoViet', '0123456789', 'avatar-admin.jpg'),
('guide@goviet.com', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'GUIDE', 'Nguyễn Bá Toàn', '0987654321', 'avatar-guide.jpg'),
('user@goviet.com', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'USER', 'Nguyễn Văn A', '0111222333', 'avatar-user.jpg');

INSERT INTO `category_gallery` (`category_id`, `image_url`, `title`, `description`) VALUES
(1, 'gallery-domestic-1.jpg', 'Hạ Long Bay', 'Vịnh Hạ Long tuyệt đẹp'),
(1, 'gallery-domestic-2.jpg', 'Sapa Valley', 'Thung lũng Sapa mùa lúa chín'),
(2, 'gallery-international-1.jpg', 'Bangkok Temple', 'Chùa Wat Pho Bangkok'),
(3, 'gallery-beach-1.jpg', 'Phú Quốc Beach', 'Bãi biển Phú Quốc'),
(4, 'gallery-mountain-1.jpg', 'Fansipan Peak', 'Đỉnh Fansipan');

INSERT INTO `banners` (`title`, `image_url`, `link_url`, `status`) VALUES
('Tour Hè 2024', 'banner-summer-2024.jpg', '/tours', 'active'),
('Khuyến mãi đặc biệt', 'banner-promotion.jpg', '/products', 'active');

-- Create orders table (from existing file)
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL UNIQUE,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` text NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `order_status` varchar(20) DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_code` (`order_code`),
  KEY `idx_order_status` (`order_status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create order_items table
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255),
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_product_id` (`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Additional tables for cart and bookings
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL UNIQUE,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `booking_date` date NOT NULL,
  `special_requests` text,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_tour_id` (`tour_id`),
  KEY `idx_order_code` (`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Hotels table
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `address` text,
  `city` varchar(100),
  `country` varchar(100),
  `star_rating` int(1) DEFAULT 3,
  `price_per_night` decimal(10,2),
  `image_url` varchar(255),
  `amenities` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Consultations table
CREATE TABLE IF NOT EXISTS `consultations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `subject` varchar(255),
  `message` text NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample hotels
INSERT INTO `hotels` (`name`, `description`, `address`, `city`, `country`, `star_rating`, `price_per_night`, `image_url`) VALUES
('Khách sạn Hạ Long Bay', 'Khách sạn 5 sao view vịnh Hạ Long', '123 Đường Hạ Long', 'Quảng Ninh', 'Việt Nam', 5, 2500000, 'hotel-halong-bay.jpg'),
('Resort Phú Quốc', 'Resort nghỉ dưỡng bên bờ biển', '456 Bãi Trường', 'Phú Quốc', 'Việt Nam', 4, 1800000, 'resort-phu-quoc.jpg');

COMMIT;