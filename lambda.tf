# data "archive_file" "lambda_zip" {
#     type          = "zip"
#     source_file   = "${var.lambda_source_filename}"
#     output_path   = "${var.lambda_zip_filename}"
# }
# resource "aws_lambda_function" "lambda_function" {
#   role             = "${aws_iam_role.lambda_exec_role.arn}"
#   handler          = "${var.handler}"
#   runtime          = "${var.runtime}"
#   filename         = "${var.lambda_zip_filename}"
#   function_name    = "${var.function_name}"
#   #source_code_hash = "${base64sha256(file("${var.lambda_zip_filename}"))}"
#   source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
# }
# resource "aws_iam_role" "lambda_exec_role" {
#   name        = "lambda_exec"
#   path        = "/"
#   description = "Allows Lambda Function to call AWS services on your behalf."
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }
