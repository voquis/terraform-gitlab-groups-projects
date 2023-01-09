variable "groups" {
  description = "Map of groups, with optional repositories and their configurations"
  type = map(object({
    # Requred group variables
    name = string
    path = string
    # Optional group variables
    auto_devops_enabled                = optional(bool)
    avatar                             = optional(string)
    avatar_hash                        = optional(string)
    default_branch_protection          = optional(number)
    description                        = optional(string)
    emails_disabled                    = optional(bool)
    extra_shared_runners_minutes_limit = optional(number)
    lfs_enabled                        = optional(bool)
    membership_lock                    = optional(bool)
    mentions_disabled                  = optional(bool)
    parent_id                          = optional(number)
    prevent_forking_outside_group      = optional(bool)
    project_creation_level             = optional(string)
    request_access_enabled             = optional(bool)
    require_two_factor_authentication  = optional(bool)
    share_with_group_lock              = optional(bool)
    shared_runners_minutes_limit       = optional(number)
    subgroup_creation_level            = optional(string)
    two_factor_grace_period            = optional(number)
    visibility_level                   = optional(string)

    # Optional nested group member variables
    members = optional(list(object({
      user_id      = string
      access_level = string
    })))

    # Optional nested group project variables
    projects = optional(list(object({
      # Required project variables
      name = string
      # Optional project variables
      allow_merge_on_skipped_pipeline                  = optional(bool)
      analytics_access_level                           = optional(string)
      archive_on_destroy                               = optional(bool)
      archived                                         = optional(bool)
      auto_cancel_pending_pipelines                    = optional(string)
      auto_devops_deploy_strategy                      = optional(string)
      auto_devops_enabled                              = optional(bool)
      autoclose_referenced_issues                      = optional(bool)
      avatar                                           = optional(string)
      avatar_hash                                      = optional(string)
      build_git_strategy                               = optional(string)
      build_timeout                                    = optional(number)
      builds_access_level                              = optional(string)
      ci_config_path                                   = optional(string)
      ci_default_git_depth                             = optional(number)
      ci_forward_deployment_enabled                    = optional(bool)
      ci_separated_caches                              = optional(bool)
      container_registry_access_level                  = optional(string)
      default_branch                                   = optional(string)
      description                                      = optional(string)
      emails_disabled                                  = optional(bool)
      external_authorization_classification_label      = optional(string)
      forked_from_project_id                           = optional(number)
      forking_access_level                             = optional(string)
      group_with_project_templates_id                  = optional(number)
      import_url                                       = optional(string)
      initialize_with_readme                           = optional(bool)
      issues_access_level                              = optional(string)
      issues_enabled                                   = optional(bool)
      issues_template                                  = optional(string)
      lfs_enabled                                      = optional(bool)
      merge_commit_template                            = optional(string)
      merge_method                                     = optional(string)
      merge_pipelines_enabled                          = optional(bool)
      merge_requests_access_level                      = optional(string)
      merge_requests_enabled                           = optional(bool)
      merge_requests_template                          = optional(string)
      merge_trains_enabled                             = optional(bool)
      namespace_id                                     = optional(number)
      only_allow_merge_if_all_discussions_are_resolved = optional(bool)
      only_allow_merge_if_pipeline_succeeds            = optional(bool)
      operations_access_level                          = optional(string)
      packages_enabled                                 = optional(bool)
      pages_access_level                               = optional(string)
      path                                             = optional(string)
      printing_merge_request_link_enabled              = optional(bool)
      public_builds                                    = optional(bool)
      remove_source_branch_after_merge                 = optional(bool)
      repository_access_level                          = optional(string)
      repository_storage                               = optional(string)
      request_access_enabled                           = optional(bool)
      requirements_access_level                        = optional(string)
      resolve_outdated_diff_discussions                = optional(bool)
      restrict_user_defined_variables                  = optional(bool)
      security_and_compliance_access_level             = optional(string)
      shared_runners_enabled                           = optional(bool)
      skip_wait_for_default_branch_protection          = optional(bool)
      snippets_access_level                            = optional(string)
      snippets_enabled                                 = optional(bool)
      squash_commit_template                           = optional(string)
      squash_option                                    = optional(string)
      suggestion_commit_message                        = optional(string)
      template_name                                    = optional(string)
      template_project_id                              = optional(number)
      use_custom_template                              = optional(bool)
      visibility_level                                 = optional(string)
      wiki_access_level                                = optional(string)
      wiki_enabled                                     = optional(bool)
      # mirror                                           = optional(bool)
      # mirror_overwrites_diverged_branches              = optional(bool)
      # mirror_trigger_builds                            = optional(bool)
      # only_mirror_protected_branches                   = optional(bool)
      # push_rules = optional(Block List, Max: 1)
      # tags = optional(Set of string)
      # topics = optional(Set of string)
    })))
  }))
}

# --------------------------------------------------------------------------------------------------
# Default group variables
# --------------------------------------------------------------------------------------------------

variable "default_group_auto_devops_enabled" {
  type    = bool
  default = false
}

variable "default_group_avatar" {
  type    = string
  default = null
}

variable "default_group_avatar_hash" {
  type    = string
  default = null
}

variable "default_group_default_branch_protection" {
  type    = number
  default = 2
}

variable "default_group_description" {
  type    = string
  default = null
}

