data "digitalocean_ssh_key" "devops" {
  name = "REBRAIN.SSH.PUB.KEY"
#  name = "23uk_at_tut_by"
}

resource "digitalocean_ssh_key" "my_pub_key" {
  name       = "my_pub_key"
  public_key = var.pub_key_my
}

resource "digitalocean_droplet" "devops" {
  image    = "centos-7-x64"
  name     = "devops"
  user_data = "REBRAIN.SSH.PUB.KEY"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys =  [data.digitalocean_ssh_key.devops.id,digitalocean_ssh_key.my_pub_key.id]
}