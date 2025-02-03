resource "aws_security_group" "allow_ports" {
  name = "allow_ports"
  description = "Allow port no 22,80,8080,3306"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

    dynamic  "ingress"  {
    for_each  = var.inbound_roules
    content {
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["from_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      =  ingress.value["cidr_blocks"]
    }
    
  }


  tags = {
    Name = "allow_ports"
  }
}