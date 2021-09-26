variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "moodle_ami" {
  default = "ami-061365641a04e0318"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-059d836af932792c3"
    us-west-2 = "ami-0a7d051a1c4b54f65"
    eu-west-1 = "ami-04c58523038d79132"
    ap-south-1 = "ami-04bde106886a53080"
  }
}

variable "db-password" {
  default = "CloudThat123"
}
