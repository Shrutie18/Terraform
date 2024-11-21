resource "aws_security_group" "this" {
  name        = var.sg_name
  vpc_id      = var.vpc_id
  description = "Security group for EC2 instance"

  dynamic "ingress" {
    for_each = var.sg_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

output "security_group_id" {
  value = aws_security_group.this.id
}
