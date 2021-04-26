terraform {
  backend "gcs" {
    bucket      = "walmart-tfstate"
    prefix      = "walmart/vm"
    credentials = "walmart.json"
  }
}
