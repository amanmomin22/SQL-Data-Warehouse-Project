DROP TABLE IF EXISTS bronze_crm_cust_info;
CREATE TABLE bronze_crm_cust_info(
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_marital_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE 
);
DROP TABLE IF EXISTS bronze_crm_prd_info;
CREATE TABLE bronze_crm_prd_info(
	prd_id INT,
	prd_key VARCHAR(50),
	prd_nm VARCHAR(50),
	prd_cost INT,
	prd_line VARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE 
);
DROP TABLE IF EXISTS bronze_crm_sales_details;
CREATE TABLE bronze_crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATE,
	sls_ship_dt DATE,
	sls_due_dt DATE,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT 
);
DROP TABLE IF EXISTS bronze_erp_CUST_AZ12;
CREATE TABLE bronze_erp_cust_az12(
	CID VARCHAR(50),
	BDATE DATE,
	GEN VARCHAR(50)
);
DROP TABLE IF EXISTS bronze_erp_loc_a101;

CREATE TABLE bronze_erp_loc_a101(
	CID VARCHAR(50),
	CNTRY VARCHAR(50)
);

DROP TABLE IF EXISTS bronze_erp_px_cat_g1v2;
CREATE TABLE bronze_erp_px_cat_g1v2(
	ID VARCHAR(50),
	CAT VARCHAR(50),
	SUBCAT VARCHAR(50),
	MAINTENANCE VARCHAR(50)
);

DROP PROCEDURE IF EXISTS load_bronze;

DELIMITER  //
CREATE PROCEDURE load_bronze()
BEGIN
	TRUNCATE TABLE bronze_crm_cust_info;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
	INTO TABLE bronze_crm_cust_info
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_crm_prd_info;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
	INTO TABLE bronze_crm_prd_info
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_crm_sales_details;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
	INTO TABLE bronze_crm_sales_details
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_cust_az12;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
	INTO TABLE bronze_erp_cust_az12
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_loc_a101;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
	INTO TABLE bronze_erp_loc_a101
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_px_cat_g1v2;
	LOAD DATA LOCAL INFILE 'D:/SQL/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
	INTO TABLE bronze_erp_px_cat_g1v2
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

END
//
DELIMITER ;
