resource "aws_s3_bucket" "backend_bucket" {
  bucket = format("%s-tfstate", var.prefix)

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = format("%s-tfstate", var.prefix)
  }
}

resource "aws_s3_bucket_versioning" "versioning_backend" {
  bucket = aws_s3_bucket.backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_encryption" {
  bucket = aws_s3_bucket.backend_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "backend_public_access" {
  bucket = aws_s3_bucket.backend_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}