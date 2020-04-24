# AWS ECS Fargate Task Definition Terraform Module #

This Terraform module creates an AWS ECS Fargate task definition.

[![CircleCI](https://circleci.com/gh/cn-terraform/terraform-aws-ecs-fargate-task-definition/tree/master.svg?style=svg)](https://circleci.com/gh/cn-terraform/terraform-aws-ecs-fargate-task-definition/tree/master)
[![](https://img.shields.io/github/license/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/issues/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/issues-closed/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/languages/code-size/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/repo-size/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)

## Usage

Check versions for this module on:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-fargate-task-definition/aws>

        module "td" {
            source          = "cn-terraform/ecs-fargate-task-definition/aws"
            version         = "1.0.9"
            name_preffix    = var.name_preffix
            profile         = var.profile
            region          = var.region
            container_name  = "${var.name_preffix}-<NAME>"
            container_image = "<IMAGE_NAME>:<IMAGE_TAG>"
            container_port  = <PORT>
        }

## Input values

* container_port: Port on which the container is listening.
* container_image: The image used to start the container.
* container_name: The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, _ allowed).
* command: (Optional) The command that is passed to the container.
* container_cpu: (Optional) The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container_cpu of all containers in a task will need to be lower than the task-level cpu value.
* container_depends_on: (Optional) The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed.
* container_memory: (Optional) The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container_memory of all containers in a task will need to be lower than the task memory value.
* container_memory_reservation: (Optional) The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container_memory hard limit.
* dns_servers: (Optional) Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers.
* entrypoint: (Optional) The entry point that is passed to the container.
* environment: (Optional) The environment variables to pass to the container. This is a list of maps. Each map should contain `name` and `value`.
* essential: (Optional) Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value.
* healthcheck: (Optional) A map containing command (string), interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy, and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries).
* links: (Optional) List of container names this container can communicate with without port mappings.
* mount_points: (Optional) Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume`.
* readonly_root_filesystem: (Optional) Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value.
* repository_credentials: (Optional) Container repository credentials; required when using a private repo.  This map currently supports a single key; "credentialsParameter", which should be the ARN of a Secrets Manager's secret holding the credentials.
* secrets: (Optional) The secrets to pass to the container. This is a list of maps.
* start_timeout: (Optional) Time duration (in seconds) to wait before giving up on resolving dependencies for a container.
* stop_timeout: (Optional) Timeout in seconds between sending SIGTERM and SIGKILL to container.
* ulimits: (Optional) Container ulimit settings. This is a list of maps, where each map should contain "name", "hardLimit" and "softLimit".
* user: (Optional) The user to run as inside the container. Can be any of these formats:  user, user:group, uid, uid:gid, user:gid, uid:group.
* volumes_from: (Optional) A list of VolumesFrom maps which contain "sourceContainer" (name of the container that has the volumes to mount) and "readOnly" (whether the container can write to the volume).
* working_directory: (Optional) The working directory to run commands inside the container.
* placement_constraints: (Optional) A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. This is a list of maps, where each map should contain "type" and "expression".
* proxy_configuration: (Optional) The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain "container_name", "properties" and "type"
* system_controls: A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = \"\", value = \"\"}"
* firelens_configuration: The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html
* log_configuration: Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html

## Output values

* aws_iam_role_ecs_task_execution_role_arn - The Amazon Resource Name (ARN) specifying the role.
* aws_iam_role_ecs_task_execution_role_create_date - The creation date of the IAM role.
* aws_iam_role_ecs_task_execution_role_description - The description of the role.
* aws_iam_role_ecs_task_execution_role_id - The name of the role.
* aws_iam_role_ecs_task_execution_role_name - The name of the role.
* aws_iam_role_ecs_task_execution_role_unique_id - The stable and unique string identifying the role.
* aws_ecs_task_definition_td_arn - Full ARN of the Task Definition (including both family and revision).
* aws_ecs_task_definition_td_family - The family of the Task Definition.
* aws_ecs_task_definition_td_revision - The revision of the task in a particular family.
* container_port: Port on which the container is listening

