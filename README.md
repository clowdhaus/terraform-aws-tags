# Tags Module

Provides both tag validation as well as ensuring required tags are populated.

Example:

```hcl
module "tags" {
  source  = "clowdhaus/tags/aws"

  application = "serverless-gitops-infrastructure"
  environment = "nonprod"
  repository  = "github.com/serverless-delivery/serverless-gitops-infrastructure"
}
```

From this module, the output will provide tags in the following format:

```
{
  "Application" = "serverless-gitops-infrastructure",
  "CreatedBy = "terraform"
  "DeployedBy" = "arn:aws:iam::012345678910:role/terraform-role",
  "Environment" = "nonprod",
  "Repository" = "github.com/serverless-delivery/serverless-gitops-infrastructure"
}
```

As well as a formatted output for use in autoscaling groups with tag propogation:


```
[
  {
    key = "Application",
    value = "serverless-gitops-",
    propogate_at_launch = true
  }, {
    key = "CreatedBy,
    value = "terraform",
    propagate_at_launch = true
  },
    key = "DeployedBy",
    value = "arn:aws:iam::012345678910:role/terraform-role",
    propagate_at_launch = true
  }, {
    key = "Environment",
    value = "nonprod",
    propagate_at_launch = true
  }, {
    key = "Repository",
    value = "github.com/serverless-delivery/serverless-gitops-infrastructure",
    propagate_at_launch = true
  }
]
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application name and/or identifier | `string` | `null` | no |
| <a name="input_created_by"></a> [created\_by](#input\_created\_by) | The framework, tool, and/or method that created this resource - terraform, serverless, pulumi, manual, etc. | `string` | `"terraform"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment does this resource belong to? - sandbox, nonprod, prod | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The repository name where this resource is managed and codified | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_tags"></a> [asg\_tags](#output\_asg\_tags) | Tags which are appropriate auto scaling group (i.e. as a list of maps). See: https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags which are applicable to all resources - map of `{key: value}` pairs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-tags/blob/main/LICENSE).
