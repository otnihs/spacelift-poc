module "my_workerpool" {
  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=e954914020a5e1a561038cba27bb9d06438deba6"

  configuration = <<-EOT
    export SPACELIFT_TOKEN="${var.worker_pool_config}"
    export SPACELIFT_POOL_PRIVATE_KEY="${var.worker_pool_private_key}"
  EOT

  max_size          = 1
  ami_id            = "ami-00baf9444fedc7504"
  worker_pool_id    = "01FSRVG2ZXHK5KE9BXY5HZ6YY7"
  security_groups   = "sg-af4fbfa4"
  vpc_subnets       = [subnet-26ec9a7b, subnet-65c7472f]
}