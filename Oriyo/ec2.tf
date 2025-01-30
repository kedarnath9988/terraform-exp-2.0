resource "aws_instance" "this" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t3.small"
  vpc_security_group_ids  = [ aws_security_group.allow_all.id ]
 
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
}


