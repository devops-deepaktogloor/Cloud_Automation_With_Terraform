module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "single-instance"
  
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name   = "Sample-Instance"
    Environment = "dev"
  }
}
