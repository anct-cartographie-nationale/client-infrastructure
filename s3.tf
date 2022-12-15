resource "aws_s3_bucket" "client" {
  bucket        = replace("${local.product_information.context.product}_${local.product_information.context.service}", "_", "-")
  force_destroy = true
  tags          = local.tags
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.client.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "client_website" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.client.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "allow_client_website_access_from_internet" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.client.id
  policy = data.aws_iam_policy_document.allow_client_website_access_from_internet.json
}

data "aws_iam_policy_document" "allow_client_website_access_from_internet" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.client.arn}/*",
    ]
  }
}
