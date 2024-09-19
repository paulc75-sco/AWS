data "aws_region" "current" {}

data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_units" "example" {
  parent_id = data.aws_organizations_organization.org
}

resource "aws_controltower_control" "controltower" {
  control_identifier = "arn:aws:controltower:${data.aws_region.current.name}::control/AWS-GR_EC2_VOLUME_INUSE_CHECK"
  target_identifier = [
    for x in data.aws_organizations_organizational_units.example.children :
    x.arn if x.name == "Infrastructure"
  ][0]

  parameters {
    key   = "AllowedRegions"
    value = jsonencode(["us-east-1"])
  }
}



