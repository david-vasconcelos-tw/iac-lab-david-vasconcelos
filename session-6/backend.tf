terraform {
  backend "s3" {
    bucket = "david-vasconcelos-iac-lab-tfstate"
    key    = "david-vasconcelos-iac-lab-tfstate/S3_key_/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "david-vasconcelos-iac-lab-tfstate-locks"
    encrypt        = true
  }
}
