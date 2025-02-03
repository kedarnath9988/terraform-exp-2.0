resource "aws_instance" "expense" {
  for_each                = var.instance_name
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = each.value
  vpc_security_group_ids  = [ aws_security_group.allow_all.id ]

  tags = merge( 
    var.common_tags, {
      name = each.key
      module = each.value
    }
  )
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = var.from_port
    to_port          = var.from_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  
  }

    ingress {
    from_port        = var.egress_from_port
    to_port          = var.egress_from_port
    protocol         = var.protocol_type
    cidr_blocks      = var.cidr_blocks

  }
}


