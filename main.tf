provider "aws" {
  region     = var.region
  skip_credentials_validation = true
  #access_key = var.access_key
  #secret_key = var.secret_key
}
resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
}
resource "aws_subnet" "web_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = aws_vpc.my_vpc.cidr_block
  
}
resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.web_subnet.id
 
 tags = {
     Name = "Chooocha web server"
 }
}
