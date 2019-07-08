provider "archive" {
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = var.lambda_source_filename
  output_path = var.lambda_zip_filename
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}

resource "aws_lambda_function" "lambda" {
  function_name    = "${var.lambda_function_name}"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "${var.lambda_function_name}.${var.lambda_handler}"
  runtime          = "${var.lambda_runtime}"

  environment {
    variables = {
      greeting = var.lambda_param
    }
  }
}

output "lambda" {
  value = aws_lambda_function.lambda.qualified_arn
}

