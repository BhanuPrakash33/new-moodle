resource "aws_key_pair" "bhanu-keypair" {
 key_name = "bhanu-keypair"
 public_key = file(var.PATH_TO_PUBLIC_KEY)
}

