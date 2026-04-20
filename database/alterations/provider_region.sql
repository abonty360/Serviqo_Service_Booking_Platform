ALTER TABLE service_orders 
   ADD city_name NVARCHAR(255) NULL,
    area_name NVARCHAR(255) NULL;
ALTER TABLE service_providers 
 ADD region NVARCHAR(255) NULL;