resource "aws_elastic_beanstalk_configuration_template" "hubot-config" {
  name = "hubot-config-${var.environment}-default"
  application = "${aws_elastic_beanstalk_application.hubot.name}"
  solution_stack_name = "64bit Amazon Linux 2016.03 v2.1.3 running Docker 1.11.1"

  setting {
    namespace = ""
    name = "HUBOT_SLACK_TOKEN"
    value = "${var.hubot_slack_token}"
  }
}