
DROP TABLE IF EXISTS `scm_beforehand_invoice`;
CREATE TABLE `scm_beforehand_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '开票订单编号',
  `nuonuo_order_no` varchar(32) DEFAULT NULL COMMENT '邮寄信息对应的诺诺编号',
  `invoice_line` varchar(2) NOT NULL DEFAULT '' COMMENT '发票种类',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '预开单状态:0提交失败,1开票中，2.开票成功，3开票失败，4已取消',
  `seller_name` varchar(100) DEFAULT NULL COMMENT '销方名称',
  `seller_tax_num` varchar(20) DEFAULT '' COMMENT '销方税号',
  `seller_address` varchar(200) DEFAULT NULL COMMENT '销方地址',
  `seller_tel` varchar(20) DEFAULT '' COMMENT '销方电话',
  `seller_bank` varchar(100) DEFAULT '' COMMENT '销方开户行',
  `seller_account` varchar(100) DEFAULT '' COMMENT '销方账号',
  `buyer_name` varchar(100) DEFAULT NULL COMMENT '购方名称',
  `buyer_tax_num` varchar(20) DEFAULT '' COMMENT '购方税号',
  `buyer_address` varchar(200) DEFAULT NULL COMMENT '购方地址',
  `buyer_tel` varchar(20) DEFAULT '' COMMENT '购方电话',
  `buyer_bank` varchar(100) DEFAULT NULL COMMENT '购方开户行',
  `buyer_account` varchar(100) DEFAULT '' COMMENT '购方账号',
  `delivery_mobile` varchar(20) DEFAULT NULL COMMENT '交付手机号码',
  `delivery_mail` varchar(50) DEFAULT '' COMMENT '交付邮箱',
  `amount` decimal(15,2) DEFAULT '0.00' COMMENT '金额',
  `fail_reason` varchar(500) DEFAULT '' COMMENT '失败原因,未提交到销项就失败的原因放在此字段，已提交到销项的，失败原因为票据失败原因拼接',
  `order_no` text COMMENT '销售订单编号，逗号隔开',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `INVOICE_ORDER_NO` (`invoice_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预开单表';


DROP TABLE IF EXISTS `scm_beforehand_invoice_error`;
CREATE TABLE `scm_beforehand_invoice_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_id` varchar(32) NOT NULL DEFAULT '' COMMENT '请求编号',
  `order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '销售单号',
  `error_reason` varchar(100) DEFAULT NULL COMMENT '失败原因',
  `error_type` tinyint(1) DEFAULT NULL COMMENT '类型:0预开单校验报错,1预开报错',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `REQUEST_ID` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='批量预开异常信息表';


DROP TABLE IF EXISTS `scm_beforehand_invoice_goods`;
CREATE TABLE `scm_beforehand_invoice_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detail_index` int(11) NOT NULL COMMENT '明细序号',
  `invoice_order_no` varchar(64) NOT NULL COMMENT '开票订单编号',
  `goods_name` varchar(90) NOT NULL COMMENT '商品名称',
  `spec_type` varchar(40) DEFAULT NULL COMMENT '规格型号',
  `goods_unit` varchar(22) DEFAULT NULL COMMENT '单位',
  `goods_price` decimal(32,16) DEFAULT '0.0000000000000000' COMMENT '单价',
  `goods_num` decimal(32,16) DEFAULT '0.0000000000000000' COMMENT '数量',
  `tax` decimal(15,2) DEFAULT '0.00' COMMENT '税额',
  `tax_amount` decimal(15,2) DEFAULT '0.00' COMMENT '金额',
  `tax_flag` tinyint(1) NOT NULL COMMENT '含税价标志，0否1是',
  `benefit_flag` tinyint(4) DEFAULT '0' COMMENT '是否享受优惠，0-否，1-是，默认0',
  `benefit_type` varchar(32) DEFAULT NULL COMMENT '优惠类型，此处数据来源于税收分类编码',
  `zero_rate_flag` tinyint(4) DEFAULT NULL COMMENT '0税率标识 0-出口免税 出口零税, 1-免税 ,2-不征税, 3-其他优惠政策',
  `tax_rate` varchar(10) DEFAULT NULL COMMENT '税率：单税率就保存税率，如13%',
  `tax_code` varchar(20) DEFAULT NULL COMMENT '税收分类编码',
  `tax_type_name` varchar(100) DEFAULT NULL COMMENT '税收分类编码名称',
  `order_no` text COMMENT '销售单号，多个以逗号隔开',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `INVOICE_ORDER_NO` (`invoice_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预开单商品表';

