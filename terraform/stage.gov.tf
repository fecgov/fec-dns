# This will create stage.fec.gov hosted zone
# Print out the NS entries (4) in circleci output (Give them to Century Link)
# Add A record pointing to Cloudfront (value from cloud.gov fec-stage-cdn-route service)
# Add TXT record (if needed) pointing to _acme-challenge (value from cloud.gov fec-stage-cdn-route service)


resource "aws_route53_zone" "stage_gov_zone" {
  name = "stage.fec.gov"
  tags = {
    Project = "dns"
 }
}


resource "aws_route53_record" "stage_gov_a_alias" {
  zone_id = "${aws_route53_zone.stage_gov_zone.zone_id}"
  name = "stage.fec.gov"
  type = "A"
  alias {
    name = "d353fgog3d4z1g.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}


output "stage_gov_ns" {
  value="${aws_route53_zone.stage_gov_zone.name_servers}"
}
