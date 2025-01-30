resource "aws_route53_record" "Hello" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    =  var.instance_names[count.index] == "frontend" ? var.domine_name : "${var.instance_names[count.index]}.${var.domine_name}"
  type    = "A"
  ttl     = 1
  records = [ var.instance_names[count.index] == "frontend" ? aws_instance.Hello[count.index].public_ip : aws_instance.Hello[count.index].private_ip ]
  allow_overwrite = true
}