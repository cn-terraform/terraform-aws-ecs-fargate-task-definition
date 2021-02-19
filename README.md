# AWS ECS Fargate Task Definition Terraform Module #

This Terraform module creates an AWS ECS Fargate task definition.

[![](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition/workflows/terraform/badge.svg)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition/actions?query=workflow%3Aterraform)
[![](https://img.shields.io/github/license/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/issues/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/issues-closed/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/languages/code-size/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)
[![](https://img.shields.io/github/repo-size/cn-terraform/terraform-aws-ecs-fargate-task-definition)](https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition)

## Usage

Check versions for this module on:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ecs-fargate-task-definition/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ecs-fargate-task-definition/aws>

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| command | (Optional) The command that is passed to the container | `list(string)` | `null` | no |
| container\_cpu | (Optional) The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container\_cpu of all containers in a task will need to be lower than the task-level cpu value | `number` | `1024` | no |
| container\_depends\_on | (Optional) The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed | <pre>list(object({<br>    containerName = string<br>    condition     = string<br>  }))</pre> | `null` | no |
| container\_image | The image used to start the container. | `any` | n/a | yes |
| container\_memory | (Optional) The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container\_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container\_memory of all containers in a task will need to be lower than the task memory value | `number` | `8192` | no |
| container\_memory\_reservation | (Optional) The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container\_memory hard limit | `number` | `2048` | no |
| container\_name | The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, \_ allowed) | `any` | n/a | yes |
| dns\_servers | (Optional) Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers | `list(string)` | `null` | no |
| docker\_labels | (Optional) The configuration options to send to the `docker_labels` | `map(string)` | `null` | no |
| entrypoint | (Optional) The entry point that is passed to the container | `list(string)` | `null` | no |
| environment | (Optional) The environment variables to pass to the container. This is a list of maps | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| essential | (Optional) Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `true` | no |
| firelens\_configuration | (Optional) The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html | <pre>object({<br>    type    = string<br>    options = map(string)<br>  })</pre> | `null` | no |
| healthcheck | (Optional) A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries) | <pre>object({<br>    command     = list(string)<br>    retries     = number<br>    timeout     = number<br>    interval    = number<br>    startPeriod = number<br>  })</pre> | `null` | no |
| iam_partition | (Optional) IAM partition to use when referencing standard policies. GovCloud and some other regions use different partitions | `string` | `aws` | no |
| links | (Optional) List of container names this container can communicate with without port mappings | `list(string)` | `null` | no |
| linux\_parameters | Linux-specific modifications that are applied to the container, such as Linux kernel capabilities. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LinuxParameters.html | <pre>object({<br>    capabilities = object({<br>      add  = list(string)<br>      drop = list(string)<br>    })<br>    devices = list(object({<br>      containerPath = string<br>      hostPath      = string<br>      permissions   = list(string)<br>    }))<br>    initProcessEnabled = bool<br>    maxSwap            = number<br>    sharedMemorySize   = number<br>    swappiness         = number<br>    tmpfs = list(object({<br>      containerPath = string<br>      mountOptions  = list(string)<br>      size          = number<br>    }))<br>  })</pre> | `null` | no |
| log\_configuration | (Optional) Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html | <pre>object({<br>    logDriver = string<br>    options   = map(string)<br>    secretOptions = list(object({<br>      name      = string<br>      valueFrom = string<br>    }))<br>  })</pre> | `null` | no |
| mount\_points | (Optional) Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume` | <pre>list(object({<br>    containerPath = string<br>    sourceVolume  = string<br>  }))</pre> | `[]` | no |
| name\_prefix | Name prefix for resources on AWS | `any` | n/a | yes |
| placement\_constraints | (Optional) A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. This is a list of maps, where each map should contain "type" and "expression" | `list` | `[]` | no |
| port\_mappings | The port mappings to configure for the container. This is a list of maps. Each map should contain "containerPort", "hostPort", and "protocol", where "protocol" is one of "tcp" or "udp". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort | <pre>list(object({<br>    containerPort = number<br>    hostPort      = number<br>    protocol      = string<br>  }))</pre> | <pre>[<br>  {<br>    "containerPort": 80,<br>    "hostPort": 80,<br>    "protocol": "tcp"<br>  }<br>]</pre> | no |
| proxy\_configuration | (Optional) The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain "container\_name", "properties" and "type" | `list` | `[]` | no |
| readonly\_root\_filesystem | (Optional) Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `false` | no |
| repository\_credentials | (Optional) Container repository credentials; required when using a private repo.  This map currently supports a single key; "credentialsParameter", which should be the ARN of a Secrets Manager's secret holding the credentials | `map(string)` | `null` | no |
| secrets | (Optional) The secrets to pass to the container. This is a list of maps | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))</pre> | `null` | no |
| start\_timeout | (Optional) Time duration (in seconds) to wait before giving up on resolving dependencies for a container. | `number` | `30` | no |
| stop\_timeout | (Optional) Timeout in seconds between sending SIGTERM and SIGKILL to container | `number` | `30` | no |
| system\_controls | (Optional) A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = "", value = ""} | `list(map(string))` | `null` | no |
| task\_role\_arn | (Optional) The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. If not specified, `aws_iam_role.ecs_task_execution_role.arn` is used | `string` | `null` | no |
| ulimits | (Optional) Container ulimit settings. This is a list of maps, where each map should contain "name", "hardLimit" and "softLimit" | <pre>list(object({<br>    name      = string<br>    hardLimit = number<br>    softLimit = number<br>  }))</pre> | `null` | no |
| user | (Optional) The user to run as inside the container. Can be any of these formats: user, user:group, uid, uid:gid, user:gid, uid:group | `string` | `null` | no |
| volumes | (Optional) A set of volume blocks that containers in your task may use | <pre>list(object({<br>    host_path = string<br>    name      = string<br>    docker_volume_configuration = list(object({<br>      autoprovision = bool<br>      driver        = string<br>      driver_opts   = map(string)<br>      labels        = map(string)<br>      scope         = string<br>    }))<br>    efs_volume_configuration = list(object({<br>      file_system_id = string<br>      root_directory = string<br>    }))<br>  }))</pre> | `[]` | no |
| volumes\_from | (Optional) A list of VolumesFrom maps which contain "sourceContainer" (name of the container that has the volumes to mount) and "readOnly" (whether the container can write to the volume) | <pre>list(object({<br>    sourceContainer = string<br>    readOnly        = bool<br>  }))</pre> | `null` | no |
| working\_directory | (Optional) The working directory to run commands inside the container | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_ecs\_task\_definition\_td\_arn | Full ARN of the Task Definition (including both family and revision). |
| aws\_ecs\_task\_definition\_td\_family | The family of the Task Definition. |
| aws\_ecs\_task\_definition\_td\_revision | The revision of the task in a particular family. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_create\_date | The creation date of the IAM role. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_description | The description of the role. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_id | The ID of the role. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_name | The name of the role. |
| aws\_iam\_role\_ecs\_task\_execution\_role\_unique\_id | The stable and unique string identifying the role. |
| container\_name | Name of the container |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
