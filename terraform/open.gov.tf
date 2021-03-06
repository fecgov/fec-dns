# This will create open.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add CNAME record pointing api.open.fec.gov (api umbrella - data.gov)
# Add CNAME record pointing api-stage.open.fec.gov (api umbrella - data.gov)
# Add CNAME record pointing comodoca.com (for https certificate - if needed)


resource "aws_route53_zone" "open_fec_gov_zone" {
  name = "open.fec.gov"
  tags = {
    Project = "dns"
  }
}


resource "aws_route53_record" "open_fec_gov_api-stage_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api-stage.open.fec.gov"
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-gov.domains.api.data.gov."]
}


resource "aws_route53_record" "open_fec_gov_api_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api.open.fec.gov"
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-gov.domains.api.data.gov."]
}


#resource "aws_route53_record" "open_fec_gov_a33103137e39f452e19e75a2bd2ccb02_api_open_fec_gov_cname" {
#  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
#  name    = "a33103137e39f452e19e75a2bd2ccb02.api.open.fec.gov."
#  type    = "CNAME"
#  ttl     = 300
#  records = ["198e0728a29b521ce35ec20143c475fda6b2c9e2.comodoca.com."]
#}


output "open_fec_gov_ns" {
  value = "${aws_route53_zone.open_fec_gov_zone.name_servers}"
}


