resource "snowflake_database" "tf_db" {
  name         = "TF_DEMO_DB"
  is_transient = false
}