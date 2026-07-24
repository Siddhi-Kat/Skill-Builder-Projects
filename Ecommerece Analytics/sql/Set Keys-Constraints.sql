/* ==========================================================
   PRIMARY KEYS
   ========================================================== */

ALTER TABLE website_sessions
ADD PRIMARY KEY (website_session_id);

ALTER TABLE website_pageviews
ADD PRIMARY KEY (website_pageview_id);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE order_items
ADD PRIMARY KEY (order_item_id);

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE order_item_refunds
ADD PRIMARY KEY (order_item_refund_id);


/* ==========================================================
   FOREIGN KEYS
   ========================================================== */

-- Website Pageviews → Website Sessions
ALTER TABLE website_pageviews
ADD CONSTRAINT fk_pageviews_sessions
FOREIGN KEY (website_session_id)
REFERENCES website_sessions(website_session_id);

-- Orders → Website Sessions
ALTER TABLE orders
ADD CONSTRAINT fk_orders_sessions
FOREIGN KEY (website_session_id)
REFERENCES website_sessions(website_session_id);

-- Order Items → Orders
ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items → Products
ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

-- Order Item Refunds → Order Items
ALTER TABLE order_item_refunds
ADD CONSTRAINT fk_refunds_orderitems
FOREIGN KEY (order_item_id)
REFERENCES order_items(order_item_id);