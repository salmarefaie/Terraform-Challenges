resource "aws_instance" "citadel" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = file("install-nginx.sh")
  key_name      = aws_key_pair.citadel-key.key_name
}