variable inbound_roules {
  type        = list 
  default     = [
        {
            from_port        = 22,
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            from_port        = 80,
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            from_port        = 8080,
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            from_port        = 3306,
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
  ]
}
