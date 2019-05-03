# FEC DNS is set up as follows:
# Savvis/CenturyLink still controls and hosts the bulk of DNS under fec.gov
# they are delegating two names to us:
#
# transition.fec.gov
# www.fec.gov
# 
# and because you can't CNAME the root domain, Savvis/CenturyLink are 
# pointing the root at an FEC server that HTTP redirects to www.fec.gov

resource "aws_route53_zone" "dev_gov_zone" {
  name = "dev.fec.gov"
  tags {
    Project = "dns"
 }
}


#resource "aws_route53_record" "dev_gov_a_alias" {
#  zone_id = "${aws_route53_zone.dev_gov_zone.zone_id}"
#  name = "dev.fec.gov"
#  type = "A"
#  alias {
#    name = "d353fgog3d4z1g.cloudfront.net"
#    zone_id = "${local.cloudfront_zone_id}"
#    evaluate_target_health = false
#  }
#}

resource "aws_route53_record" "dev_gov_txt" {
  zone_id = "${aws_route53_zone.dev_gov_zone.zone_id}"
  name = "_acme-challenge.dev.fec.gov"
  type = "TXT"
  ttl = 300
  records = ["xMBMFNdBBfgK8cOXaIqfNTRgoEld4Zl1AUiW1gMahTs"]
}

output "dev_gov_ns" {
 value="${aws_route53_zone.dev_gov_zone.name_servers}"
}


#output "stage_gov_us_zone_us_ns" {
#  value="${aws_route53_zone.stage_gov_us_zone.name_servers}"
#}
