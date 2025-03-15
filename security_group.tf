resource "aws_security_group" "grupo35-sg" {
  name        = "SG-${var.projectName}"
  description = "Grupo usado para acesso ao projeto"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}