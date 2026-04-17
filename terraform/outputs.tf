output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.this.id
}

output "elastic_ip" {
  value = data.aws_eip.existing.public_ip
}
output "public_dns" {
  description = "Public IP address of EC2"
  value       = aws_instance.this.public_dns
}