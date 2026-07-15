
output "alb_controller_role_arn" {
  value = aws_iam_role.alb_controller_role.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}