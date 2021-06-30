-- ----------------------------
-- 菜单初始化数据
-- ----------------------------
DELETE FROM `cmp_base_menu` WHERE system_code=4 AND `menu_id`>112;
DELETE FROM `cmp_base_menu` WHERE system_code=15;
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (213, '销售开票', 1, 'sellscm', NULL, NULL, 15, 'iconxiaoshouguanli', 1111, NULL);
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (214, '销售订单', 2, 'sellscm-order', 'sellscm', NULL, 15, NULL, 11, NULL);
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (215, '预开单', 2, 'sellscm-preinvoice', 'sellscm', NULL, 15, NULL, 12, NULL);
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (227, '销售订单-添加', 4, 'sellscm-order-add', 'sellscm-order', NULL, 15, NULL, 1111, '/scm/order/saleOrder/add.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (228, '销售订单-编辑', 4, 'sellscm-order-update', 'sellscm-order', NULL, 15, NULL, 1111, '/scm/order/saleOrder/update.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (229, '销售订单-删除', 4, 'sellscm-order-delete', 'sellscm-order', NULL, 15, NULL, 1111, '/scm/order/saleOrder/delete.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (230, '销售订单-订单提取', 4, 'sellscm-order-collection', 'sellscm-order', NULL, 15, NULL, 1111, NULL);
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (231, '销售订单-手工生成预开', 4, 'sellscm-order-preinvoice', 'sellscm-order', NULL, 15, NULL, 1111, '/scm/order/saleOrder/manualHandInvoice.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (232, '销售订单-批量生成预开', 4, 'sellscm-order-batchinvoice', 'sellscm-order', NULL, 15, NULL, 1111, '/scm/order/saleOrder/autoHandInvoice.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (233, '预开单-重开', 4, 'sellscm-preinvoice-retry', 'sellscm-preinvoice', NULL, 15, NULL, 1111, '/scm/beforeHandInvoice/reInvoice.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (234, '预开单-编辑', 4, 'sellscm-preinvoice-update', 'sellscm-preinvoice', NULL, 15, NULL, 1111, '/scm/beforeHandInvoice/updateBeforehandInvoiceInfo.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (235, '预开单-取消', 4, 'sellscm-preinvoice-cancle', 'sellscm-preinvoice', NULL, 15, NULL, 1111, '/scm/beforeHandInvoice/cancelBeforehandInvoice.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (236, '预开单-删除', 4, 'sellscm-preinvoice-delete', 'sellscm-preinvoice', NULL, 15, NULL, 1111, '/scm/beforeHandInvoice/delBeforehandInvoice.do');
INSERT INTO `cmp_base_menu` (`menu_id`, `menu_name`, `menu_level`, `menu_code`, `parent_code`, `menu_type`, `system_code`, `icon`, `menu_order`, `menu_uri`) VALUES (237, '预开单-发票邮寄', 4, 'sellscm-preinvoice-delivery', 'sellscm-preinvoice', NULL, 15, NULL, 1111, '/scm/beforeHandInvoice/updateExpressInfo.do');

-- ----------------------------
-- 日志模块初始化数据
-- ----------------------------
DELETE FROM cmp_base_uri_mapping WHERE id = 131;
DELETE FROM cmp_base_uri_mapping WHERE parent_id = 131;
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('131', NULL, '销售开票', NULL, '0');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('132', '/scm/beforeHandInvoice/updateGoodsInfo.do', '预开单-编辑-修改商品', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('133', '/scm/beforeHandInvoice/updateBeforehandInvoiceInfo.do', '预开单-编辑', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('134', '/scm/beforeHandInvoice/reInvoice.do', '预开单-重开', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('135', '/scm/beforeHandInvoice/updateExpressInfo.do', '预开单-发票邮寄', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('136', '/scm/beforeHandInvoice/cancelBeforehandInvoice.do', '预开单-取消预开单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('137', '/scm/beforeHandInvoice/delBeforehandInvoice.do', '预开单-删除预开单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('138', '/scm/lan/callback/invoiceCallback.do', '回调-销项开票成功回调', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('139', '/scm/lan/out/addOrder.do', '接口-创建订单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('140', '/scm/orderCollection/exportBeforehandError.do', '销售订单-生成预开-异常信息导出', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('141', '/scm/orderCollection/bizCollection.do', '销售订单-订单提取', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('142', '/scm/order/saleOrder/upload.do', '销售订单-创建/编辑-合同上传', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('143', '/scm/order/saleOrder/goodsImport.do', '销售订单-创建/编辑-商品批量导入', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('144', '/scm/order/saleOrder/getByOrderNos.do', '销售订单-生成预开-前置校验', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('145', '/scm/order/saleOrder/manualHandInvoice.do', '销售订单-生成预开', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('146', '/scm/order/saleOrder/updateTempGoods.do', '销售订单-生成预开-修改商品', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('147', '/scm/order/saleOrder/add.do', '销售订单-创建订单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('148', '/scm/order/saleOrder/delete.do', '销售订单-删除订单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('149', '/scm/order/saleOrder/update.do', '销售订单-编辑订单', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('150', '/scm/order/saleOrder/autoHandInvoice.do', '销售订单-批量预开', '销售开票', '131');
INSERT INTO `cmp_base_uri_mapping` (`id`, `operation_uri`, `operation_name`, `operation_parent_name`, `parent_id`) VALUES ('151', '/scm/order/saleOrder/autoHandInvoiceCheck.do', '销售订单-批量预开校验', '销售开票', '131');

