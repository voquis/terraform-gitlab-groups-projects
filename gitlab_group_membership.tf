# --------------------------------------------------------------------------------------------------
# Manage group memberships
# https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/group_membership
# --------------------------------------------------------------------------------------------------

resource "gitlab_group_membership" "this" {
  # Flatten nested structure
  # https://www.terraform.io/language/functions/flatten#flattening-nested-structures-for-for_each
  for_each = {
    for group_member in local.group_members : "${group_member.group_name}.${group_member.member_i}" => group_member
  }

  group_id     = gitlab_group.this[each.value.group_name].id
  user_id      = each.value.member.user_id
  access_level = each.value.member.access_level
}
