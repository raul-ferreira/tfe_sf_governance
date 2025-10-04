# Give SYSADMIN USAGE on the database it owns
resource "snowflake_grant_privileges_to_account_role" "sysadmin_usage_on_db" {
  provider          = snowflake.sysadmin
  privileges        = ["USAGE"]
  account_role_name = "SYSADMIN"
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_db.name
  }
}

# Grant usage on the database
resource "snowflake_grant_privileges_to_account_role" "grant_usage_tf_db_to_tf_role" {
    provider          = snowflake
    privileges        = ["USAGE"]
    account_role_name = snowflake_account_role.tf_role.name
    on_account_object {
        object_type = "DATABASE"
        object_name = snowflake_database.tf_db.name
  }
}