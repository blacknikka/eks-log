resource "aws_iam_role" "for_cloudwatch" {
  name = "cloudwatch_for_es"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

data "template_file" "es_policy" {
  template = file("${path.module}/policy.json.tpl")

  vars = {
    resource = "${aws_elasticsearch_domain.app.arn}/*"
  }
}

resource "aws_iam_policy" "lamda_for_es" {
  name        = "AllowToAccessES"
  description = "Allow to access for ES"

  policy = data.template_file.es_policy.rendered
}

resource "aws_iam_role_policy_attachment" "cloudwatch_cs" {
  role       = aws_iam_role.for_cloudwatch.name
  policy_arn = aws_iam_policy.lamda_for_es.arn
}
