terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

locals {
  organization_name = "xfxnbzh"
  account_name      = "nv18519"
  private_key_path  = "/Users/raulaveiro/.ssh/snowflake_tf_key.p8"
}




