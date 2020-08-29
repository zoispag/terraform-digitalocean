## Terraform for DigitalOcean

This repo creates a droplet in DigitalOcean and assignes the new IPv4 in an A record of the specified domain.
Using `user_data`, **nginx** will be installed.

### Droplet

| Setting  | Value           | Explanation                | 
| -------- | --------------- | -------------------------- |
| Region   | `ams3`          | Amsterdam 3                |
| Image    | `debian-10-x64` | Debian 10 (Buster)         |
| Size     | `s-1vcpu-1gb`   | 1 CPU, 1 GB RAM, 25 GB SSD |

### Setup

The DigitalOcean token needs to be exported.

```bash
$ export DO_PAT=f76d946fb17f0eb0e527375b2a58a6864a41fc14e1833bd8deafeb38d836f075
```

### Plan & Apply

This terraform module can be planned with:

```bash
terraform plan -var "do_token=${DO_PAT}"
```

and can be applied with:

```bash
terraform apply -var "do_token=${DO_PAT}"
```