# Configure the MongoDB Atlas Provider
provider "mongodbatlas" {
  username = "${var.mongodb_atlas_username}"
  api_key  = "${var.mongodb_atlas_api_key}"
}

# Create a Group 
resource "mongodbatlas_project" "poc" {
  org_id = "${var.mongodb_atlas_org_id}"
  name   = "${var.mongodb_atlas_project_name}"
}

# Create a Group IP Whitelist
# resource "mongodbatlas_ip_whitelist" "test" {
#   group = "${mongodbatlas_project.test.id}"
#   cidr_block = "${var.whitelist_cidr_block}"
#   comment = "test"
# }

# Create a Container
resource "mongodbatlas_container" "vpc-poc-1" {
  group            = "${mongodbatlas_project.poc.id}"
  atlas_cidr_block = "${var.atlas_cidr_block}"
  provider_name    = "${var.provider_name}"
  region           = "${var.region}"
}

# Initiate a Peering connection
# resource "mongodbatlas_vpc_peering_connection" "test" {
#   group = "${mongodbatlas_project.test.id}"
#   aws_account_id = "${var.aws_account_id}"
#   vpc_id = "${var.vpc_id}"
#   route_table_cidr_block = "${var.vpc_cidr_block}"
#   container_id = "${mongodbatlas_container.test.id}"
# }

# Create a Cluster
resource "mongodbatlas_cluster" "poc-dev-1" {
  name                  = "${var.mongodbatlas_cluster_name}"
  group                 = "${mongodbatlas_project.poc.id}"
  mongodb_major_version = "${var.mongodbatlas_cluster_mongodb_major_version}"
  provider_name         = "${var.mongodbatlas_cluster_provider_name}"
  region                = "${var.mongodbatlas_cluster_region}"
  size                  = "${var.mongodbatlas_cluster_size}"
  backup                = "${var.mongodbatlas_cluster_backup}"
  disk_gb_enabled       = "${var.mongodbatlas_cluster_disk_gb_enabled}"
}

# Create a Database User
resource "mongodbatlas_database_user" "read-user" {
  username = "${var.database-user-username}"
  password = "${var.database-user-password}"
  database = "${var.authn-database-name}"
  group    = "${mongodbatlas_project.poc.id}"

  roles = [
    {
      name     = "${var.authn-database-role-name}"
      database = "${var.authn-database-name}"
    },
  ]
}
