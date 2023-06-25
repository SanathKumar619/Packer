
source "amazon-ebs" "u" {
  ami_name      = "Sanath"
  instance_type = "t2.micro"
  source_ami    = "ami-053b0d53c279acc90"
  ssh_username  = "ubuntu"


}

build {
  name = "u"
  sources = [
    "source.amazon-ebs.u"
  ]
}

