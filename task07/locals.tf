locals {
  rg_name               = format("%s-%s-%s-rg", var.project, var.env_name, var.module_name)
  sa_name               = join("", [var.project, var.env_name, var.module_name, "sa"])
  cdn_profile_name      = format("%s-%s-%s-%s-profile", var.project, var.env_name, var.module_name, var.group)
  cdn_endpoint_name     = format("%s-%s-%s-%s-endpoint", var.project, var.env_name, var.module_name, var.group)
  cdn_origin_group_name = format("%s-%s-%s-%s-origin-group", var.project, var.env_name, var.module_name, var.group)
  cdn_origin_name       = format("%s-%s-%s-%s-origin", var.project, var.env_name, var.module_name, var.group)

}
