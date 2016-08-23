resource "aws_elastic_beanstalk_application" "hubot" {
  name = "sam-hubot-${var.environment}"
  description = "Sam Hubot's integration"
}