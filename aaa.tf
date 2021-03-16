data "template_file" "cloud-init" {
  template = file("scripts/configure-drives.yaml")

  #vars = {
  #  secret = var.password
  #}

}

