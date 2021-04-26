terraform {
  backend "gcs" {
    bucket      = "walmart-tfstate"
    prefix      = "walmart/state"
    credentials = "walmart.json"
  }
}
