# terraform-aws-vpc

VPC module to create separated staging environment with two public subnets, as per [AWS guide](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html).

Originally created for ECS development.
256 IP adresses are available with this setup.

## Scope

This module provisions a VPC, an Internet Gateway, and **public-only** subnets spread across exactly **2 availability zones**. It does not create NAT gateways, private subnets, or NACLs. If you need private subnets or outbound-only internet access, this module is not the right fit.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0, < 7.0 |

## Example usage

```hcl
module "vpc_staging" {
  source  = "JakubBialoskorski/vpc/aws"
  version = "1.0.6"

  environment_name        = "staging"
  vpc_cidr                = "10.0.0.0/24"
  public_subnet_cidr_az_a = ["10.0.0.0/25"]
  public_subnet_cidr_az_b = ["10.0.0.128/25"]

  additional_tags = {
    YourTag = "whateverYouWant"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| environment\_name | Set environment name | `string` | `""` | no |
| vpc\_cidr | VPC CIDR | `string` | `"10.0.0.0/24"` | no |
| availability\_zone | Availability Zone. Must contain exactly 2 entries (one per public subnet group). | `list(string)` | `["us-east-1a", "us-east-1b"]` | no |
| public\_subnet\_cidr\_az\_a | Public subnet CIDR within AZ-a | `list(string)` | `["10.0.0.0/25"]` | no |
| public\_subnet\_cidr\_az\_b | Public subnet CIDR within AZ-b | `list(string)` | `["10.0.0.128/25"]` | no |
| public\_subnet\_interfix | Give interfix to public subnet name | `string` | `"public"` | no |
| additional\_tags | Variable for additional tags | `map(string)` | `{}` | no |
| default\_route | Default Route from and to the Internet | `string` | `"0.0.0.0/0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | ID of the created VPC |
| public\_subnet\_ids\_az\_a | IDs of the public subnets created in AZ-a |
| public\_subnet\_ids\_az\_b | IDs of the public subnets created in AZ-b |

## Upgrading from <= 1.0.4

As of `1.0.5`, the outputs `subnet_staging_public_a` / `subnet_staging_public_b` were renamed to `public_subnet_ids_az_a` / `public_subnet_ids_az_b`. Update any references before upgrading.
