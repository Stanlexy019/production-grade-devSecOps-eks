output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_1_id" {
  value = module.networking.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.networking.public_subnet_2_id
}

output "alb_sg_id" {
  value = module.security.alb_sg_id
}

output "worker_node_sg_id" {
  value = module.security.worker_node_sg_id
}

output "cluster_sg_id" {
  value = module.security.cluster_sg_id

}

output "alb_controller_role_arn" {
  value = module.alb_integration.alb_controller_role_arn
}