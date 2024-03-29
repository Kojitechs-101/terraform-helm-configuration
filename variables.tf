
variable "state_bucket" {
  type        = string
  description = "target state bucket to deploy action runners"
  default     = "kojitechs.aws.eks.with.terraform.tf"
}

variable "aws_account_id" {
  description = "Environment this template would be deployed to"
  type        = map(string)
  default     = {}
}


variable "state_bucket_key" {
  type        = string
  description = "target state bucket to deploy"
  default     = "env:/sbx/path/env"
}

variable "github_token" {
  description = "This varible contains token use to manage access to create an manage runners at orgs/repository level "
  type        = string
  sensitive   = true

}

variable "cert_chart_version" {
  type        = string
  description = "HELM Chart Version for cert-manager"
  default     = "1.9.1"
}

variable "arc_chart_version" {
  type        = string
  default     = "0.20.2"
  description = "GitHub Runner Controller Helm chart version."
}

variable "arc_repo_url" {
  type        = string
  default     = "https://actions-runner-controller.github.io/actions-runner-controller"
  description = "GitHub Runner Controller Helm repository name."
}

variable "cert_repoitory" {
  type        = string
  default     = "https://charts.jetstack.io"
  description = "GitHub Runner Controller Helm repository name."
}
variable "arc_namespace" {
  type        = string
  default     = "actions-runner-system"
  description = "action runner's  namespace name"
}
