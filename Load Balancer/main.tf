resource "aws_lb" "loadbalancer" {
    name = var.lbname
    internal = false
    load_balancer_type = var.lbtype
    subnets = var.publicsubnet
    enable_deletion_protection = true

    tags = {
      Name = var.lbname
      Type = var.lbtype
    }
}