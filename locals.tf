locals {
  # Extract group members as a flattened nested structure:
  # https://www.terraform.io/language/functions/flatten#flattening-nested-structures-for-for_each
  group_members = flatten([
    for group_name, group in var.groups : [
      for member_i, member in(lookup(group, "members", null) == null ? [] : group.members) : {
        group_name = group_name
        member_i   = member_i
        group      = group
        member     = member
      }
    ]
  ])

  # Extract group porjects as a flattened nested structure:
  # https://www.terraform.io/language/functions/flatten#flattening-nested-structures-for-for_each
  group_projects = flatten([
    for group_name, group in var.groups : [
      for project_i, project in(lookup(group, "projects", null) == null ? [] : group.projects) : {
        group_name = group_name
        project_i  = project_i
        group      = group
        project    = project
      }
    ]
  ])
}
