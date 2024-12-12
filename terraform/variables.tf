variable "app_name" {
  type        = string
  description = "The name of the application that is being provisioned by Terraform."

  validation {
    condition     = can(regex("[^[:space:]]", var.app_name))
    error_message = "The variable 'app_name' cannot contain whitespaces."
  }
}
