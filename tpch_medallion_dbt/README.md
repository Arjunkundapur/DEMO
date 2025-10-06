# TPCH Medallion (Snowflake + dbt)

This project uses Snowflake's `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` as the raw source and
builds a Medallion pipeline (Bronze → Silver → Gold) ending in a simple sales star schema.

## Quickstart (dbt Cloud)

1. **Snowflake setup** (run once in a Snowflake worksheet with a powerful role):
   - Create/confirm a writable DB (e.g., `DEMO_DB`) and schemas:
     ```sql
     CREATE DATABASE IF NOT EXISTS DEMO_DB;
     CREATE SCHEMA IF NOT EXISTS DEMO_DB.BRONZE;
     CREATE SCHEMA IF NOT EXISTS DEMO_DB.SILVER;
     CREATE SCHEMA IF NOT EXISTS DEMO_DB.GOLD;
     CREATE SCHEMA IF NOT EXISTS DEMO_DB.SNAPSHOTS;
     ```
   - Ensure your role has USAGE on `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` and `SELECT` on its tables.

2. **dbt Cloud environment**:
   - Account: `<your_snowflake_account>`
   - Role: `DBT_ROLE` (or `SYSADMIN`)
   - Warehouse: `DBT_WH` (or existing)
   - Database: `DEMO_DB` (writable)
   - Schema: `BRONZE` (default landing schema)

3. **Run order**:
   - Install deps: `dbt deps`
   - Bronze: `dbt run --select tag:bronze`
   - Silver: `dbt run --select tag:silver`
   - Gold:   `dbt run --select tag:gold`
   - Tests:  `dbt test`
   - (Optional) Snapshots: `dbt snapshot`

4. **Docs/Lineage**:
   - In dbt Cloud, generate docs and open the lineage graph to visualize the flow.
