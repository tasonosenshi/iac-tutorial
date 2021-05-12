source "googlecompute" "iac-tutorial" {
  project_id          = "acquired-router-313222"
  zone                = "us-east4-a"
  machine_type        = "g1-small"
  source_image_family = "ubuntu-1604-lts"
  image_name          = "raddit-base-${formatdate("YYYYMMDD-hhmmss", timestamp())}"
  image_family        = "raddit-base"
  image_description   = "Ubuntu 16.04 with Ruby, Bundler and MongoDB preinstalled"
  ssh_username        = "raddit-user"
}

build {
  sources = ["source.googlecompute.iac-tutorial"]

  provisioner "ansible" {
    playbook_file = "${path.root}/../ansible/configuration.yml"
  }
}
