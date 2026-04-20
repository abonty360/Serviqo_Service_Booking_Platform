 -- 1. customers
     CREATE TABLE customers (
         id BIGINT IDENTITY(1,1) PRIMARY KEY,
         fname NVARCHAR(255) NOT NULL,
         lname NVARCHAR(255) NOT NULL,
         dob DATE NULL,
         email NVARCHAR(255) NOT NULL UNIQUE,
         phone NVARCHAR(255) NULL,
         password NVARCHAR(255) NOT NULL,
         address NVARCHAR(255) NULL,
         city NVARCHAR(255) NOT NULL,
         region NVARCHAR(255) NULL,
         date_registered DATETIME2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
         preferred_payment_method NVARCHAR(255) NULL,
         created_at DATETIME2 NULL,
         updated_at DATETIME2 NULL
     );
    
     -- 2. categories
     CREATE TABLE categories (
         id BIGINT IDENTITY(1,1) PRIMARY KEY,
         name NVARCHAR(255) NOT NULL,
         description NVARCHAR(MAX) NULL,
         created_at DATETIME2 NULL,
         updated_at DATETIME2 NULL
     );
    
     -- 3. service_areas
     CREATE TABLE service_areas (
         id BIGINT IDENTITY(1,1) PRIMARY KEY,
         city_name NVARCHAR(255) NOT NULL,
         area_name NVARCHAR(255) NOT NULL,
         postal_code NVARCHAR(255) NULL,
         created_at DATETIME2 NULL,
         updated_at DATETIME2 NULL,
         CONSTRAINT service_areas_city_area_unique UNIQUE (city_name, area_name)
     );
    
     -- 4. sub_services
     CREATE TABLE sub_services (
         id BIGINT IDENTITY(1,1) PRIMARY KEY,
         service_name NVARCHAR(255) NOT NULL,
         description NVARCHAR(MAX) NULL,
         category_id BIGINT NOT NULL,
         created_at DATETIME2 NULL,
         updated_at DATETIME2 NULL,
         CONSTRAINT sub_services_category_id_foreign FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
         CONSTRAINT sub_services_category_service_unique UNIQUE (category_id, service_name)
     );
    
     -- 5. service_providers
     CREATE TABLE service_providers (
         id BIGINT IDENTITY(1,1) PRIMARY KEY,
         full_name NVARCHAR(255) NOT NULL,
        email NVARCHAR(255) NOT NULL UNIQUE,
        phone NVARCHAR(255) NOT NULL,
        address NVARCHAR(255) NULL,
        city NVARCHAR(255) NOT NULL,
        rating DECIMAL(3, 2) DEFAULT 0.00,
        nid NVARCHAR(255) NOT NULL UNIQUE,
        service_area_id BIGINT NOT NULL,
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT service_providers_service_area_id_foreign FOREIGN KEY (service_area_id) REFERENCES service_areas(id) ON DELETE CASCADE
    );
   
    -- 6. service_provider_offerings
    CREATE TABLE service_provider_offerings (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        service_provider_id BIGINT NOT NULL,
        sub_service_id BIGINT NOT NULL,
        price_charged DECIMAL(10, 2) NOT NULL,
        rating DECIMAL(3, 2) DEFAULT 0.00,
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT spo_provider_service_unique UNIQUE (service_provider_id, sub_service_id),
        CONSTRAINT spo_provider_id_foreign FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE,
        CONSTRAINT spo_sub_service_id_foreign FOREIGN KEY (sub_service_id) REFERENCES sub_services(id) ON DELETE CASCADE
    );
   
    -- 7. service_orders
    CREATE TABLE service_orders (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        customer_id BIGINT NOT NULL,
        status NVARCHAR(255) DEFAULT 'pending',
        total_amount DECIMAL(10, 2) DEFAULT 0.00,
        payment_status NVARCHAR(255) DEFAULT 'unpaid',
        order_datetime DATETIME2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
        scheduled_datetime DATETIME2 NULL,
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT service_orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
    );
   
    -- 8. order_items
    CREATE TABLE order_items (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        service_order_id BIGINT NOT NULL,
        service_provider_offering_id BIGINT NOT NULL,
        quantity INT DEFAULT 1,
        item_price DECIMAL(10, 2) NOT NULL,
        item_status NVARCHAR(255) DEFAULT 'pending',
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT order_items_service_order_id_foreign FOREIGN KEY (service_order_id) REFERENCES service_orders(id) ON DELETE CASCADE,
        CONSTRAINT order_items_offering_id_foreign FOREIGN KEY (service_provider_offering_id) REFERENCES service_provider_offerings(id) ON DELETE CASCADE
    );
   
    -- 9. ratings_reviews
    CREATE TABLE ratings_reviews (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        customer_id BIGINT NOT NULL,
        service_provider_id BIGINT NOT NULL,
        service_order_id BIGINT NOT NULL,
        rating INT NOT NULL,
        review_date DATE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,
        review_notes NVARCHAR(MAX) NULL,
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT ratings_reviews_customer_order_unique UNIQUE (customer_id, service_order_id),
        CONSTRAINT ratings_reviews_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES customers(id),
        CONSTRAINT ratings_reviews_provider_id_foreign FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE,
        CONSTRAINT ratings_reviews_order_id_foreign FOREIGN KEY (service_order_id) REFERENCES service_orders(id) ON DELETE CASCADE
    );
   
    -- 10. payments
    CREATE TABLE payments (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        service_order_id BIGINT NOT NULL,
        payment_method NVARCHAR(255) NOT NULL,
        paid_amount DECIMAL(10, 2) NOT NULL,
        payment_datetime DATETIME2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
        transaction_reference NVARCHAR(255) NULL,
        created_at DATETIME2 NULL,
        updated_at DATETIME2 NULL,
        CONSTRAINT payments_service_order_id_foreign FOREIGN KEY (service_order_id) REFERENCES service_orders(id) ON DELETE CASCADE
    );
   
    -- 11. order_confirmations
    CREATE TABLE order_confirmations (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        service_order_id BIGINT NOT NULL,
        confirmation_status NVARCHAR(255) DEFAULT 'pending' CHECK (confirmation_status IN ('pending', 'confirmed', 'cancelled')),
        final_amount DECIMAL(10, 2) NOT NULL,
        confirmed_at DATETIME2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
       notes NVARCHAR(MAX) NULL
       );

ALTER TABLE order_confirmations
ADD CONSTRAINT FK_order_confirmations_order
FOREIGN KEY (service_order_id)
REFERENCES service_orders(id)
ON DELETE CASCADE;