# Why deploy k8s with Terraform?
While you could use kubectl or similar CLI-based tools to manage your Kubernetes resources, using Terraform has the following benefits for our runners deploymemt:
## `Unified Workflow`
- If you are already provisioning Kubernetes clusters with Terraform, use the same configuration language to deploy your applications into your cluster.

## `Full Lifecycle Management` 
- Terraform doesn't only create resources, it updates, and deletes tracked resources without requiring you to inspect the API to identify those resources.

## Description
This project is meant to automate the creation of git action runners using helm provider and kubectl provider within terraform.
- runners could be created at the repository level as well as the organization level

## To create a runner in this project go to the `terraform.tfvars`

## oraganization runners
### NOTE: the `minreplicas` takes presidence over `replicas` when horizontal autoscaling is define for the action runners
```hcl
github_organizations = [
  {
    name     = "runner-name"
    replicas = 1
    label    = "lable-name"
    group    = "group-name"
  }
]

horizontal_runner = [
  {
    name        = "runner-name"
    minreplicas = 3
    maxreplicas = 9
  }
]
```

## repository runners

```hcl
github_repositories = [
  {
    name     = "Travelport-Enterprise/iaas-example-a"
    replicas = 2
    label    = "aws-eks"
    minreplicas = 3
    maxreplicas = 10
  }
]

```

```csv
 name,replicas,label,group
 runner-name,1,lable-name,group-name
```
## Steps to set & assume aws role
```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
aws sts get-caller-identity
aws sts assume-role --role-arn arn:aws:iam::181437319056:role/Role_For-S3_Creation --role-session-name kubectl-Session
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
aws eks --region us-east-1 update-kubeconfig --name Kojitechs_aws_eks_cluster
aws sts get-caller-identity
```
## kubectl commands
```bash
kubectl get pods --all-namespaces
kubectl get pods -n actions-runner-system
kubectl get pods,svc,namespaces,deployments,no,rs,ds --all-namespaces
```
<!-- prettier-ignore-start -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helm_configuration"></a> [helm\_configuration](#module\_helm\_configuration) | ./modules | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arc_chart_version"></a> [arc\_chart\_version](#input\_arc\_chart\_version) | GitHub Runner Controller Helm chart version. | `string` | `"0.20.2"` | no |
| <a name="input_arc_namespace"></a> [arc\_namespace](#input\_arc\_namespace) | action runner's  namespace name | `string` | `"actions-runner-system"` | no |
| <a name="input_arc_repo_url"></a> [arc\_repo\_url](#input\_arc\_repo\_url) | GitHub Runner Controller Helm repository name. | `string` | `"https://actions-runner-controller.github.io/actions-runner-controller"` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | Environment this template would be deployed to | `map(string)` | `{}` | no |
| <a name="input_cert_chart_version"></a> [cert\_chart\_version](#input\_cert\_chart\_version) | HELM Chart Version for cert-manager | `string` | `"1.9.1"` | no |
| <a name="input_cert_repoitory"></a> [cert\_repoitory](#input\_cert\_repoitory) | GitHub Runner Controller Helm repository name. | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | This varible contains token use to manage access to create an manage runners at orgs/repository level | `string` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | target state bucket to deploy action runners | `string` | `"kojitechs.aws.eks.with.terraform.tf"` | no |
| <a name="input_state_bucket_key"></a> [state\_bucket\_key](#input\_state\_bucket\_key) | target state bucket to deploy | `string` | `"env:/sbx/path/env"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
