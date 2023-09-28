variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
    default = "gio-key-pair"
    description = "AWS key pair name"
} 

variable "instance_type" {
  default = "t2.micro"
}

variable "rstudio_license_key" {
    default = "1234567890"
  description = "RStudio Connect License Key"
}

variable "admin_email" {
    default = "admin@admin.com"
  description = "Admin Email for RStudio Connect"
}
