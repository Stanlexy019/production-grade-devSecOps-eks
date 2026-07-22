resource "aws_iam_policy" "external_secrets" {
  name        = "${var.project_name}-external-secrets-policy"
  description = "Allows External Secrets Operator to read the MongoDB Atlas secret"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]

        Resource = var.mongodb_secret_arn
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-external-secrets-policy"
  }
}