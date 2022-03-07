source "amazon-ebs" "clean" {
  type       = "amazon-ebs"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.aws_region
  vpc_id     = var.vpc
  subnet_id  = var.subnet
  source_ami_filter {
    filters {

      values = ["amzn-ami-hvm-*"]
    }
    owners      = ["amazon"]
    most_recent = true
  }
  instance_type = var.instance_type
  ssh_username  = "ubuntu"
  ami_name      = "clean-ami-${local.timestamp}"
}
data "aws_ami" "clean" {
  most_recent = true
  owners      = ["amazon"]
  region = "us-east-1"
  ssh_username = "ubuntu"
  communicator = "ssh"
  filter {
    name   = "name"
    values = [aws_ami_source.clean.ami_name]
  }
}
build {
  sources = ["source.amazon-ebs.clean"]

  provisioner "ansible" {
    playbook_file = "clean.yml"
  }
}
locals {
  timestamp = formatdate("YYYY-MM-DD-hh:mm", timestamp())
}