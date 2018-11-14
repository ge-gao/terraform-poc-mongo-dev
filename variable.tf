variable "mongodb_atlas_username" {default = ""}
variable "mongodb_atlas_api_key" {default = ""}
variable "mongodb_atlas_org_id" {default = ""}
variable "mongodb_atlas_project_name" {default = ""}
variable "aws_account_id" {default = ""}
variable "vpc_id" {default = ""}
variable "vpc_cidr_block" { default = "" }
variable "whitelist_cidr_block" { default = "" }
variable "atlas_cidr_block" { default = "" }
variable "provider_name" { default = "" }
variable "region" { default = "" }
variable "authn-database-name" {default = ""}
variable "authn-database-role-name" {default = ""}
variable "database-user-username" {default = ""}
variable "database-user-password" { default = "" }
variable "mongodbatlas_cluster_name" {default = ""}
variable "mongodbatlas_cluster_mongodb_major_version" {default = ""}
variable "mongodbatlas_cluster_provider_name" {default = ""}
variable "mongodbatlas_cluster_region" {default = ""}
variable "mongodbatlas_cluster_size" {default = ""}
variable "mongodbatlas_cluster_backup" {default = false}
variable "mongodbatlas_cluster_disk_gb_enabled" {default = false}