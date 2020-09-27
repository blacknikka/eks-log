resource "aws_elasticsearch_domain" "app" {
  domain_name           = "elastic-search-${var.base_name}"
  elasticsearch_version = "7.7"

  cluster_config {
    instance_type = "t2.medium.elasticsearch"
  }

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  ebs_options {
      ebs_enabled = true
      volume_type = "gp2"
      volume_size  = 10
  }
}

# allow public access
resource "aws_elasticsearch_domain_policy" "app" {
  domain_name = aws_elasticsearch_domain.app.domain_name

  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {},
            "Resource": "${aws_elasticsearch_domain.app.arn}/*"
        }
    ]
}
POLICIES
}
