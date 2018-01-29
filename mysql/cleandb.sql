DELIMITER $$

DROP PROCEDURE IF EXISTS `TruncateTable`$$

CREATE PROCEDURE TruncateTable (IN t VARCHAR(50))
	BEGIN
	DECLARE tt VARCHAR(50);
	set tt = (SELECT TABLE_NAME FROM information_schema.TABLES WHERE table_name REGEXP CONCAT('^([a-z]*_)?',t, '$')
		AND table_schema = DATABASE() AND table_type = 'BASE TABLE' order by TABLE_NAME DESC LIMIT 1);
		
	IF tt IS NOT NULL THEN
		set @q = CONCAT('TRUNCATE TABLE ', DATABASE(),'.', tt, ';');
		prepare stmt from @q;
		execute stmt;
	END IF;
	
	END$$

DELIMITER ;

SET FOREIGN_KEY_CHECKS=0;

-- Customers
call TruncateTable('customer_address_entity');
call TruncateTable('customer_address_entity_datetime');
call TruncateTable('customer_address_entity_decimal');
call TruncateTable('customer_address_entity_int');
call TruncateTable('customer_address_entity_text');
call TruncateTable('customer_address_entity_varchar');
call TruncateTable('customer_entity');
call TruncateTable('customer_entity_datetime');
call TruncateTable('customer_entity_decimal');
call TruncateTable('customer_entity_int');
call TruncateTable('customer_entity_text');
call TruncateTable('customer_entity_varchar');

-- Customers M2
call TruncateTable('customer_grid_flat');
call TruncateTable('customer_log');
call TruncateTable('customer_visitor');
call TruncateTable('persistent_session');

-- Search
call TruncateTable('catalogsearch_query');
call TruncateTable('catalogsearch_fulltext');
call TruncateTable('catalogsearch_result');

-- Polls
call TruncateTable('poll');
call TruncateTable('poll_answer');
call TruncateTable('poll_store');
call TruncateTable('poll_vote');

-- Reports
call TruncateTable('report_viewed_product_index');

-- Newsletter
call TruncateTable('newsletter_queue');
call TruncateTable('newsletter_queue_link');
call TruncateTable('newsletter_subscriber');
call TruncateTable('newsletter_problem');
call TruncateTable('newsletter_queue_store_link');

-- Wishlist
call TruncateTable('wishlist');
call TruncateTable('wishlist_item');
call TruncateTable('wishlist_item_option');

-- Logs
call TruncateTable('log_customer');
call TruncateTable('log_visitor');
call TruncateTable('log_visitor_info');
call TruncateTable('log_visitor_online');
call TruncateTable('log_quote');
call TruncateTable('log_summary');
call TruncateTable('log_summary_type');
call TruncateTable('log_url');
call TruncateTable('log_url_info');
call TruncateTable('sendfriend_log');
call TruncateTable('report_event');
call TruncateTable('dataflow_batch_import');
call TruncateTable('dataflow_batch_export');
call TruncateTable('index_process_event');
call TruncateTable('index_event');

--
-- Enterprise Edition
-- 
call TruncateTable('enterprise_logging_event');
call TruncateTable('enterprise_logging_event_changes');

-- Sales 
call TruncateTable('sales_payment_transaction');
call TruncateTable('sales_flat_creditmemo');
call TruncateTable('sales_flat_creditmemo_comment');
call TruncateTable('sales_flat_creditmemo_grid');
call TruncateTable('sales_flat_creditmemo_item');
call TruncateTable('sales_flat_order');
call TruncateTable('sales_flat_order_address');
call TruncateTable('sales_flat_order_grid');
call TruncateTable('sales_flat_order_item');
call TruncateTable('sales_flat_order_status_history');
call TruncateTable('sales_flat_quote');
call TruncateTable('sales_flat_quote_address');
call TruncateTable('sales_flat_quote_address_item');
call TruncateTable('sales_flat_quote_item');
call TruncateTable('sales_flat_quote_item_option');
call TruncateTable('sales_flat_order_payment');
call TruncateTable('sales_flat_quote_payment');
call TruncateTable('sales_flat_quote_shipping_rate');
call TruncateTable('sales_flat_shipment');
call TruncateTable('sales_flat_shipment_item');
call TruncateTable('sales_flat_shipment_grid');
call TruncateTable('sales_flat_shipment_track');
call TruncateTable('sales_flat_invoice');
call TruncateTable('sales_flat_invoice_grid');
call TruncateTable('sales_flat_invoice_item');
call TruncateTable('sales_flat_invoice_comment');
call TruncateTable('sales_order_tax');
call TruncateTable('sales_order_tax_item');


