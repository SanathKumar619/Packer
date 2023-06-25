packer {
  required_plugins {
    amazon = {
      version = ">=1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "name" {
  type    = string
  default = "Sannu"
}
variable "sg" {
  type    = list(string)
  default = ["sg-08d30f4184fa5b0ed"]
}

source "amazon-ebs" "sanath" {
  ami_name           = var.name
  instance_type      = "t2.micro"
  source_ami         = "ami-053b0d53c279acc90"
  region             = "us-east-1"
  ssh_username       = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.sanath"]
  provisioner "file" {
    source      = "../../data/2135_mini_finance.zip"
    destination = "/tmp/2135_mini_finance.zip"
  }
  provisioner "file" {
    source      = "./rama.txt"
    destination = "/tmp/rama.txt"
  }

  provisioner "shell" {
    script = "./script.sh"
  }
}
