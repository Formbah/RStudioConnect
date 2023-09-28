provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "rstudio_instance" {
  ami           = "ami-00c6177f250e07ec1"
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = "rstudio-connect"
  }
}

resource "aws_security_group" "rstudio_security_group" {
  name        = "rstudio-connect-sg"
  description = "Security group for RStudio Connect"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}