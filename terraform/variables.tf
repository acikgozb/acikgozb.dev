variable "app_name" {
  type        = string
  description = "The name of the application that is being provisioned by Terraform."

  validation {
    condition     = can(regex("[^[:space:]]", var.app_name))
    error_message = "The variable 'app_name' cannot contain whitespaces."
  }
}

variable "redirect_worker_path" {
  type        = string
  description = "The binary path of our Cloudflare redirect worker."
}

variable "frontend_asset_path" {
  type        = string
  description = "The asset (output) path of the website."
}
