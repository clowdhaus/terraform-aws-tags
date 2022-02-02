variable "application" {
  description = "Application name and/or identifier"
  type        = string
  default     = null # can be left blank/out due to shared resources not tied to an application
}

variable "created_by" {
  description = "The framework, tool, and/or method that created this resource - terraform, serverless, pulumi, manual, etc."
  type        = string
  default     = "terraform"

  validation {
    condition     = can(regex("^terraform$", var.created_by))
    error_message = "The created_by value should be 'terraform' since this is written in terraform."
  }
}

variable "environment" {
  description = "The environment does this resource belong to? - sandbox, nonprod, prod"
  type        = string

  validation {
    condition     = can(regex("(^sandbox$)|(^nonprod$)|(^prod$)", var.environment))
    error_message = "The environment value should be one of - sandbox, nonprod, prod."
  }
}

variable "repository" {
  description = "The repository name where this resource is managed and codified"
  type        = string

  validation {
    condition     = can(regex("^https:\\/\\/github\\.com\\/(clowdhaus)|(serverless-delivery)", var.repository))
    error_message = "The repository should be in the clowdhaus or serverless-delivery organization."
  }
}
