data "aws_caller_identity" "current" {}

locals {
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    DeployedBy  = data.aws_caller_identity.current.arn
    Environment = var.environment
    Repository  = var.repository
  }
}
