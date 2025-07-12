resource "aws_s3_bucket" "paint-site" {
    bucket = "paint-websocket-bucket"
}

resource "aws_s3_bucket_public_access_block" "paint_site" {
    bucket = aws_s3_bucket.paint-site.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "paint-site" {
    bucket = aws_s3_bucket.paint-site.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "index.html"
    }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.paint-site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = "*"
      Action = ["s3:GetObject"]
      Resource = ["${aws_s3_bucket.paint-site.arn}/*"]
    }]
  })
}