# ---------------------------------------------------------------------------------------------------------------------
# Misc
# ---------------------------------------------------------------------------------------------------------------------
variable "name_preffix" {
  description = "Name preffix for resources on AWS"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS CREDENTIALS AND REGION
# ---------------------------------------------------------------------------------------------------------------------
variable "profile" {
  description = "AWS API key credentials to use"
}

variable "region" {
  description = "AWS Region the infrastructure is hosted in"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS ECS Container Definition Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "container_port" {
  description = "Port on which the container is listening"
}

variable "container_image" {
  description = "The image used to start the container."
}

variable "container_name" {
  description = "The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, _ allowed)"
}

variable "command" {
  type        = list(string)
  description = "(Optional) The command that is passed to the container"
  default     = null
}

variable "container_cpu" {
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html#fargate-task-defs
  description = "(Optional) The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container_cpu of all containers in a task will need to be lower than the task-level cpu value"
  default     = 1024 # 1 vCPU 
}

variable "container_depends_on" {
  type        = list(string)
  description = "(Optional) The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed"
  default     = null
}

variable "container_memory" {
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html#fargate-task-defs
  description = "(Optional) The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container_memory of all containers in a task will need to be lower than the task memory value"
  default     = 8192 # 8 GB
}

variable "container_memory_reservation" {
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html#fargate-task-defs
  description = "(Optional) The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container_memory hard limit"
  default     = 2048 # 2 GB
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional) Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers"
  default     = null
}

variable "docker_labels" {
  type        = map(string)
  description = "(Optional) The configuration options to send to the `docker_labels`"
  default     = null
}

variable "entrypoint" {
  type        = list(string)
  description = "(Optional) The entry point that is passed to the container"
  default     = null
}

variable "environment" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "(Optional) The environment variables to pass to the container. This is a list of maps"
  default     = null
}

variable "essential" {
  type        = bool
  description = "(Optional) Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value"
  default     = true
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html
variable "firelens_configuration" {
  type = object({
    type    = string
    options = map(string)
  })
  description = "(Optional) The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html"
  default     = null
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html
variable "healthcheck" {
  type = object({
    command     = list(string)
    retries     = number
    timeout     = number
    interval    = number
    startPeriod = number
  })
  description = "(Optional) A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries)"
  default     = null
}

variable "links" {
  type        = list(string)
  description = "(Optional) List of container names this container can communicate with without port mappings"
  default     = null
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html
variable "log_configuration" {
  type = object({
    logDriver = string
    options   = map(string)
    secretOptions = list(object({
      name      = string
      valueFrom = string
    }))
  })
  description = "(Optional) Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html"
  default     = null
}

variable "mount_points" {
  type = list(object({
    containerPath = string
    sourceVolume  = string
  }))
  description = "(Optional) Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume`"
  default     = null
}

variable "port_mappings" {
    type = list(object({
        containerPort = number
        hostPort      = number
        protocol      = string
    }))
    description = "(Required) Container port mappings. This is a list of maps, where each map should contain a `containerPort`, `hostPort` and `protocol`"
    default     = null
}

variable "readonly_root_filesystem" {
  type        = bool
  description = "(Optional) Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value"
  default     = false
}

variable "repository_credentials" {
  type        = map(string)
  description = "(Optional) Container repository credentials; required when using a private repo.  This map currently supports a single key; \"credentialsParameter\", which should be the ARN of a Secrets Manager's secret holding the credentials"
  default     = null
}

variable "secrets" {
  type = list(object({
    name      = string
    valueFrom = string
  }))
  description = "(Optional) The secrets to pass to the container. This is a list of maps"
  default     = null
}

variable "start_timeout" {
  description = "(Optional) Time duration (in seconds) to wait before giving up on resolving dependencies for a container."
  default     = 30
}

variable "system_controls" {
  type        = list(map(string))
  description = "(Optional) A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = \"\", value = \"\"}"
  default     = null
}

variable "stop_timeout" {
  type        = number
  description = "(Optional) Timeout in seconds between sending SIGTERM and SIGKILL to container"
  default     = 30
}

variable "ulimits" {
  type = list(object({
    name      = string
    hardLimit = number
    softLimit = number
  }))
  description = "(Optional) Container ulimit settings. This is a list of maps, where each map should contain \"name\", \"hardLimit\" and \"softLimit\""
  default     = null
}

variable "user" {
  type        = string
  description = "(Optional) The user to run as inside the container. Can be any of these formats: user, user:group, uid, uid:gid, user:gid, uid:group"
  default     = null
}

variable "volumes_from" {
  type = list(object({
    sourceContainer = string
    readOnly        = bool
  }))
  description = "(Optional) A list of VolumesFrom maps which contain \"sourceContainer\" (name of the container that has the volumes to mount) and \"readOnly\" (whether the container can write to the volume)"
  default     = null
}

variable "working_directory" {
  type        = string
  description = "(Optional) The working directory to run commands inside the container"
  default     = null
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS ECS Task Definition Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "placement_constraints" {
  type        = list
  description = "(Optional) A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. This is a list of maps, where each map should contain \"type\" and \"expression\""
  default     = []
}

variable "proxy_configuration" {
  type        = list
  description = "(Optional) The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain \"container_name\", \"properties\" and \"type\""
  default     = []
}

