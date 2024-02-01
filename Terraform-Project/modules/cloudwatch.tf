provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxx" # Replace with your AMI ID
  instance_type = "t2.micro"

  //monitoring {
   // enabled = true
  //}

  tags = {
    Name = "example-instance"
  }
}

resource "aws_cloudwatch_metric_alarm" "example_metric_alarm" {
  alarm_name          = "example-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions = {
    InstanceId = aws_instance.example_instance.id
  }

  alarm_description = "This metric alarm is for demonstration purposes."
  alarm_actions     = ["arn:aws:sns:us-east-1:123456789012:example-topic"]
}
