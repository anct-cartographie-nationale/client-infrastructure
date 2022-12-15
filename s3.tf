resource "aws_s3_bucket" "client" {
  bucket        = replace("${local.product_information.context.product}_${local.product_information.context.service}", "_", "-")
  force_destroy = true
  tags          = local.tags
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.client.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "example" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.client.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
