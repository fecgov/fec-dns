# This will create www.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add A record pointing to Cloudfront (value from cloud.gov www.fec.gov CDN service)
# Add TXT record (if needed) pointing to _acme-challenge (value from cloud.gov www.fec.gov CDN service)


resource "aws_route53_zone" "www_gov_zone" {
  name = "www.fec.gov"
  tags {
    Project = "dns"
 }
}


#resource "aws_route53_record" "www_gov_a_alias" {
#  zone_id = "${aws_route53_zone.www_gov_zone.zone_id}"
#  name = "www.fec.gov"
#  type = "A"
#  alias {
#    name = "d3t5a36r5g3qx4.cloudfront.net"
#    zone_id = "Z2FDTNDATAQYW2"
#    evaluate_target_health = false
#  }
#}


output "www_gov_ns" {
 value="${aws_route53_zone.www_gov_zone.name_servers}"
}