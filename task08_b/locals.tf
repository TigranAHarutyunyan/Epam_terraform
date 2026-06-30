locals {
  aca_name           = format("%s-ca", var.name_prefix)
  aca_env_name       = format("%s-cae", var.name_prefix)
  acr_name          =  "${var.name_postfix}cr"
  aks_name           = format("%s-aks",var.name_prefix)
  keyvault_name      = format("%s-kv", var.name_prefix)
  redis_aci_name     = format("%s-redis-ci", var.name_prefix)
  rg_name            = format("%s-rg", var.name_prefix)
  sa_name            = "${var.name_postfix}sa"
  docker_image       = format("%s-app", var.name_prefix)
  log_analytics_name = format("%s-law", var.name_prefix)
  user_identity_name = format("%s-aca-identity", var.name_prefix)
}