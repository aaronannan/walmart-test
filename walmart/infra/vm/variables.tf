variable "vm_wordpress" {

  type = list(string)


  default = [
    "wordpress-1",
    "wordpress-2"

  ]
}

variable "vm_sql" {

  type = list(string)

  default = [

    "sql"

  ]
}

variable "vm_f5" {

  type = list(string)

  default = [

    "f5"

  ]
}

variable "region" {
  default = "us-west1"
}

variable "project_name" {
  default = "walmart"
}


variable "email_service_account" {
  default = "walmart@walmart-311601.iam.gserviceaccount.com"
}

variable "sql_image_type" {
  default = "debian-cloud/debian-9"
}

variable "wordpress_image_type" {
  default = "debian-cloud/debian-9"
}

variable "f5_image_type" {
  default = "debian-cloud/debian-9"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/walmart.json"
}
