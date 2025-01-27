module "vpc" {
  source = "./vpc"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    Name       = "my-test-vpc"
  }
  subnet_config = {
    public_subnet = {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "us-east-1a"
      public            = true
    }
    private_subnet = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1b"
    }
  }
}

