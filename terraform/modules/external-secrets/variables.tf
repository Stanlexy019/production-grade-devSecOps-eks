variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "mongodb_secret_arn" {
  description = "ARN of the MongoDB Atlas secret stored in AWS Secrets Manager"
  type        = string
}

variable "oidc_issuer_url" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}