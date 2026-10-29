module "container_definition_one" {
  source          = "cloudposse/ecs-container-definition/aws"
  version         = "0.58.1"
  container_name  = "container-1"
  container_image = "ubuntu-1"
}

module "container_definition_two" {
  source          = "cloudposse/ecs-container-definition/aws"
  version         = "0.58.1"
  container_name  = "container-2"
  container_image = "ubuntu-2"
}

module "td" {
  source      = "../../"
  name_prefix = "multiple-containers"

  additional_containers = [
    module.container_definition_one.json_map_object,
    module.container_definition_two.json_map_object,
  ]
}
