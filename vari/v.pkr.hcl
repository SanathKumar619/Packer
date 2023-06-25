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
  default = "Sanath-ami"
}
source "amazon-ebs" "v" {

  ami_name      = var.name
  source_ami    = "ami-053b0d53c279acc90"
  region        = "us-east-1"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
}

build {

  sources = ["source.amazon-ebs.v"]
  provisioner "shell" {
    inline = [
      "echo hii",
      "sudo touch /hii.txt"

    ]
  }
  post-processors {
    post-processor "shell-local" {
      inline = ["echo completed"]
    }
  }
}
