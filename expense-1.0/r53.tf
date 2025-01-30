resource "aws_route53_record" "expense" {
  count   = length(var.instance_name)
  zone_id = var.zone_id
  name    = var.instance_name[count.index] == "Frontend" ? var.domine_name : "${var.instance_name[count.index]}.${var.domine_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_name[count.index] == "Frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}

