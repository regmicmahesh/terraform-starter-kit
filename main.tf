resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
  acl    = "private"
}


module "vpc" {
  source = "./modules/vpc"
}
