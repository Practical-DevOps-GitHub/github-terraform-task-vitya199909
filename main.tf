terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}
locals {
  repo_name          = "github-terraform-task-vitya199909"
  user_name          = "softservedata"
  pr_tmplt_content   = <<EOT
  ### Describe your changes

  ### Issue ticket number and link
  
  ### Checklist before requesting a review
  - [ ] I have performed a self-review of my code
  - [ ] If it is a core feature, I have added thorough tests
  - [ ] Do we need to implement analytics?
  - [ ] Will this be part of a product update? If yes, write one phrase about the update
  EOT
}
resource "github_branch" "develop_branch" {
  repository  = local.repo_name
  branch      = "develop"
}

resource "github_branch_default" "develop_branch_default" {
  repository = local.repo_name
  branch     = github_branch.develop_branch.branch
}
