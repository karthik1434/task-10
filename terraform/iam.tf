# Data block to reference the existing ECS Execution Role
data "aws_iam_role" "ecs_execution_role" {
  name = "ecsTaskExecutionRole"  # Name of the existing ECS execution role
}

# Data block to reference the existing CodeDeploy Role
data "aws_iam_role" "codedeploy_role" {
  name = "CodeDeployRole"  # Name of the existing CodeDeploy role
}