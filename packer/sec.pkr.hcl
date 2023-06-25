
source "amazon-ebs" "r" {
  ami_name      = "Sannu"
  instance_type = "t2.micro"
  source_ami    = "ami-053b0d53c279acc90"
  ssh_username  = "ubuntu"


}

build {
  name = "i"
  sources = [
    "source.amazon-ebs.r"
  ]
}

