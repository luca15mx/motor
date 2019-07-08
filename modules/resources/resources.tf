# # Define SSH key pair for our instances
# resource "aws_key_pair" "default" {
#   key_name   = "${var.project_name}-${var.ec2_keyname}"
#   public_key = file(var.key_path)
# }

# # TF-UPGRADE-TODO: Block type was not recognized, so this block and its contents were not automatically upgraded.
# #Define webserver inside the public subnet
# resource "aws_instance" "wb" {
#   ami                         = "${var.ami}"
#   instance_type               = "${var.ec2_instance_type}"
#   key_name                    = "${aws_key_pair.default.id}"
#   subnet_id                   = "${aws_subnet.public-subnet.id}"
#   vpc_security_group_ids      = ["${aws_security_group.sg_public.id}"]
#   associate_public_ip_address = true
#   source_dest_check           = false
#   user_data                   = "${file("install.sh")}"

#   tags = {
#     Name = "Motor Aclaraciones webserver"
#   }
# }

# output "wb_instance" {
#   value = "${aws_instance.wb.id}"
# }

# # TF-UPGRADE-TODO: Block type was not recognized, so this block and its contents were not automatically upgraded.
# #Define database inside the private subnet 
# resource "aws_instance" "db" {
#   ami                    = "${var.ami}"
#   instance_type          = "${var.ec2_instance_type}"
#   key_name               = "${aws_key_pair.default.id}"
#   subnet_id              = "${aws_subnet.private-subnet.id}"
#   vpc_security_group_ids = ["${aws_security_group.sg_private.id}"]
#   source_dest_check      = false

#   tags = {
#     Name = "Motor Aclaraciones database"
#   }
# }

# output "db_instance" {
#   value = "${aws_instance.db.id}"
# }
