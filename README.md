
# Project Setup.

Install pre-commit hooks before working.

```bash
pre-commit install
```

First of all create a new workspace according to your need by running the following command.

```bash
./do new {env} #where env can be dev/prod/uat or anything.
```

This will create a new workspace and switch to it.  Also a new file is created in ./env called `{env}.tfvars`.

Passing the environment name is mandatory while running the script because it avoids having any configuration related issues in the future. If you have long running tasks just export your `env` in the terminal by running the following command.

```bash
export ENV=dev
```

## Other commands.

```
./do plan
Usage: ./do <command> [<args>]
Commands:
  plan
  destroy
  init
  apply
  gen
  new <name>
  help
```

If you ha


<hr />

# terraform-docs


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to store the Terraform state | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy infrastructure in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

