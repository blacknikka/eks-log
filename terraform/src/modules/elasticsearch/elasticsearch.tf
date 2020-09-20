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
