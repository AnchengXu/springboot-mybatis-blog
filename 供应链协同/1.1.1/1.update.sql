ALTER TABLE scm_order_goods 
ADD COLUMN discount_amount decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额' AFTER `tax_amount` ,
ADD COLUMN invoice_discount_amount decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已开票折扣金额' AFTER `invoice_tax_amount`;

ALTER TABLE scm_beforehand_invoice 
ADD COLUMN user_account varchar(20)  DEFAULT NULL COMMENT '预开人账号' AFTER `fail_reason`,
ADD COLUMN user_name varchar(20)  DEFAULT NULL COMMENT '预开人名称' AFTER `fail_reason`,
ADD COLUMN user_id bigint(20)  DEFAULT NULL COMMENT '预开人id' AFTER `fail_reason`,
MODIFY  COLUMN seller_account  varchar(255) DEFAULT '' COMMENT '销方账号',
MODIFY  COLUMN buyer_account  varchar(255) DEFAULT '' COMMENT '购方账号';

ALTER TABLE scm_beforehand_invoice_goods ADD COLUMN detail_type tinyint(4) NOT NULL DEFAULT 0 COMMENT '明细行性质:0,正常行;1,折扣行;2,被折扣行' AFTER `detail_index`;

ALTER TABLE scm_invoice_detail ADD COLUMN discount_amount decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额' AFTER `amount`;

ALTER TABLE scm_invoice_record 
ADD COLUMN origin_invoice_code varchar(12) DEFAULT NULL COMMENT '蓝票号码' AFTER `invoice_code`,
ADD COLUMN origin_invoice_number varchar(8) DEFAULT NULL COMMENT '蓝票代码' AFTER `invoice_number`,
ADD COLUMN invoice_type tinyint(1) NOT NULL DEFAULT 0 COMMENT '发票类型:0蓝票,1红票' AFTER `invoice_line`,
MODIFY  COLUMN invoice_status tinyint(4) DEFAULT NULL COMMENT '开票状态0失败，1成功，2开票中,3.已作废 4.已冲红';

ALTER TABLE scm_order_goods_tmp
ADD COLUMN discount_amount decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额' AFTER `tax_amount`,
ADD COLUMN invoice_discount_amount decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已开票折扣金额' AFTER `invoice_tax_amount`;

-- ----------------------------
-- 日志模块初始化数据，增加预开单-回传
-- ----------------------------
DELETE FROM `cmp_base_uri_mapping` WHERE `id`='152';
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('152', '/scm/beforeHandInvoice/callback.do', '预开单-回传', '销售开票', '131');

-- ----------------------------
-- 菜单初始化数据，调整一级菜单顺序，增加批量预开结果
-- ----------------------------
UPDATE `cmp_base_menu` set `menu_order`=3 where `menu_code`='sellscm';
DELETE FROM `cmp_base_menu` WHERE `menu_id`=240;
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (240, '销售订单-批量预开结果', 4, 'sellscm-batch-invoice-result', 'sellscm-order', NULL, 15, NULL, 1111, NULL);
