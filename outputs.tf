output "tags" {
  description = "Tags which are applicable to all resources - map of `{key: value}` pairs"
  value       = local.tags
}

output "asg_tags" {
  description = "Tags which are appropriate auto scaling group (i.e. as a list of maps). See: https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html"
  value = [for key, val in local.tags :
    {
      key                 = key
      value               = val
      propagate_at_launch = true
    }
  ]
}
