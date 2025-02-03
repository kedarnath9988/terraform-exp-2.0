resource "aws_route53_record" "nameservers" {
  for_each        = aws_instance.expense # getting entire info of the instaces 
  name            = each.key == "frontend" ? var.domine_name : "${each.key}.${var.domine_name}"
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
  records = each.key == "frontend" ? [each.key.public_ip] : [each.value.private_ip]
  allow_overwrite = true

}