DROP TABLE IF EXISTS `scm_beforehand_invoice_result`;
CREATE TABLE `scm_beforehand_invoice_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_id` varchar(32) NOT NULL DEFAULT '' COMMENT '请求编号',
  `order_date_start` datetime DEFAULT NULL COMMENT '销售日期区间开始',
  `order_date_end` datetime DEFAULT NULL COMMENT '销售日期区间开始',
  `total` int(6) DEFAULT NULL COMMENT '订单总数',
  `beforehand_invoice_total` int(6) DEFAULT NULL COMMENT '预开单数',
  `success` int(6) DEFAULT NULL COMMENT '成功订单数',
  `fail` int(6) DEFAULT NULL COMMENT '失败订单数',
  `tax_num` varchar(32) DEFAULT NULL COMMENT '税号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `REQUEST_ID` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预开单商品表批量预开结果表';


DROP TABLE IF EXISTS `scm_call_back_record`;
CREATE TABLE `scm_call_back_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `call_back_result` tinyint(2) NOT NULL DEFAULT '1' COMMENT '回调结果:0失败，1成功',
  `call_back_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号（创建销售单时 用户传入的订单编号）',
  `invoice_order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '预开单编号',
  `response` text COMMENT '回调结果',
  `call_back_task_id` int(11) DEFAULT NULL COMMENT '重新推送定时任务id',
  `resquest` text COMMENT '回调入参',
  `invoice_id` varchar(32) NOT NULL DEFAULT '' COMMENT '发票流水号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='回调记录表';

DROP TABLE IF EXISTS `scm_call_back_task`;
CREATE TABLE `scm_call_back_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuonuo_order_no` varchar(32) DEFAULT NULL COMMENT '诺诺订单编号',
  `invoice_id` varchar(32) DEFAULT NULL COMMENT '发票流水号',
  `fail_reason` text COMMENT '失败原因',
  `fail_count` tinyint(2) NOT NULL DEFAULT '0' COMMENT '重试失败次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='回调任务表';


DROP TABLE IF EXISTS `scm_invoice_detail`;
CREATE TABLE `scm_invoice_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_order_no` varchar(64) NOT NULL COMMENT '开票订单编号',
  `nuonuo_order_no` varchar(32) NOT NULL COMMENT '诺诺订单编号',
  `goods_order` smallint(6) DEFAULT NULL COMMENT '商品明细序号',
  `goods_num` decimal(32,16) DEFAULT '0.0000000000000000' COMMENT '开票数量',
  `amount` decimal(15,2) DEFAULT '0.00' COMMENT '金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `INVOICE_ORDER_NO` (`invoice_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预开单商品拆分详情';


-- ----------------------------
-- Table structure for `scm_invoice_record`
-- ----------------------------
DROP TABLE IF EXISTS `scm_invoice_record`;
CREATE TABLE `scm_invoice_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_order_no` varchar(64) DEFAULT NULL COMMENT '预开单编号(开票订单编号)',
  `invoice_order_detail` varchar(100) DEFAULT NULL COMMENT '发票订单编号（对应页面发票的开票订单编号)',
  `invoice_id` varchar(32) DEFAULT NULL COMMENT '发票流水号',
  `seller_name` varchar(100) NOT NULL DEFAULT '' COMMENT '销方名称',
  `seller_tax_num` varchar(20) NOT NULL COMMENT '销方税号',
  `buyer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '购方名称',
  `buyer_tax_num` varchar(20) NOT NULL DEFAULT '' COMMENT '购方税号',
  `invoice_code` varchar(12) DEFAULT NULL COMMENT '发票代码，不满12位请左补0(开票成功回传)',
  `invoice_number` varchar(8) DEFAULT NULL COMMENT '发票号码，不满8位请左补0(开票成功回传)',
  `tax_amount_total` decimal(15,2) DEFAULT NULL COMMENT '含税金额',
  `tax_amount` decimal(15,2) DEFAULT NULL COMMENT '税额',
  `tax_free_amount_total` decimal(15,2) DEFAULT NULL COMMENT '不含税金额',
  `pdf_url` varchar(255) DEFAULT NULL COMMENT '发票Pdf地址',
  `paper_pdf_url` varchar(255) DEFAULT NULL COMMENT '纸票pdf地址',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `ofd_url` varchar(255) DEFAULT NULL COMMENT 'odf地址',
  `invoice_time` datetime DEFAULT NULL COMMENT '开票日期',
  `invoice_line` varchar(2) NOT NULL COMMENT '发票种类',
  `invoice_status` tinyint(4) DEFAULT NULL COMMENT '开票状态0失败，1成功，2开票中',
  `tax_office_code` varchar(100) NOT NULL DEFAULT '' COMMENT '主营税务机关及代码',
  `intact_certificate_num` varchar(50) NOT NULL DEFAULT '' COMMENT '完税凭证号码',
  `buyer_organization_code` varchar(25) NOT NULL DEFAULT '' COMMENT '身份证号/组织机构代码',
  `fail_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '开票失败原因',
  `express_number` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `express_company` varchar(50) DEFAULT NULL COMMENT '物流公司',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_id_unique_index` (`invoice_id`) USING BTREE,
  KEY `INVOICE_ORDER_NO` (`invoice_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='发票信息表';

