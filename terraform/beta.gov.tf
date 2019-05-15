# This will create beta.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add A record pointing to Cloudfront (value from cloud.gov beta-fec-cdn-route service)
# Add TXT record (if needed) pointing to _acme-challenge (value from cloud.gov beta-fec-cdn-route service)


resource "aws_route53_zone" "beta_gov_zone" {
  name = "beta.fec.gov"
  tags {
    Project = "dns"
 }
}


resource "aws_route53_record" "beta_gov_a_alias" {
  zone_id = "${aws_route53_zone.beta_gov_zone.zone_id}"
  name = "beta.fec.gov"
  type = "A"
  alias {
    name = "d7y65vr5rtlbx.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}


output "beta_gov_ns" {
  value="${aws_route53_zone.beta_gov_zone.name_servers}"
}