resource "aws_s3_bucket" "S3demo-bucket" {
  bucket = "demo-bucket-deepak-togloor"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.S3demo-bucket.id
    source = "./../files/test-data.txt"
    key = "mydata-txt"
}