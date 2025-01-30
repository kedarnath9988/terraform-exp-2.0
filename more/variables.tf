#================ aws_instance variable ==============
variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  
}

variable "instance_names" {
  default = ["db", "backend", "Frontend"]
}

variable "common_tags"  { 
  default = {
    Environment = "Production"
    Project = "Hello"
    terraform = true 
  }
}

/* variable "tags_name" {
  default = "Db_instance"
}
variable "module" {
  default = "Db-module"
}
variable "Project" {
  default = "Hello"
}
variable "env" {
  default = "production"
}
 */

#================ aws_security_group variable =========

variable "disc"{
    default = "Allow TLS inbound traffic and all outbound traffic"
}
variable "from_port" {
  default     = "0"
}
variable "from_port_ingress" {
  default     = "22"
}

variable "protocol"{
    default = "tcp"
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "tag_name" {
    default = "more_sg"
}
variable "created_by" {
    default = "kedarnath"
}
# ========= route53 ================

variable "zone_id" {
  default = "Z07580402H5LV9N8WYF93"
}

variable "domine_name" {
  default = "kedar78s.online"
}