DROP TABLE IF EXISTS `scm_order`;
CREATE TABLE `scm_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_line` varchar(2) NOT NULL COMMENT '发票种类',
  `tax_num` varchar(20) DEFAULT NULL COMMENT '纳税人识别号',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_no` varchar(64) DEFAULT NULL COMMENT '销售单号',
  `order_date` datetime NOT NULL COMMENT '销售日期',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态:0待处理，1.处理中.2.已处理',
  `order_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `invoice_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已开票金额',
  `customer_tax_num` varchar(20) NOT NULL COMMENT '客户纳税人识别号',
  `bank` varchar(100) DEFAULT NULL COMMENT '客户开户行',
  `account` varchar(256) DEFAULT NULL COMMENT '开户行账号',
  `address` varchar(100) DEFAULT NULL COMMENT '客户地址',
  `tel` varchar(20) DEFAULT NULL,
  `delivery_mobile` varchar(20) DEFAULT NULL COMMENT '交付手机',
  `delivery_mail` varchar(50) DEFAULT NULL COMMENT '交付邮箱',
  `contact_name` varchar(255) DEFAULT NULL,
  `merge_no` varchar(64) DEFAULT NULL COMMENT '合并开票单号',
  `remake` varchar(200) DEFAULT NULL COMMENT '备注',
  `call_back_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `nuonuo_order_no` varchar(32) NOT NULL DEFAULT '' COMMENT '诺诺编号(主要用于关联)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_NUONUO_ORDER_NO` (`nuonuo_order_no`) USING BTREE,
  KEY `ORDER_NO` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单表';

DROP TABLE IF EXISTS `scm_order_collect`;
CREATE TABLE `scm_order_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(64) DEFAULT NULL COMMENT '销售单号',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批次号',
  `tax_num` varchar(20) DEFAULT NULL COMMENT '税号',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_date` datetime DEFAULT NULL COMMENT '销售日期',
  `collect_time` datetime DEFAULT NULL COMMENT '提取时间',
  `order_amount` decimal(15,2) DEFAULT NULL COMMENT '订单金额',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态:0失败，1成功，2处理中',
  `fail_reason` varchar(100) DEFAULT NULL COMMENT '失败原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `TAX_NUM` (`tax_num`) USING BTREE,
  KEY `ORDER_NO` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单提取表';


DROP TABLE IF EXISTS `scm_order_file`;
CREATE TABLE `scm_order_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuonuo_order_no` varchar(32) NOT NULL DEFAULT '' COMMENT '诺诺编号(主要用于关联订单)',
  `file_name` varchar(100) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_url` varchar(100) NOT NULL DEFAULT '' COMMENT '文件地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `NUONUO_ORDER_NO` (`nuonuo_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单合同表';


