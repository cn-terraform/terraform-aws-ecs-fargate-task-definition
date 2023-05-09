#------------------------------------------------------------------------------
# AWS ECS Task Execution Role
#------------------------------------------------------------------------------
output "aws_iam_role_ecs_task_execution_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].arn : var.execution_role_arn
}

output "aws_iam_role_ecs_task_execution_role_create_date" {
  description = "The creation date of the IAM role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].create_date : null
}

output "aws_iam_role_ecs_task_execution_role_description" {
  description = "The description of the role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].description : null
}

output "aws_iam_role_ecs_task_execution_role_id" {
  description = "The ID of the role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].id : null
}

output "aws_iam_role_ecs_task_execution_role_name" {
  description = "The name of the role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].name : null
}

output "aws_iam_role_ecs_task_execution_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = var.execution_role_arn == null ? aws_iam_role.ecs_task_execution_role[0].unique_id : null
}

#------------------------------------------------------------------------------
# ECS Task Definition
#------------------------------------------------------------------------------
output "aws_ecs_task_definition_td_arn" {
  description = "Full ARN of the Task Definition (including both family and revision)."
  value       = aws_ecs_task_definition.td.arn
}

output "aws_ecs_task_definition_td_family" {
  description = "The family of the Task Definition."
  value       = aws_ecs_task_definition.td.family
}

output "aws_ecs_task_definition_td_revision" {
  description = "The revision of the task in a particular family."
  value       = aws_ecs_task_definition.td.revision
}
output "container_name" {
  description = "Name of the container"
  value       = var.container_name
}
