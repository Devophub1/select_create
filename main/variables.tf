variable "rg_name" {
    description = "Resource Group name"
    default = "konda-rg-storage"
}

variable "location" {
    description = "location where the resource will be created"
    default = "uksouth"
}

variable "tags" {
    description = "Tags for the resources"
    type = map(string)
    default = {
        "environment" = "eng"
        "source" = "terraform"
  }
}