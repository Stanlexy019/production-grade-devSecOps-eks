backend "s3" {
  bucket         = "aspire-three-tier-devsecops-tfstate-2026"
  key            = "dev/terraform.tfstate"
  region         = "eu-north-1"
  dynamodb_table = "three-tier-devsecops-tflock"
  encrypt        = true
}