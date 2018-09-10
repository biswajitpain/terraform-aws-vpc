module "vpc" {
  source    = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=master"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

module "dynamic_subnets" {
  source             = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=master"
  namespace          = "${var.namespace}"
  stage              = "${var.stage}"
  name               = "${var.name}"
  region             = "${var.region}"
  availability_zones = "${var.availability_zones}"
  vpc_id             = "${module.vpc.vpc_id}"
  igw_id             = "${module.vpc.igw_id}"
  cidr_block         = "10.0.0.0/16"
}
