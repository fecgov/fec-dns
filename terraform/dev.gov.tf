# This will create dev.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add A record pointing to Cloudfront (value from cloud.gov fec-dev-cdn-route service)
# Add TXT record (if needed) pointing to _acme-challenge (value from cloud.gov fec-dev-cdn-route service)


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
#    name = "d18qvbems6nrkf.cloudfront.net"
#    zone_id = "Z2FDTNDATAQYW2"
#    evaluate_target_health = false
#  }
#}


output "dev_gov_ns" {
 value="${aws_route53_zone.dev_gov_zone.name_servers}"
}


