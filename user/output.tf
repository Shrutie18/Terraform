output "user_arn" {
  description = "The ARN of the created IAM user"
  value       = aws_iam_user.example_user.arn
}

output "group_arn" {
  description = "The ARN of the created IAM group"
  value       = aws_iam_group.example_group.arn
}

output "user_policy_attachment" {
  description = "Policy attached to the IAM user"
  value       = var.user_policy_arn
}

output "group_policy_attachment" {
  description = "Policy attached to the IAM group"
  value       = var.group_policy_arn
}
