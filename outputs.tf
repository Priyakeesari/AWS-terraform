output "jenkins_instance_public_ip" {
  value = aws_instance.jenkins_instance.public_ip
}

output "java_app_instance_public_ip" {
  value = aws_instance.java_app_instance.public_ip
}
