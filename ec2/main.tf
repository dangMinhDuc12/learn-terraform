provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] //id AWS from organization maintain Ubuntu
}

resource "aws_instance" "hello" {
  count         = 2  // Create 2 EC2 instances
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
}

// synxtax for for <value> in <list> : <return value>
// format: a function of Terraform to format string

output "ec2" {
  value = { for i, v in aws_instance.hello : format("public_ip%d", i + 1) => v.public_ip }
}