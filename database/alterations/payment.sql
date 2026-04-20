USE serviqo_s_df;
--use your db name
GO 
ALTER TABLE dbo.payments
ADD payable_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00;

ALTER TABLE dbo.payments
DROP COLUMN paid_amount;