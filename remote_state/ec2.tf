resource "aws_instance" "db" {
    ami  = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]

      tags = {
    Name = "db"
    created_by = "kedarnath"
  }

}

resource "aws_security_group" "allow_all" {
     name        = "allow_all"
     description = "allowing everything"
    # allwing everything 
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

  }

    # allowing the TCP protocol with port 22 
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
    tags = {
    Name = "allow_all"
    created_by ="kedarnath"
  }
  
}
