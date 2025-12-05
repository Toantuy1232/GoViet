-- Tạo bảng bookings để lưu thông tin đặt tour và khách sạn
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0 COMMENT 'ID người dùng, 0 nếu guest',
  `booking_type` varchar(50) NOT NULL COMMENT 'tour hoặc hotel',
  `item_id` int(11) NOT NULL COMMENT 'ID của tour hoặc hotel',
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `check_in_date` varchar(50) NOT NULL COMMENT 'Ngày bắt đầu/nhận phòng',
  `check_out_date` varchar(50) DEFAULT NULL COMMENT 'Ngày kết thúc/trả phòng',
  `number_of_people` int(11) NOT NULL DEFAULT 1,
  `total_price` double NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'pending' COMMENT 'pending, confirmed, cancelled',
  `notes` text COMMENT 'Ghi chú của khách hàng',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_booking_type` (`booking_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tạo bảng cart (TÙY CHỌN - nếu muốn lưu giỏ hàng vào database thay vì session)
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_type` varchar(50) NOT NULL COMMENT 'tour or hotel',
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart_item` (`user_id`, `item_type`, `item_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
