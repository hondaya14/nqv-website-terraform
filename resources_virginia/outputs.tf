output "root_acm_certificate_arn" {
  value = data.aws_acm_certificate.root.arn
}

output "sub_acm_certificate_arn" {
  value = data.aws_acm_certificate.sub.arn
}
