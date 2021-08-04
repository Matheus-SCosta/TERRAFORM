data "aws_vpc" "selected" {
 filter {
   name   = "tag:Name"
   values = ["my_vpc_one"]
 }
}
