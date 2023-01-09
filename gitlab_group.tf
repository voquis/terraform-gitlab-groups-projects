# --------------------------------------------------------------------------------------------------
# Manage groups
# https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group
# --------------------------------------------------------------------------------------------------

resource "gitlab_group" "this" {
  for_each = {
    for i, group in var.groups : i => group
  }

  # Required variables
  name = each.value.name
  path = lookup(each.value, "path")
  # Optional variables
  auto_devops_enabled                = lookup(each.value, "auto_devops_enabled", null) == null ? var.default_group_auto_devops_enabled : each.value.auto_devops_enabled
  avatar                             = lookup(each.value, "avatar", null) == null ? var.default_group_avatar : each.value.avatar
  avatar_hash                        = lookup(each.value, "avatar_hash", null) == null ? var.default_group_avatar_hash : each.value.avatar_hash
  default_branch_protection          = lookup(each.value, "default_branch_protection", null) == null ? var.default_group_default_branch_protection : each.value.default_branch_protection
  description                        = lookup(each.value, "description", null) == null ? var.default_group_description : each.value.description
  emails_disabled                    = lookup(each.value, "emails_disabled", null) == null ? var.default_group_emails_disabled : each.value.emails_disabled
  extra_shared_runners_minutes_limit = lookup(each.value, "extra_shared_runners_minutes_limit", null) == null ? var.default_group_extra_shared_runners_minutes_limit : each.value.extra_shared_runners_minutes_limit
  lfs_enabled                        = lookup(each.value, "lfs_enabled", null) == null ? var.default_group_lfs_enabled : each.value.lfs_enabled
  membership_lock                    = lookup(each.value, "membership_lock", null) == null ? var.default_group_membership_lock : each.value.membership_lock
  mentions_disabled                  = lookup(each.value, "mentions_disabled", null) == null ? var.default_group_mentions_disabled : each.value.mentions_disabled
  parent_id                          = lookup(each.value, "parent_id", null) == null ? var.default_group_parent_id : each.value.parent_id
  prevent_forking_outside_group      = lookup(each.value, "prevent_forking_outside_group", null) == null ? var.default_group_prevent_forking_outside_group : each.value.prevent_forking_outside_group
  project_creation_level             = lookup(each.value, "project_creation_level", null) == null ? var.default_group_project_creation_level : each.value.project_creation_level
  request_access_enabled             = lookup(each.value, "request_access_enabled", null) == null ? var.default_group_request_access_enabled : each.value.request_access_enabled
  require_two_factor_authentication  = lookup(each.value, "require_two_factor_authentication", null) == null ? var.default_group_require_two_factor_authentication : each.value.require_two_factor_authentication
  share_with_group_lock              = lookup(each.value, "share_with_group_lock", null) == null ? var.default_group_share_with_group_lock : each.value.share_with_group_lock
  shared_runners_minutes_limit       = lookup(each.value, "shared_runners_minutes_limit", null) == null ? var.default_group_shared_runners_minutes_limit : each.value.shared_runners_minutes_limit
  subgroup_creation_level            = lookup(each.value, "subgroup_creation_level", null) == null ? var.default_group_subgroup_creation_level : each.value.subgroup_creation_level
  two_factor_grace_period            = lookup(each.value, "two_factor_grace_period", null) == null ? var.default_group_two_factor_grace_period : each.value.two_factor_grace_period
  visibility_level                   = lookup(each.value, "visibility_level", null) == null ? var.default_group_visibility_level : each.value.visibility_level

  # Do not report changes to the following as they are controlled by GitLab cloud
  lifecycle {
    ignore_changes = [
      extra_shared_runners_minutes_limit,
    ]
  }
}
