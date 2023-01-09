# terraform-gitlab-groups-projects

Terraform 1.3 module to manage GitLab groups, projects and memberships.

To use nested groups, use data lookups and set `parent_id` for groups.

```terraform
module "groups" {
  source  = "voquis/gitlab-groups-repos"
  version = "0.0.1"

  # Set group defaults that apply to all groups if unset
  default_group_subgroup_creation_level = "maintainer"
  default_group_project_creation_level  = "maintainer"

  # Set project defaults that apply to all projects if unset
  default_project_only_allow_merge_if_all_discussions_are_resolved = true
  default_project_only_allow_merge_if_pipeline_succeeds            = true
  default_project_request_access_enabled                           = false

  groups = {
    my_group_1 = {
      name        = "Group 1"
      path        = "group1"
      description = "My Group 1"
      members     = [
        {
          user_id      = data.gitlab_user.my_user_1.id
          access_level = "owner"
        },
        {
          user_id      = data.gitlab_user.my_user_2.id
          access_level = "maintainer"
        },
      ]

      projects = [
        {
          name        = "Project 1"
          description = "My project 1"
        },
        {
          name = "Infrastructure"
          description = "My project 2"
        }
      ]
    }

    my_group_2 = {
      name        = "Group 2"
      path        = "group2"
      description = "My Group 2"
      members     = [
        {
          user_id      = data.gitlab_user.my_user_1.id
          access_level = "owner"
        },
        {
          user_id      = data.gitlab_user.my_user_2.id
          access_level = "maintainer"
        },
      ]

      projects = [
        {
          name        = "Project 1"
          description = "My project 1"
        },
        {
          name = "Infrastructure"
          description = "My project 2"
        }
      ]
    }
  }
}

```
