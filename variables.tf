variable "bucket_name" {
  description = "The name of the bucket to store the Terraform state"
  type        = string
}

variable "region" {
  description = "The region to deploy infrastructure in"
  type        = string
}
