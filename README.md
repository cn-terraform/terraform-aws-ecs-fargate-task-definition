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

## Install pre commit hooks.

Pleas run this command right after cloning the repository.

        pre-commit install

For that you may need to install the folowwing tools:
* [Pre-commit](https://pre-commit.com/) 
* [Terraform Docs](https://terraform-docs.io/)

In order to run all checks at any point run the following command:

        pre-commit run --all-files

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container_definition"></a> [container\_definition](#module\_container\_definition) | cloudposse/ecs-container-definition/aws | 0.58.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.td](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ecs_task_execution_role_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_command"></a> [command](#input\_command) | The command that is passed to the container | `list(string)` | `null` | no |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | (Optional) The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container\_cpu of all containers in a task will need to be lower than the task-level cpu value | `number` | `1024` | no |
| <a name="input_container_definition"></a> [container\_definition](#input\_container\_definition) | Container definition overrides which allows for extra keys or overriding existing keys. | `map(any)` | `{}` | no |
| <a name="input_container_depends_on"></a> [container\_depends\_on](#input\_container\_depends\_on) | The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed. The condition can be one of START, COMPLETE, SUCCESS or HEALTHY | <pre>list(object({<br>    containerName = string<br>    condition     = string<br>  }))</pre> | `[]` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | The image used to start the container. Images in the Docker Hub registry available by default | `string` | `null` | no |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | (Optional) The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container\_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container\_memory of all containers in a task will need to be lower than the task memory value | `number` | `4096` | no |
| <a name="input_container_memory_reservation"></a> [container\_memory\_reservation](#input\_container\_memory\_reservation) | (Optional) The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container\_memory hard limit | `number` | `2048` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, \_ allowed) | `string` | `null` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | Container definitions to use for the task. If this is used, all other container options will be ignored. | `list(any)` | `[]` | no |
| <a name="input_disable_networking"></a> [disable\_networking](#input\_disable\_networking) | When this parameter is true, networking is disabled within the container. | `bool` | `null` | no |
| <a name="input_dns_search_domains"></a> [dns\_search\_domains](#input\_dns\_search\_domains) | Container DNS search domains. A list of DNS search domains that are presented to the container | `list(string)` | `[]` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers | `list(string)` | `[]` | no |
| <a name="input_docker_labels"></a> [docker\_labels](#input\_docker\_labels) | The configuration options to send to the `docker_labels` | `map(string)` | `null` | no |
| <a name="input_docker_security_options"></a> [docker\_security\_options](#input\_docker\_security\_options) | A list of strings to provide custom labels for SELinux and AppArmor multi-level security systems. | `list(string)` | `[]` | no |
| <a name="input_ecs_task_execution_role_custom_policies"></a> [ecs\_task\_execution\_role\_custom\_policies](#input\_ecs\_task\_execution\_role\_custom\_policies) | (Optional) Custom policies to attach to the ECS task execution role. For example for reading secrets from AWS Systems Manager Parameter Store or Secrets Manager | `list(string)` | `[]` | no |
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | The entry point that is passed to the container | `list(string)` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to pass to the container. This is a list of maps. map\_environment overrides environment | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_environment_files"></a> [environment\_files](#input\_environment\_files) | One or more files containing the environment variables to pass to the container. This maps to the --env-file option to docker run. The file must be hosted in Amazon S3. This option is only available to tasks using the EC2 launch type. This is a list of maps | <pre>list(object({<br>    value = string<br>    type  = string<br>  }))</pre> | `[]` | no |
| <a name="input_ephemeral_storage_size"></a> [ephemeral\_storage\_size](#input\_ephemeral\_storage\_size) | The number of GBs to provision for ephemeral storage on Fargate tasks. Must be greater than or equal to 21 and less than or equal to 200 | `number` | `0` | no |
| <a name="input_essential"></a> [essential](#input\_essential) | Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `true` | no |
| <a name="input_extra_hosts"></a> [extra\_hosts](#input\_extra\_hosts) | A list of hostnames and IP address mappings to append to the /etc/hosts file on the container. This is a list of maps | <pre>list(object({<br>    ipAddress = string<br>    hostname  = string<br>  }))</pre> | `null` | no |
| <a name="input_firelens_configuration"></a> [firelens\_configuration](#input\_firelens\_configuration) | The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html | <pre>object({<br>    type    = string<br>    options = map(string)<br>  })</pre> | `null` | no |
| <a name="input_healthcheck"></a> [healthcheck](#input\_healthcheck) | (Optional) A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries) | <pre>object({<br>    command     = list(string)<br>    retries     = number<br>    timeout     = number<br>    interval    = number<br>    startPeriod = number<br>  })</pre> | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname to use for your container. | `string` | `null` | no |
| <a name="input_iam_partition"></a> [iam\_partition](#input\_iam\_partition) | IAM partition to use when referencing standard policies. GovCloud and some other regions use different partitions | `string` | `"aws"` | no |
| <a name="input_interactive"></a> [interactive](#input\_interactive) | When this parameter is true, this allows you to deploy containerized applications that require stdin or a tty to be allocated. | `bool` | `null` | no |
| <a name="input_ipc_mode"></a> [ipc\_mode](#input\_ipc\_mode) | (Optional) IPC resource namespace to be used for the containers in the task The valid values are host, task, and none. | `string` | `null` | no |
| <a name="input_links"></a> [links](#input\_links) | List of container names this container can communicate with without port mappings | `list(string)` | `[]` | no |
| <a name="input_linux_parameters"></a> [linux\_parameters](#input\_linux\_parameters) | Linux-specific modifications that are applied to the container, such as Linux kernel capabilities. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LinuxParameters.html | <pre>object({<br>    capabilities = object({<br>      add  = list(string)<br>      drop = list(string)<br>    })<br>    devices = list(object({<br>      containerPath = string<br>      hostPath      = string<br>      permissions   = list(string)<br>    }))<br>    initProcessEnabled = bool<br>    maxSwap            = number<br>    sharedMemorySize   = number<br>    swappiness         = number<br>    tmpfs = list(object({<br>      containerPath = string<br>      mountOptions  = list(string)<br>      size          = number<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_log_configuration"></a> [log\_configuration](#input\_log\_configuration) | Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html | `any` | `null` | no |
| <a name="input_map_environment"></a> [map\_environment](#input\_map\_environment) | The environment variables to pass to the container. This is a map of string: {key: value}. map\_environment overrides environment | `map(string)` | `null` | no |
| <a name="input_map_secrets"></a> [map\_secrets](#input\_map\_secrets) | The secrets variables to pass to the container. This is a map of string: {key: value}. map\_secrets overrides secrets | `map(string)` | `null` | no |
| <a name="input_mount_points"></a> [mount\_points](#input\_mount\_points) | Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume`. The `readOnly` key is optional. | `list(any)` | `[]` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for resources on AWS | `any` | n/a | yes |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | (Optional) The ARN of the policy that is used to set the permissions boundary for the `ecs_task_execution_role` role. | `string` | `null` | no |
| <a name="input_pid_mode"></a> [pid\_mode](#input\_pid\_mode) | (Optional) Process namespace to use for the containers in the task. The valid values are host and task | `string` | `null` | no |
| <a name="input_placement_constraints"></a> [placement\_constraints](#input\_placement\_constraints) | (Optional) A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. | <pre>list(object({<br>    expression = string # Cluster Query Language expression to apply to the constraint. For more information, see Cluster Query Language in the Amazon EC2 Container Service Developer Guide.<br>    type       = string # Type of constraint. Use memberOf to restrict selection to a group of valid candidates. Note that distinctInstance is not supported in task definitions.<br>  }))</pre> | `[]` | no |
| <a name="input_port_mappings"></a> [port\_mappings](#input\_port\_mappings) | The port mappings to configure for the container. This is a list of maps. Each map should contain "containerPort", "hostPort", and "protocol", where "protocol" is one of "tcp" or "udp". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort | <pre>list(object({<br>    containerPort = number<br>    hostPort      = number<br>    protocol      = string<br>  }))</pre> | <pre>[<br>  {<br>    "containerPort": 80,<br>    "hostPort": 80,<br>    "protocol": "tcp"<br>  }<br>]</pre> | no |
| <a name="input_privileged"></a> [privileged](#input\_privileged) | When this variable is `true`, the container is given elevated privileges on the host container instance (similar to the root user). This parameter is not supported for Windows containers or tasks using the Fargate launch type. | `bool` | `null` | no |
| <a name="input_proxy_configuration"></a> [proxy\_configuration](#input\_proxy\_configuration) | (Optional) The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain "container\_name", "properties" and "type" | <pre>list(object({<br>    container_name = string    # Name of the container that will serve as the App Mesh proxy.<br>    properties = list(object({ # Set of network configuration parameters to provide the Container Network Interface (CNI) plugin, specified a key-value mapping.<br>      name  = string<br>      value = string<br>    }))<br>    type = string # Proxy type. The default value is APPMESH. The only supported value is APPMESH.<br>  }))</pre> | `[]` | no |
| <a name="input_pseudo_terminal"></a> [pseudo\_terminal](#input\_pseudo\_terminal) | When this parameter is true, a TTY is allocated. | `bool` | `null` | no |
| <a name="input_readonly_root_filesystem"></a> [readonly\_root\_filesystem](#input\_readonly\_root\_filesystem) | Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `false` | no |
| <a name="input_repository_credentials"></a> [repository\_credentials](#input\_repository\_credentials) | Container repository credentials; required when using a private repo.  This map currently supports a single key; "credentialsParameter", which should be the ARN of a Secrets Manager's secret holding the credentials | `map(string)` | `null` | no |
| <a name="input_resource_requirements"></a> [resource\_requirements](#input\_resource\_requirements) | The type and amount of a resource to assign to a container. The only supported resource is a GPU. | <pre>list(object({<br>    type  = string<br>    value = string<br>  }))</pre> | `null` | no |
| <a name="input_runtime_platform_cpu_architecture"></a> [runtime\_platform\_cpu\_architecture](#input\_runtime\_platform\_cpu\_architecture) | Must be set to either X86\_64 or ARM64 | `string` | `"X86_64"` | no |
| <a name="input_runtime_platform_operating_system_family"></a> [runtime\_platform\_operating\_system\_family](#input\_runtime\_platform\_operating\_system\_family) | If the requires\_compatibilities is FARGATE this field is required. The valid values for Amazon ECS tasks that are hosted on Fargate are LINUX, WINDOWS\_SERVER\_2019\_FULL, WINDOWS\_SERVER\_2019\_CORE, WINDOWS\_SERVER\_2022\_FULL, and WINDOWS\_SERVER\_2022\_CORE. | `string` | `"LINUX"` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | The secrets to pass to the container. This is a list of maps | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))</pre> | `[]` | no |
| <a name="input_skip_destroy"></a> [skip\_destroy](#input\_skip\_destroy) | (Optional) Whether to retain the old revision when the resource is destroyed or replacement is necessary. Default is false. | `bool` | `false` | no |
| <a name="input_start_timeout"></a> [start\_timeout](#input\_start\_timeout) | Time duration (in seconds) to wait before giving up on resolving dependencies for a container | `number` | `null` | no |
| <a name="input_stop_timeout"></a> [stop\_timeout](#input\_stop\_timeout) | Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own | `number` | `null` | no |
| <a name="input_system_controls"></a> [system\_controls](#input\_system\_controls) | A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = "", value = ""} | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)` | `{}` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | (Optional) The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. If not specified, `aws_iam_role.ecs_task_execution_role.arn` is used | `string` | `null` | no |
| <a name="input_ulimits"></a> [ulimits](#input\_ulimits) | Container ulimit settings. This is a list of maps, where each map should contain "name", "hardLimit" and "softLimit" | <pre>list(object({<br>    name      = string<br>    hardLimit = number<br>    softLimit = number<br>  }))</pre> | `null` | no |
| <a name="input_user"></a> [user](#input\_user) | The user to run as inside the container. Can be any of these formats: user, user:group, uid, uid:gid, user:gid, uid:group. The default (null) will use the container's configured `USER` directive or root if not set. | `string` | `null` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | (Optional) A set of volume blocks that containers in your task may use | <pre>list(object({<br>    host_path = string<br>    name      = string<br>    docker_volume_configuration = list(object({<br>      autoprovision = bool<br>      driver        = string<br>      driver_opts   = map(string)<br>      labels        = map(string)<br>      scope         = string<br>    }))<br>    efs_volume_configuration = list(object({<br>      file_system_id          = string<br>      root_directory          = string<br>      transit_encryption      = string<br>      transit_encryption_port = string<br>      authorization_config = list(object({<br>        access_point_id = string<br>        iam             = string<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_volumes_from"></a> [volumes\_from](#input\_volumes\_from) | A list of VolumesFrom maps which contain "sourceContainer" (name of the container that has the volumes to mount) and "readOnly" (whether the container can write to the volume) | <pre>list(object({<br>    sourceContainer = string<br>    readOnly        = bool<br>  }))</pre> | `[]` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The working directory to run commands inside the container | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ecs_task_definition_td_arn"></a> [aws\_ecs\_task\_definition\_td\_arn](#output\_aws\_ecs\_task\_definition\_td\_arn) | Full ARN of the Task Definition (including both family and revision). |
| <a name="output_aws_ecs_task_definition_td_family"></a> [aws\_ecs\_task\_definition\_td\_family](#output\_aws\_ecs\_task\_definition\_td\_family) | The family of the Task Definition. |
| <a name="output_aws_ecs_task_definition_td_revision"></a> [aws\_ecs\_task\_definition\_td\_revision](#output\_aws\_ecs\_task\_definition\_td\_revision) | The revision of the task in a particular family. |
| <a name="output_aws_iam_role_ecs_task_execution_role_arn"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_arn](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_aws_iam_role_ecs_task_execution_role_create_date"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_create\_date](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_create\_date) | The creation date of the IAM role. |
| <a name="output_aws_iam_role_ecs_task_execution_role_description"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_description](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_description) | The description of the role. |
| <a name="output_aws_iam_role_ecs_task_execution_role_id"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_id](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_id) | The ID of the role. |
| <a name="output_aws_iam_role_ecs_task_execution_role_name"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_name](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_name) | The name of the role. |
| <a name="output_aws_iam_role_ecs_task_execution_role_unique_id"></a> [aws\_iam\_role\_ecs\_task\_execution\_role\_unique\_id](#output\_aws\_iam\_role\_ecs\_task\_execution\_role\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | Name of the container |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
