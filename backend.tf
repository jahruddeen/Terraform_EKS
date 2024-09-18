terraform {
  backend "s3" {
    bucket         = "Gurgaon-s3-bucket-Quess"
    key            = "Jenkins/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "Gurgaon-dynamodb-lock-table"  # Optional: For state locking and consistency
  }
}
