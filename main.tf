#------------------------------------------------------------------------------
# AWS ECS Task Execution Role
#------------------------------------------------------------------------------
resource "aws_iam_role" "ecs_task_execution_role" {
  name                 = "${var.name_prefix}-ecs-task-execution-role"
  assume_role_policy   = file("${path.module}/files/iam/ecs_task_execution_iam_role.json")
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:${var.iam_partition}:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_policy" "ecs_task_execution_role_custom_policy" {
  count       = length(var.ecs_task_execution_role_custom_policies)
  name        = "${var.name_prefix}-ecs-task-execution-role-custom-policy-${count.index}"
  description = "A custom policy for ${var.name_prefix}-ecs-task-execution-role IAM Role"
  policy      = var.ecs_task_execution_role_custom_policies[count.index]
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_custom_policy" {
  count      = length(var.ecs_task_execution_role_custom_policies)
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_role_custom_policy[count.index].arn
}

#------------------------------------------------------------------------------
# ECS Task Definition
#------------------------------------------------------------------------------
# Container Definition
module "container_definition" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.58.2"

  command                      = var.command
  container_cpu                = var.container_cpu
  container_definition         = var.container_definition
  container_depends_on         = var.container_depends_on
  container_image              = var.container_image
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  container_name               = var.container_name
  disable_networking           = var.disable_networking
  dns_search_domains           = var.dns_search_domains
  dns_servers                  = var.dns_servers
  docker_labels                = var.docker_labels
  docker_security_options      = var.docker_security_options
  entrypoint                   = var.entrypoint
  environment                  = var.environment
  environment_files            = var.environment_files
  essential                    = var.essential
  extra_hosts                  = var.extra_hosts
  firelens_configuration       = var.firelens_configuration
  healthcheck                  = var.healthcheck
  hostname                     = var.hostname
  interactive                  = var.interactive
  links                        = var.links
  linux_parameters             = var.linux_parameters
  log_configuration            = var.log_configuration
  map_environment              = var.map_environment
  map_secrets                  = var.map_secrets
  mount_points                 = var.mount_points
  port_mappings                = var.port_mappings
  privileged                   = var.privileged
  pseudo_terminal              = var.pseudo_terminal
  readonly_root_filesystem     = var.readonly_root_filesystem
  repository_credentials       = var.repository_credentials
  resource_requirements        = var.resource_requirements
  secrets                      = var.secrets
  start_timeout                = var.start_timeout
  stop_timeout                 = var.stop_timeout
  system_controls              = var.system_controls
  ulimits                      = var.ulimits
  user                         = var.user
  volumes_from                 = var.volumes_from
  working_directory            = var.working_directory
}

# Task Definition
resource "aws_ecs_task_definition" "td" {
  container_definitions = length(var.containers) == 0 ? "[${module.container_definition.json_map_encoded}]" : jsonencode(var.containers)
  family                = var.name_prefix

  cpu                = var.container_cpu
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  ipc_mode           = var.ipc_mode
  memory             = var.container_memory
  network_mode       = "awsvpc" # awsvpc required for Fargate tasks

  runtime_platform {
    cpu_architecture        = var.runtime_platform_cpu_architecture
    operating_system_family = var.runtime_platform_operating_system_family
  }

  pid_mode = var.pid_mode

  dynamic "placement_constraints" {
    for_each = var.placement_constraints
    content {
      expression = lookup(placement_constraints.value, "expression", null)
      type       = placement_constraints.value.type
    }
  }

  dynamic "proxy_configuration" {
    for_each = var.proxy_configuration
    content {
      container_name = proxy_configuration.value.container_name
      properties     = lookup(proxy_configuration.value, "properties", null)
      type           = lookup(proxy_configuration.value, "type", null)
    }
  }

  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage_size == 0 ? [] : [var.ephemeral_storage_size]
    content {
      size_in_gib = var.ephemeral_storage_size
    }
  }

  requires_compatibilities = ["FARGATE"]
  skip_destroy             = var.skip_destroy
  task_role_arn            = var.task_role_arn == null ? aws_iam_role.ecs_task_execution_role.arn : var.task_role_arn

  dynamic "volume" {
    for_each = var.volumes
    content {
      name = volume.value.name

      host_path = lookup(volume.value, "host_path", null)

      dynamic "docker_volume_configuration" {
        for_each = lookup(volume.value, "docker_volume_configuration", [])
        content {
          autoprovision = lookup(docker_volume_configuration.value, "autoprovision", null)
          driver        = lookup(docker_volume_configuration.value, "driver", null)
          driver_opts   = lookup(docker_volume_configuration.value, "driver_opts", null)
          labels        = lookup(docker_volume_configuration.value, "labels", null)
          scope         = lookup(docker_volume_configuration.value, "scope", null)
        }
      }

      dynamic "efs_volume_configuration" {
        for_each = lookup(volume.value, "efs_volume_configuration", [])
        content {
          file_system_id          = lookup(efs_volume_configuration.value, "file_system_id", null)
          root_directory          = lookup(efs_volume_configuration.value, "root_directory", null)
          transit_encryption      = lookup(efs_volume_configuration.value, "transit_encryption", null)
          transit_encryption_port = lookup(efs_volume_configuration.value, "transit_encryption_port", null)
          dynamic "authorization_config" {
            for_each = lookup(efs_volume_configuration.value, "authorization_config", [])
            content {
              access_point_id = lookup(authorization_config.value, "access_point_id", null)
              iam             = lookup(authorization_config.value, "iam", null)
            }
          }
        }
      }
    }
  }

  tags = var.tags
}

# TODO - Add this missing parameter
# inference_accelerator - (Optional) Configuration block(s) with Inference Accelerators settings. Detailed below.
