resource "aws_instance" "expense" {
  count = length(var.instance_name)
  ami                     = var.ami_id
  instance_type           = var.instance_name[count.index] == "DB" ? "t3.small" : "t3.micro"
  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
  tags =  merge (
            var.common_tags, 
            {
              name = var.instance_name[count.index]
              module = var.instance_name[count.index]
            }
  )
  
}


resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_from_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  }
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol_type
    cidr_blocks      = var.cidr_blocks
  }

}