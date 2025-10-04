# Give SYSADMIN USAGE on the schema it operates in
resource "snowflake_grant_privileges_to_account_role" "sysadmin_usage_on_schema" {
  provider          = snowflake.sysadmin
  privileges        = ["USAGE"]
  account_role_name = "SYSADMIN"
  on_schema {
    schema_name = snowflake_schema.tf_db_tf_schema.fully_qualified_name
  }
}

# Grant usage on the schema
resource "snowflake_grant_privileges_to_account_role" "grant_usage_tf_db_tf_schema_to_tf_role" {
    provider          = snowflake.sysadmin
    privileges        = ["USAGE"]
    account_role_name = snowflake_account_role.tf_role.name
    on_schema {
        schema_name = snowflake_schema.tf_db_tf_schema.fully_qualified_name
  }
}


# Grant select on all tables in the schema (even if the schema is empty)
resource "snowflake_grant_privileges_to_account_role" "grant_all_tables" {
    provider          = snowflake.sysadmin
    privileges        = ["SELECT"]
    account_role_name = snowflake_account_role.tf_role.name
    on_schema_object {
        all {
            object_type_plural = "TABLES"
            in_schema          = snowflake_schema.tf_db_tf_schema.fully_qualified_name
    }
  }
}

# Grant select on the future tables in the schema
resource "snowflake_grant_privileges_to_account_role" "grant_future_tables" {
    provider          = snowflake
    privileges        = ["SELECT"]
    account_role_name = snowflake_account_role.tf_role.name
    on_schema_object {
        future {
            object_type_plural = "TABLES"
            in_schema          = snowflake_schema.tf_db_tf_schema.fully_qualified_name
    }
  }
}