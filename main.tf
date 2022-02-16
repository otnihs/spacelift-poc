resource "aws_s3_bucket" "mywebsite" {
bucket = "spacelift-demo-website"
tags = {
Name = "My website Bucket"
Environment = "Terraform"
}
}
resource "aws_s3_bucket_website_configuration" "mywebsite" {
  bucket = aws_s3_bucket.mywebsite.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_acl" "mywebsite" {
  bucket = aws_s3_bucket.mywebsite.id
  acl = "public-read"
}
resource "aws_s3_bucket_policy" "mywebsite" {
  bucket = aws_s3_bucket.mywebsite.id
  policy = file("policy.json")
}

resource "aws_s3_object" "index" {
bucket = aws_s3_bucket.mywebsite.id
acl = "public-read" # or can be "public-read"
key = "index.html"
source = "./index.html"
etag = filemd5("./index.html")
content_type = "text/html"
}
resource "aws_s3_object" "error" {
bucket = aws_s3_bucket.mywebsite.id
acl = "public-read" # or can be "public-read"
key = "error.html"
source = "./error.html"
etag = filemd5("./error.html")
content_type = "text/html"
}
resource "aws_s3_object" "image" {
bucket = aws_s3_bucket.mywebsite.id
acl = "public-read" # or can be "public-read"
key = "image.jpeg"
source = "./image.jpeg"
etag = filemd5("./image.jpeg")
}
resource "aws_s3_object" "error_image" {
bucket = aws_s3_bucket.mywebsite.id
acl = "public-read" # or can be "public-read"
key = "error.jpeg"
source = "./error.jpeg"
etag = filemd5("./error.jpeg")
}