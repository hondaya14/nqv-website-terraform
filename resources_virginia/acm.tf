
data "aws_acm_certificate" "root" {
  domain = "nqvno.net"
}

data "aws_acm_certificate" "sub" {
  domain = "*.nqvno.net"
}
