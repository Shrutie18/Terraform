resource "aws_iam_user" "example_user" {
  name = var.user_name
}

resource "aws_iam_user_policy_attachment" "user_policy" {
  user       = aws_iam_user.example_user.name
  policy_arn = var.user_policy_arn
}

resource "aws_iam_group" "example_group" {
  name = var.group_name
}

resource "aws_iam_group_membership" "group_membership" {
  name  = "example-membership"  # Unique identifier for this group membership
  group = aws_iam_group.example_group.name
  users = [aws_iam_user.example_user.name]
}

resource "aws_iam_group_policy_attachment" "group_policy" {
  group      = aws_iam_group.example_group.name
  policy_arn = var.group_policy_arn
}
