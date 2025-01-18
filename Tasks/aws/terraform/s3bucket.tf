resource "random_id" "rand_id" {
    byte_length = 8
  
}

resource "aws_s3_bucket" "S3demo-bucket2" {
  bucket = "demo-bucket-deepak-togloor"
}

resource "aws_s3_object" "bucket-data2" {
    bucket = aws_s3_bucket.S3demo-bucket2.id
    source = "./../files/test-data.txt"
    key = "mydata-txt"
}

resource "aws_s3_bucket" "S3demo-bucket" {
  bucket = "demo-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.S3demo-bucket.id
    source = "./../files/test-data.txt"
    key = "mydata-txt"
}

output "name" {
    value = random_id.rand_id.hex
}