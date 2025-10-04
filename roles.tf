# Create a new role using USERADMIN
resource "snowflake_account_role" "tf_role" {
    provider          = snowflake.useradmin
    name              = "TF_DEMO_ROLE"
    comment           = "My Terraform role"
}

# Create a key for the new user
resource "tls_private_key" "svc_key" {
    algorithm = "RSA"
    rsa_bits  = 2048
}

# Create a new user
resource "snowflake_user" "tf_user" {
    provider          = snowflake.useradmin
    name              = "TF_DEMO_USER"
    default_warehouse = snowflake_warehouse.tf_warehouse.name
    default_role      = snowflake_account_role.tf_role.name
    default_namespace = "${snowflake_database.tf_db.name}.${snowflake_schema.tf_db_tf_schema.fully_qualified_name}"
    rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
}
