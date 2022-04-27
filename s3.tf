resource "aws_s3_bucket" "client_driver" {
  bucket        = "${local.product_information.context.project}-${local.product_information.context.service}"
  acl           = "private"
  force_destroy = true
  tags          = local.tags
}
