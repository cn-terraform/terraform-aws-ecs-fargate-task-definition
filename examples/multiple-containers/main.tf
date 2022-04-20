module "container-definition-1" {
  source          = "cloudposse/ecs-container-definition/aws"
  version         = "0.58.1"
  container_name  = "container-1"
  container_image = "ubuntu-1"
}

module "container-definition-2" {
  source          = "cloudposse/ecs-container-definition/aws"
  version         = "0.58.1"
  container_name  = "container-2"
  container_image = "ubuntu-2"
}

module "td" {
  source      = "../../"
  name_prefix = "multiple-containers"

  containers = [
    module.container-definition-1.json_map_object,
    module.container-definition-2.json_map_object,
  ]
}
