resource "aws_security_group_rule" "alb_to_worker_http" {
  type                     = "ingress"
  description              = "Allow ALB to reach worker nodes on HTTP"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_to_worker_https" {
  type                     = "ingress"
  description              = "Allow ALB to reach worker nodes on HTTPS"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "cluster_to_worker" {
  type                     = "ingress"
  description              = "Allow EKS control plane to communicate with worker nodes"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node_sg.id
  source_security_group_id = aws_security_group.cluster_sg.id
}

resource "aws_security_group_rule" "worker_to_worker" {
  type              = "ingress"
  description       = "Allow worker nodes to communicate with each other"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.worker_node_sg.id
  self              = true
}