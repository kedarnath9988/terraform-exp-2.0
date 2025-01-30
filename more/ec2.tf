resource "aws_instance" "Hello" {
  count                   = length(var.instance_names)
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           =  var.instance_names[count.index] == "db" ? "t3.medium" : "t3.small"
  vpc_security_group_ids  = [ aws_security_group.allow_all.id ]

  tags = merge( 
    var.common_tags, {
      name = var.instance_names[count.index]
      module = var.instance_names[count.index]
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
    from_port        = var.from_port_ingress
    to_port          = var.from_port_ingress
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks

  }
}


