# route53 variable
variable "zone_id" {
    type = string
    default = "Z07580402H5LV9N8WYF93"
}

variable "domine_name" {
    type = string
    default = "kedar78s.online"
}

# ========== ec2 variable=================
variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "instance_name" {
    type = list (string)
    default = ["DB", "Frontend", "Backend" ]
}

variable "common_tags" {
    default = {
        project = "Expense"
        environment = "DEV"
        terraform = true 

    }
}

#============================ S-G ========== 
variable  "sg_name" {
  type        = string
  default     = "allow_ssh"
}
variable "from_port" {
    type = number 
    default = 22

}
variable "to_port" {
    type = number 
    default = 22
    
}
variable "protocol_type" {
    type = string 
    default = "tcp"
}

variable "cidr_blocks" {
    default = [ "0.0.0.0/0" ]
}

variable "egress_from_port" {
    default = 0 
}
