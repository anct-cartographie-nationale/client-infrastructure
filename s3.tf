resource "aws_s3_bucket" "client_driver" {
  bucket        = "${local.product_information.context.project}-${local.product_information.context.service}"
  force_destroy = true
  tags          = local.tags
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.client_driver.id
  acl    = "private"
}
