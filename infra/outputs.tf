output "beanstalk_application_id" {
  value = "${aws_elastic_beanstalk_application.hubot.id}"
}

output "beanstalk_application_name" {
  value = "${aws_elastic_beanstalk_application.hubot.name}"
}

output "beanstalk_configuration_id" {
  value = "${aws_elastic_beanstalk_configuration_template.hubot-config.id}"
}

output "beanstalk_configuration_name" {
  value = "${aws_elastic_beanstalk_configuration_template.hubot-config.name}"
}

