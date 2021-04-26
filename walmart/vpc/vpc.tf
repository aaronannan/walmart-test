module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = "walmart-311601"
  network_name = "walmart-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "public-subnet"
      subnet_ip     = "10.20.1.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "private-subnet"
      subnet_ip             = "10.20.2.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "public subnet"
    }
  ]

  secondary_ranges = {
    public-subnet = [
      {
        range_name    = "public-subnet-range"
        ip_cidr_range = "192.168.24.0/24"
      },
    ]

    private-subnet = []
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}
