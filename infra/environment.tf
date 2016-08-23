resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name = "default"
  application = "${aws_elastic_beanstalk_application.hubot.name}"
  solution_stack_name = "64bit Amazon Linux 2016.03 v2.1.3 running Docker 1.11.1"
}