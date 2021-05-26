variable "base_image_sku" {
  type    = string
  default = "18.04"
}


variable "subscription_id" {
  type    = string
  default = "${env("ARM_SUBSCRIPTION_ID")}"
}

