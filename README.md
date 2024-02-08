# vpc-module

VPC module to create separated staging environment with two public subnets, as per [AWS guide](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html).

Originally created for ECS development.
256 IP adresses are available with this setup.

To use it:

```
module "vpc_staging" {
  source = "jakubbialoskorski/terraform-aws-vpc"

  environment_name        = "staging"
  vpc_cidr                = "10.0.0.0/24"
  public_subnet_cidr_az_a = ["10.0.0.0/25"]
  public_subnet_cidr_az_b = ["10.0.0.128/25"]

  additional_tags = {
    Environment = "staging"
    Terraform   = "yes"
    YourTag     = "whateverYouWant"
  }
}
```