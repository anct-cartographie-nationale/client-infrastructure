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

resource "aws_s3_bucket_ownership_controls" "client_website_bucket_ownership" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.client.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "client_website_bucket_public_access" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.client.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "client_website_bucket_acl" {
  count  = var.enable_bucket_website ? 1 : 0
  depends_on = [
    aws_s3_bucket_ownership_controls.client_website_bucket_ownership,
    aws_s3_bucket_public_access_block.client_website_bucket_public_access,
  ]

  bucket = aws_s3_bucket.client.bucket
  acl    = "public-read"
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

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = [
      "${aws_s3_bucket.client.arn}/*",
    ]
  }
}
