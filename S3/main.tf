resource "aws_s3_bucket" "s3" {
  #This resource creates the bucket
  bucket = var.bucketname

  tags = {
    Name             = var.bucketname
    Create_date_time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp())
  }

  lifecycle {
    ignore_changes = [
      tags["Create_date_time"],
    ]
  }

}

resource "aws_s3_bucket_versioning" "s3vers" {
  #This resource enables versioning
  bucket = aws_s3_bucket.s3.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_public_access_block" "s3pab" {
  #This resource blocks public access to the bucket
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_lifecycle_configuration" "s3lc" {
  #This resource creates the lifecycle for versioning and files
  bucket = aws_s3_bucket.s3.id

  rule {
    id = "Mr X Lifecyclepolicy"
    expiration {
      days = var.expires
    }

    filter {}

    transition {
      days          = var.standard_ia
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier
      storage_class = "GLACIER"
    }
    status = "Enabled"
  }

  rule {
    id = "Mr X Lifecyclepolicy for versioning"

    filter {
      prefix = "config/"
    }

    noncurrent_version_expiration {

      noncurrent_days = var.expires
    }


    noncurrent_version_transition {
      noncurrent_days = var.standard_ia
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = var.glacier
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.s3, aws_s3_bucket_versioning.s3vers]

}