variable "default_group_emails_disabled" {
  type    = bool
  default = false
}

variable "default_group_extra_shared_runners_minutes_limit" {
  type    = number
  default = null
}

variable "default_group_lfs_enabled" {
  type    = bool
  default = true
}

variable "default_group_membership_lock" {
  type    = bool
  default = false
}

variable "default_group_mentions_disabled" {
  type    = bool
  default = false
}

variable "default_group_parent_id" {
  type    = number
  default = null
}

variable "default_group_prevent_forking_outside_group" {
  type    = bool
  default = false
}

variable "default_group_project_creation_level" {
  type    = string
  default = "maintainer"
}

variable "default_group_request_access_enabled" {
  type    = bool
  default = false
}

variable "default_group_require_two_factor_authentication" {
  type    = bool
  default = false
}

variable "default_group_share_with_group_lock" {
  type    = bool
  default = false
}

variable "default_group_shared_runners_minutes_limit" {
  type    = number
  default = null
}

variable "default_group_subgroup_creation_level" {
  type    = string
  default = "owner"
}

variable "default_group_two_factor_grace_period" {
  type    = number
  default = 48
}

variable "default_group_visibility_level" {
  type    = string
  default = "private"
}

# --------------------------------------------------------------------------------------------------
# Default project variables
# --------------------------------------------------------------------------------------------------

variable "default_project_allow_merge_on_skipped_pipeline" {
  type        = bool
  default     = false
  description = "Treat skipped pipelines as if they finished with success"
}

variable "default_project_analytics_access_level" {
  type        = string
  default     = "enabled"
  description = "Analytics access level"
}

variable "default_project_archive_on_destroy" {
  type        = bool
  default     = null
  description = "Archive the project instead of deleting on destroy"
}

variable "default_project_archived" {
  type        = bool
  default     = false
  description = "Whether the project is in read-only mode (archived)"
}

variable "default_project_auto_cancel_pending_pipelines" {
  type        = string
  default     = null
  description = "disabled"
}

variable "default_project_auto_devops_deploy_strategy" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_auto_devops_enabled" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_autoclose_referenced_issues" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_avatar" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_avatar_hash" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_build_git_strategy" {
  type        = string
  default     = "fetch"
  description = ""
}

variable "default_project_build_timeout" {
  type        = number
  default     = null
  description = ""
}

variable "default_project_builds_access_level" {
  type        = string
  default     = "enabled"
  description = ""
}

variable "default_project_ci_config_path" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_ci_default_git_depth" {
  type        = number
  default     = null
  description = ""
}

variable "default_project_ci_forward_deployment_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_ci_separated_caches" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_container_registry_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_default_branch" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_description" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_emails_disabled" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_external_authorization_classification_label" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_forked_from_project_id" {
  type        = number
  default     = null
  description = ""
}

variable "default_project_forking_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_group_with_project_templates_id" {
  type        = number
  default     = null
  description = ""
}

variable "default_project_import_url" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_initialize_with_readme" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_issues_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_issues_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_issues_template" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_lfs_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_merge_commit_template" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_merge_method" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_merge_pipelines_enabled" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_merge_requests_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_merge_requests_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_merge_requests_template" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_merge_trains_enabled" {
  type        = bool
  default     = false
  description = ""
}

# variable "default_project_mirror" {
#   type        = bool
#   default     = null
#   description = ""
# }

# variable "default_project_mirror_overwrites_diverged_branches" {
#   type        = bool
#   default     = false
#   description = ""
# }

# variable "default_project_mirror_trigger_builds" {
#   type        = bool
#   default     = false
#   description = ""
# }

variable "default_project_namespace_id" {
  type        = number
  default     = null
  description = ""
}

variable "default_project_only_allow_merge_if_all_discussions_are_resolved" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_only_allow_merge_if_pipeline_succeeds" {
  type        = bool
  default     = false
  description = ""
}

# variable "default_project_only_mirror_protected_branches" {
#   type        = bool
#   default     = false
#   description = ""
# }

variable "default_project_operations_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_packages_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_pages_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_path" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_printing_merge_request_link_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_public_builds" {
  type        = bool
  default     = true
  description = ""
}

# variable "default_project_push_rules" {
#   type = Block List, Max: 1
#   default = false
#   description = ""
# }

variable "default_project_remove_source_branch_after_merge" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_repository_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_repository_storage" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_request_access_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_requirements_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_resolve_outdated_diff_discussions" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_restrict_user_defined_variables" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_security_and_compliance_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_shared_runners_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_skip_wait_for_default_branch_protection" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_snippets_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_snippets_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "default_project_squash_commit_template" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_squash_option" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_suggestion_commit_message" {
  type        = string
  default     = null
  description = ""
}

# variable "default_project_tags" {
#   type = Set of string
#   default = false
#   description = ""
# }

variable "default_project_template_name" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_template_project_id" {
  type        = number
  default     = null
  description = ""
}

# variable "default_project_topics" {
#   type = Set of string
#   default = false
#   description = ""
# }

variable "default_project_use_custom_template" {
  type        = bool
  default     = false
  description = ""
}

variable "default_project_visibility_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_wiki_access_level" {
  type        = string
  default     = null
  description = ""
}

variable "default_project_wiki_enabled" {
  type        = bool
  default     = true
  description = ""
}
