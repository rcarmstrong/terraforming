resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket-name}"

  versioning {
    enabled = "${var.versioning}"
  }
  # Will parameterize when https://github.com/hashicorp/terraform/issues/3116
  # is solved.
  lifecycle {
    prevent_destroy = true
  }
}