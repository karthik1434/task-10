##############################
# Reference Existing ECS Execution Role
##############################

data "aws_iam_role" "ecs_execution_role" {
  name = "${var.app_name}-ecs-execution-role"
}

data "aws_iam_policy" "ecs_execution_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_execution" {
  role       = data.aws_iam_role.ecs_execution_role.name
  policy_arn = data.aws_iam_policy.ecs_execution_policy.arn
}

resource "aws_iam_role_policy" "ecs_execution_logs" {
  name = "ecs-execution-logs-policy"
  role = data.aws_iam_role.ecs_execution_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:log-group:/ecs/strapi-app-karthik:*"
      }
    ]
  })
}

##############################
# Reference Existing CodeDeploy Role
##############################

data "aws_iam_policy_document" "codedeploy_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codedeploy_role" {
  name               = "${var.app_name}-codedeploy-role"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_assume.json
}
