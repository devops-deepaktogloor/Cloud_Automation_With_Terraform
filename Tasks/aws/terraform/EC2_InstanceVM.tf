/*resource "aws_instance" "console" {
  ami           = "ami-04b4f1a9cf54c11d0" # us-east-2
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "aws-key"
  vpc_security_group_ids = ["sg-0e31938198780cea8"]
  tags = {
    key_name = "EC2InstanceTerraform"
  }
}*/