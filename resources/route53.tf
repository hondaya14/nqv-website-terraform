
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "nqvno.net"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.nqv_website_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.nqv_website_s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}

data "aws_route53_zone" "zone" {
  name = "nqvno.net"
}
