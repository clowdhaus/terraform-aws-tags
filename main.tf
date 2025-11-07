data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  # This data source provides information on the source
  # IAM role when an assumed role is utilized
  arn = data.aws_caller_identity.current.arn
}

locals {
  tags = {
    Application      = var.application
    CreatedBy        = var.created_by
    DeployedBy       = data.aws_caller_identity.current.arn
    DeployedBySource = data.aws_iam_session_context.current.issuer_arn
    Environment      = var.environment
    Repository       = var.repository
  }
}
