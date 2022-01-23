resource "spacelift_stack" "example-stack" {

  name = var.new_stack_name

  administrative = true
  autodeploy = false
  branch = "pr-test"
  description = "Shared production infrastructure (networking, k8s)"
  repository = "spacelift-poc"
  terraform_version = "0.12.27"
}



