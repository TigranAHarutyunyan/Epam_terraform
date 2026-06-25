output "redis_hostname" {
  value       = azurerm_redis_cache.redis.hostname
  description = "Hostanem of redis"
}
output "redis_primary_key" {
  sensitive   = true
  value       = azurerm_redis_cache.redis.primary_access_key
  description = "primary key of redis"
}