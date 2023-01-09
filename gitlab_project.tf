# --------------------------------------------------------------------------------------------------
# Manage projects
# https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/project
# --------------------------------------------------------------------------------------------------

resource "gitlab_project" "this" {
  # Flatten nested structure
  # https://www.terraform.io/language/functions/flatten#flattening-nested-structures-for-for_each
  for_each = {
    for group_project in local.group_projects : "${group_project.group_name}.${group_project.project_i}" => group_project
  }
  # Required variables
  name = each.value.project.name
  # Optional variables, falling back to defaults if not set
  namespace_id                                     = gitlab_group.this[each.value.group_name].id
  allow_merge_on_skipped_pipeline                  = lookup(each.value.project, "allow_merge_on_skipped_pipeline", null) == null ? var.default_project_allow_merge_on_skipped_pipeline : each.value.project.allow_merge_on_skipped_pipeline
  analytics_access_level                           = lookup(each.value.project, "analytics_access_level", null) == null ? var.default_project_analytics_access_level : each.value.project.analytics_access_level
  archive_on_destroy                               = lookup(each.value.project, "archive_on_destroy", null) == null ? var.default_project_archive_on_destroy : each.value.project.archive_on_destroy
  archived                                         = lookup(each.value.project, "archived", null) == null ? var.default_project_archived : each.value.project.archived
  auto_cancel_pending_pipelines                    = lookup(each.value.project, "auto_cancel_pending_pipelines", null) == null ? var.default_project_auto_cancel_pending_pipelines : each.value.project.auto_cancel_pending_pipelines
  auto_devops_deploy_strategy                      = lookup(each.value.project, "auto_devops_deploy_strategy", null) == null ? var.default_project_auto_devops_deploy_strategy : each.value.project.auto_devops_deploy_strategy
  auto_devops_enabled                              = lookup(each.value.project, "auto_devops_enabled", null) == null ? var.default_project_auto_devops_enabled : each.value.project.auto_devops_enabled
  autoclose_referenced_issues                      = lookup(each.value.project, "autoclose_referenced_issues", null) == null ? var.default_project_autoclose_referenced_issues : each.value.project.autoclose_referenced_issues
  avatar                                           = lookup(each.value.project, "avatar", null) == null ? var.default_project_avatar : each.value.project.avatar
  avatar_hash                                      = lookup(each.value.project, "avatar_hash", null) == null ? var.default_project_avatar_hash : each.value.project.avatar_hash
  build_git_strategy                               = lookup(each.value.project, "build_git_strategy", null) == null ? var.default_project_build_git_strategy : each.value.project.build_git_strategy
  build_timeout                                    = lookup(each.value.project, "build_timeout", null) == null ? var.default_project_build_timeout : each.value.project.build_timeout
  builds_access_level                              = lookup(each.value.project, "builds_access_level", null) == null ? var.default_project_builds_access_level : each.value.project.builds_access_level
  ci_config_path                                   = lookup(each.value.project, "ci_config_path", null) == null ? var.default_project_ci_config_path : each.value.project.ci_config_path
  ci_default_git_depth                             = lookup(each.value.project, "ci_default_git_depth", null) == null ? var.default_project_ci_default_git_depth : each.value.project.ci_default_git_depth
  ci_forward_deployment_enabled                    = lookup(each.value.project, "ci_forward_deployment_enabled", null) == null ? var.default_project_ci_forward_deployment_enabled : each.value.project.ci_forward_deployment_enabled
  ci_separated_caches                              = lookup(each.value.project, "ci_separated_caches", null) == null ? var.default_project_ci_separated_caches : each.value.project.ci_separated_caches
  description                                      = lookup(each.value.project, "description", null) == null ? var.default_project_description : each.value.project.description
  container_registry_access_level                  = lookup(each.value.project, "container_registry_access_level", null) == null ? var.default_project_container_registry_access_level : each.value.project.container_registry_access_level
  default_branch                                   = lookup(each.value.project, "default_branch", null) == null ? var.default_project_default_branch : each.value.project.default_branch
  emails_disabled                                  = lookup(each.value.project, "emails_disabled", null) == null ? var.default_project_emails_disabled : each.value.project.emails_disabled
  external_authorization_classification_label      = lookup(each.value.project, "external_authorization_classification_label", null) == null ? var.default_project_external_authorization_classification_label : each.value.project.external_authorization_classification_label
  forked_from_project_id                           = lookup(each.value.project, "forked_from_project_id", null) == null ? var.default_project_forked_from_project_id : each.value.project.forked_from_project_id
  forking_access_level                             = lookup(each.value.project, "forking_access_level", null) == null ? var.default_project_forking_access_level : each.value.project.forking_access_level
  group_with_project_templates_id                  = lookup(each.value.project, "group_with_project_templates_id", null) == null ? var.default_project_group_with_project_templates_id : each.value.project.group_with_project_templates_id
  import_url                                       = lookup(each.value.project, "import_url", null) == null ? var.default_project_import_url : each.value.project.import_url
  initialize_with_readme                           = lookup(each.value.project, "initialize_with_readme", null) == null ? var.default_project_initialize_with_readme : each.value.project.initialize_with_readme
  issues_access_level                              = lookup(each.value.project, "issues_access_level", null) == null ? var.default_project_issues_access_level : each.value.project.issues_access_level
  issues_enabled                                   = lookup(each.value.project, "issues_enabled", null) == null ? var.default_project_issues_enabled : each.value.project.issues_enabled
  issues_template                                  = lookup(each.value.project, "issues_template", null) == null ? var.default_project_issues_template : each.value.project.issues_template
  lfs_enabled                                      = lookup(each.value.project, "lfs_enabled", null) == null ? var.default_project_lfs_enabled : each.value.project.lfs_enabled
  merge_commit_template                            = lookup(each.value.project, "merge_commit_template", null) == null ? var.default_project_merge_commit_template : each.value.project.merge_commit_template
  merge_method                                     = lookup(each.value.project, "merge_method", null) == null ? var.default_project_merge_method : each.value.project.merge_method
  merge_pipelines_enabled                          = lookup(each.value.project, "merge_pipelines_enabled", null) == null ? var.default_project_merge_pipelines_enabled : each.value.project.merge_pipelines_enabled
  merge_requests_access_level                      = lookup(each.value.project, "merge_requests_access_level", null) == null ? var.default_project_merge_requests_access_level : each.value.project.merge_requests_access_level
  merge_requests_enabled                           = lookup(each.value.project, "merge_requests_enabled", null) == null ? var.default_project_merge_requests_enabled : each.value.project.merge_requests_enabled
  merge_requests_template                          = lookup(each.value.project, "merge_requests_template", null) == null ? var.default_project_merge_requests_template : each.value.project.merge_requests_template
  merge_trains_enabled                             = lookup(each.value.project, "merge_trains_enabled", null) == null ? var.default_project_merge_trains_enabled : each.value.project.merge_trains_enabled
  only_allow_merge_if_all_discussions_are_resolved = lookup(each.value.project, "only_allow_merge_if_all_discussions_are_resolved", null) == null ? var.default_project_only_allow_merge_if_all_discussions_are_resolved : each.value.project.only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = lookup(each.value.project, "only_allow_merge_if_pipeline_succeeds", null) == null ? var.default_project_only_allow_merge_if_pipeline_succeeds : each.value.project.only_allow_merge_if_pipeline_succeeds
  operations_access_level                          = lookup(each.value.project, "operations_access_level", null) == null ? var.default_project_operations_access_level : each.value.project.operations_access_level
  packages_enabled                                 = lookup(each.value.project, "packages_enabled", null) == null ? var.default_project_packages_enabled : each.value.project.packages_enabled
  pages_access_level                               = lookup(each.value.project, "pages_access_level", null) == null ? var.default_project_pages_access_level : each.value.project.pages_access_level
  path                                             = lookup(each.value.project, "path", null) == null ? var.default_project_path : each.value.project.path
  printing_merge_request_link_enabled              = lookup(each.value.project, "printing_merge_request_link_enabled", null) == null ? var.default_project_printing_merge_request_link_enabled : each.value.project.printing_merge_request_link_enabled
  public_builds                                    = lookup(each.value.project, "public_builds", null) == null ? var.default_project_public_builds : each.value.project.public_builds
  remove_source_branch_after_merge                 = lookup(each.value.project, "remove_source_branch_after_merge", null) == null ? var.default_project_remove_source_branch_after_merge : each.value.project.remove_source_branch_after_merge
  repository_access_level                          = lookup(each.value.project, "repository_access_level", null) == null ? var.default_project_repository_access_level : each.value.project.repository_access_level
  repository_storage                               = lookup(each.value.project, "repository_storage", null) == null ? var.default_project_repository_storage : each.value.project.repository_storage
  request_access_enabled                           = lookup(each.value.project, "request_access_enabled", null) == null ? var.default_project_request_access_enabled : each.value.project.request_access_enabled
  requirements_access_level                        = lookup(each.value.project, "requirements_access_level", null) == null ? var.default_project_requirements_access_level : each.value.project.requirements_access_level
  resolve_outdated_diff_discussions                = lookup(each.value.project, "resolve_outdated_diff_discussions", null) == null ? var.default_project_resolve_outdated_diff_discussions : each.value.project.resolve_outdated_diff_discussions
  restrict_user_defined_variables                  = lookup(each.value.project, "restrict_user_defined_variables", null) == null ? var.default_project_restrict_user_defined_variables : each.value.project.restrict_user_defined_variables
  security_and_compliance_access_level             = lookup(each.value.project, "security_and_compliance_access_level", null) == null ? var.default_project_security_and_compliance_access_level : each.value.project.security_and_compliance_access_level
  shared_runners_enabled                           = lookup(each.value.project, "shared_runners_enabled", null) == null ? var.default_project_shared_runners_enabled : each.value.project.shared_runners_enabled
  skip_wait_for_default_branch_protection          = lookup(each.value.project, "skip_wait_for_default_branch_protection", null) == null ? var.default_project_skip_wait_for_default_branch_protection : each.value.project.skip_wait_for_default_branch_protection
  snippets_access_level                            = lookup(each.value.project, "snippets_access_level", null) == null ? var.default_project_snippets_access_level : each.value.project.snippets_access_level
  snippets_enabled                                 = lookup(each.value.project, "snippets_enabled", null) == null ? var.default_project_snippets_enabled : each.value.project.snippets_enabled
  squash_commit_template                           = lookup(each.value.project, "squash_commit_template", null) == null ? var.default_project_squash_commit_template : each.value.project.squash_commit_template
  squash_option                                    = lookup(each.value.project, "squash_option", null) == null ? var.default_project_squash_option : each.value.project.squash_option
  suggestion_commit_message                        = lookup(each.value.project, "suggestion_commit_message", null) == null ? var.default_project_suggestion_commit_message : each.value.project.suggestion_commit_message
  template_name                                    = lookup(each.value.project, "template_name", null) == null ? var.default_project_template_name : each.value.project.template_name
  template_project_id                              = lookup(each.value.project, "template_project_id", null) == null ? var.default_project_template_project_id : each.value.project.template_project_id
  use_custom_template                              = lookup(each.value.project, "use_custom_template", null) == null ? var.default_project_use_custom_template : each.value.project.use_custom_template
  visibility_level                                 = lookup(each.value.project, "visibility_level", null) == null ? var.default_project_visibility_level : each.value.project.visibility_level
  wiki_access_level                                = lookup(each.value.project, "wiki_access_level", null) == null ? var.default_project_wiki_access_level : each.value.project.wiki_access_level
  wiki_enabled                                     = lookup(each.value.project, "wiki_enabled", null) == null ? var.default_project_wiki_enabled : each.value.project.wiki_enabled
}
