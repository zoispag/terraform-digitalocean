resource "digitalocean_droplet" "cv" {
  image              = "debian-10-x64"
  name               = "cv"
  region             = "ams3"
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.zois.id
  ]
  user_data = file("${path.module}/files/user-data.sh")
}

# Add an A record to my domain
resource "digitalocean_record" "www" {
  domain = "zois.dev"
  type   = "A"
  name   = "cv"
  value  = digitalocean_droplet.cv.ipv4_address
}

output "IP" {
  value = digitalocean_droplet.cv.ipv4_address
}
