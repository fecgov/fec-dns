# This will create transition.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add A record pointing to Cloudfront (value from cloud.gov transition-fec-route service)
# Add TXT record (if needed) pointing to _acme-challenge (value from cloud.gov transition-fec-route service)


resource "aws_route53_zone" "transition_gov_zone" {
  name = "transition.fec.gov"
  tags {
    Project = "dns"
 }
}


#resource "aws_route53_record" "transition_gov_a_alias" {
#  zone_id = "${aws_route53_zone.transition_gov_zone.zone_id}"
#  name = "transition.fec.gov"
#  type = "A"
#  alias {
#    name = "d2p6ccc3xlipxg.cloudfront.net"
#    zone_id = "Z2FDTNDATAQYW2"
#    evaluate_target_health = false
#  }
#}


output "transition_gov_ns" {
  value="${aws_route53_zone.transition_gov_zone.name_servers}"
}