DROP TABLE IF EXISTS `scm_order_goods`;
CREATE TABLE `scm_order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuonuo_order_no` varchar(32) DEFAULT NULL COMMENT '诺诺订单编号（用于关联订单）',
  `goods_name` varchar(90) DEFAULT NULL COMMENT '商品名称',
  `row_no` varchar(64) DEFAULT NULL COMMENT '行编号',
  `spec_type` varchar(40) DEFAULT NULL COMMENT '规格型号',
  `goods_unit` varchar(22) DEFAULT NULL COMMENT '单位',
  `goods_price` decimal(32,16) DEFAULT NULL COMMENT '单价',
  `goods_num` decimal(32,16) DEFAULT NULL COMMENT '数量',
  `tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `tax_flag` tinyint(1) NOT NULL COMMENT '含税价标志，0否1是',
  `invoice_num` decimal(32,16) DEFAULT NULL COMMENT '开票数量',
  `invoice_tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已开票金额',
  `benefit_flag` tinyint(4) DEFAULT '0' COMMENT '是否享受优惠，0-否，1-是，默认0',
  `benefit_type` varchar(32) DEFAULT NULL COMMENT '优惠类型，此处数据来源于税收分类编码',
  `zero_rate_flag` tinyint(4) DEFAULT NULL COMMENT '0税率标识 0-出口免税 出口零税, 1-免税 ,2-不征税, 3-其他优惠政策',
  `tax_rate` varchar(10) DEFAULT NULL COMMENT '税率：单税率就保存税率，如13%',
  `tax_code` varchar(20) DEFAULT NULL COMMENT '税收分类编码',
  `tax_type_name` varchar(100) DEFAULT NULL COMMENT '税收分类编码名称',
  `goods_order` smallint(6) NOT NULL COMMENT '商品明细序号',
  `invoice_order_no` text COMMENT '开票订单编号，多个以逗号隔开',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `NUONUO_ORDER_NO` (`nuonuo_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单商品表';


DROP TABLE IF EXISTS `scm_order_goods_tmp`;
CREATE TABLE `scm_order_goods_tmp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_id` varchar(32) DEFAULT NULL COMMENT '请求id,用以确定一次请求',
  `order_no` varchar(64) DEFAULT NULL COMMENT '销售单号',
  `merge_no` varchar(64) DEFAULT NULL COMMENT '合并单号',
  `nuonuo_order_no` varchar(32) DEFAULT NULL COMMENT '诺诺订单编号（用于关联订单）',
  `goods_name` varchar(90) DEFAULT NULL COMMENT '商品名称',
  `row_no` varchar(64) DEFAULT NULL COMMENT '行编号',
  `spec_type` varchar(40) DEFAULT NULL COMMENT '规格型号',
  `goods_unit` varchar(22) DEFAULT NULL COMMENT '单位',
  `goods_price` decimal(32,16) DEFAULT '0.0000000000000000' COMMENT '单价',
  `goods_num` decimal(32,16) DEFAULT '0.0000000000000000' COMMENT '待开票数量',
  `tax` decimal(15,2) DEFAULT NULL COMMENT '税额',
  `tax_amount` decimal(15,2) DEFAULT '0.00' COMMENT '待开票金额',
  `tax_flag` tinyint(1) NOT NULL COMMENT '含税价标志，0否1是',
  `invoice_num` decimal(32,16) DEFAULT NULL COMMENT '开票数量',
  `invoice_tax_amount` decimal(15,2) DEFAULT '0.00' COMMENT '开票金额',
  `benefit_flag` tinyint(4) DEFAULT '0' COMMENT '是否享受优惠，0-否，1-是，默认0',
  `benefit_type` varchar(32) DEFAULT NULL COMMENT '优惠类型，此处数据来源于税收分类编码',
  `zero_rate_flag` tinyint(4) DEFAULT NULL COMMENT '0税率标识 0-出口免税 出口零税, 1-免税 ,2-不征税, 3-其他优惠政策',
  `tax_rate` varchar(10) DEFAULT NULL COMMENT '税率：单税率就保存税率，如13%',
  `tax_code` varchar(20) DEFAULT NULL COMMENT '税收分类编码',
  `tax_type_name` varchar(100) DEFAULT NULL,
  `goods_order` smallint(6) DEFAULT NULL COMMENT '商品明细序号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `NUONUO_ORDER_NO` (`nuonuo_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

DROP TABLE IF EXISTS `scm_receiver`;
CREATE TABLE `scm_receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuonuo_order_no` varchar(32) NOT NULL DEFAULT '' COMMENT '诺诺编号(主要用于关联订单)',
  `receiver` varchar(100) NOT NULL DEFAULT '' COMMENT '收件人',
  `receiver_unit` varchar(100) NOT NULL DEFAULT '' COMMENT '收件单位',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `province_code` varchar(6) DEFAULT NULL COMMENT '省编码(导入)',
  `city_code` varchar(6) DEFAULT NULL COMMENT '市编码',
  `area_code` varchar(6) DEFAULT NULL COMMENT '区编码',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `NUONUO_ORDER_NO` (`nuonuo_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='邮寄信息表';

DROP TABLE IF EXISTS `scm_rule_record`;
CREATE TABLE `scm_rule_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '预开操作人id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '预开操作人名称',
  `tax_num` varchar(20) DEFAULT NULL COMMENT '税号',
  `beforehand_type` tinyint(2) DEFAULT NULL COMMENT '预开类型:0手动预开1批量预开',
  `rules` varchar(10) DEFAULT NULL COMMENT '规则，逗号隔开',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='预开规则表';
