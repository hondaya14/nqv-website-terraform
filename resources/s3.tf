
resource "aws_s3_bucket" "nqv_website_s3_bucket" {
  bucket = "${local.PROJECT_NAME}-bucket-${var.env}"
}

resource "aws_s3_bucket_policy" "nqv_website_allow_access_from_cloudfront_bucket_policy" {
  bucket = aws_s3_bucket.nqv_website_s3_bucket.id
  policy = data.aws_iam_policy_document.nqv_website_allow_access_from_cloudfront_policy_document.json
}

data "aws_iam_policy_document" "nqv_website_allow_access_from_cloudfront_policy_document" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.nqv_website_s3_bucket.arn,
      "${aws_s3_bucket.nqv_website_s3_bucket.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [aws_cloudfront_distribution.nqv_website_s3_distribution.arn]
    }
  }
}
