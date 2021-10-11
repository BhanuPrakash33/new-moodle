variable "AWS_REGION" {
  default = "ap-northeast-1"
}

variable "moodle-ami" {
  default = "ami-0009717ad07dffcc4"
}

variable "PATH_TO_PRIVATE_KEY" {
 default = "bhanu-key"
}

variable "PATH_TO_PUBLIC_KEY" {
 default = "bhanu-key.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-059d836af932792c3"
    us-west-2 = "ami-0a7d051a1c4b54f65"
    eu-west-1 = "ami-04c58523038d79132"
    ap-south-1 = "ami-04bde106886a53080"
    ap-northeast-1 = "ami-0fe22bffdec36361c"
  }
}

variable "db-password" {
  default = "moodle123"
}

