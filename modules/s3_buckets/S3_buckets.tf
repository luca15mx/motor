# Create a random id
resource "random_id" "tf_bucket_id" {
  byte_length = 2
  count       = 2
}
# Create the bucket
resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}-${random_id.tf_bucket_id.*.dec[count.index]}"
  acl           = "private"
  force_destroy = true
  count         = 2
  tags = {
    Name = "tf_bucket_MotorAclaraciones-${random_id.tf_bucket_id.*.dec[count.index]}"
  }
}
output "bucketname" {
  value = "${join(", ", aws_s3_bucket.tf_code.*.id)}"
}