-- Sales M2
call TruncateTable('gift_message');
call TruncateTable('quote');
call TruncateTable('quote_address');
call TruncateTable('quote_address_item');
call TruncateTable('quote_id_mask');
call TruncateTable('quote_item');
call TruncateTable('quote_item_option');
call TruncateTable('quote_payment');
call TruncateTable('quote_shipping_rate');
call TruncateTable('reporting_orders');
call TruncateTable('sales_bestsellers_aggregated_daily');
call TruncateTable('sales_bestsellers_aggregated_monthly');
call TruncateTable('sales_bestsellers_aggregated_yearly');
call TruncateTable('sales_creditmemo');
call TruncateTable('sales_creditmemo_comment');
call TruncateTable('sales_creditmemo_grid');
call TruncateTable('sales_creditmemo_item');
call TruncateTable('sales_invoice');
call TruncateTable('sales_invoiced_aggregated');
call TruncateTable('sales_invoiced_aggregated_order');
call TruncateTable('sales_invoice_comment');
call TruncateTable('sales_invoice_grid');
call TruncateTable('sales_invoice_item');
call TruncateTable('sales_order');
call TruncateTable('sales_order_address');
call TruncateTable('sales_order_aggregated_created');
call TruncateTable('sales_order_aggregated_updated');
call TruncateTable('sales_order_grid');
call TruncateTable('sales_order_item');
call TruncateTable('sales_order_payment');
call TruncateTable('sales_order_status_history');
call TruncateTable('sales_order_tax');
call TruncateTable('sales_order_tax_item');
call TruncateTable('sales_refunded_aggregated');
call TruncateTable('sales_refunded_aggregated_order');
call TruncateTable('sales_shipment');
call TruncateTable('sales_shipment_comment');
call TruncateTable('sales_shipment_grid');
call TruncateTable('sales_shipment_item');
call TruncateTable('sales_shipment_track');
call TruncateTable('sales_shipping_aggregated');
call TruncateTable('sales_shipping_aggregated_order');
call TruncateTable('tax_order_aggregated_created');
call TruncateTable('tax_order_aggregated_updated');


-- Recurring Profiles
call TruncateTable('sales_recurring_profile');
call TruncateTable('sales_recurring_profile_order');

-- Reports
call TruncateTable('sales_bestsellers_aggregated_daily');
call TruncateTable('sales_bestsellers_aggregated_monthly');
call TruncateTable('sales_bestsellers_aggregated_yearly');
call TruncateTable('sales_invoiced_aggregated');
call TruncateTable('sales_invoiced_aggregated_order');
call TruncateTable('sales_order_aggregated_created');
call TruncateTable('sales_order_aggregated_updated');
call TruncateTable('sales_refunded_aggregated');
call TruncateTable('sales_refunded_aggregated_order');
call TruncateTable('sales_shipping_aggregated');
call TruncateTable('sales_shipping_aggregated_order');
call TruncateTable('coupon_aggregated');
call TruncateTable('review');
call TruncateTable('review_detail');
call TruncateTable('review_entity_summary');
call TruncateTable('rating_store');

--
-- Enterprise Edition
-- 
call TruncateTable('enterprise_reward');
call TruncateTable('enterprise_reward_history');
call TruncateTable('enterprise_customer_sales_flat_quote_address');
call TruncateTable('enterprise_customer_sales_flat_quote');
call TruncateTable('enterprise_customer_sales_flat_order_address');
call TruncateTable('enterprise_customer_sales_flat_order');

 
call TruncateTable('eav_entity_store');

SET FOREIGN_KEY_CHECKS=1;

DROP PROCEDURE IF EXISTS TruncateTable;
