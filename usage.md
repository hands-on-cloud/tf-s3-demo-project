# S3 Bucket Terraform demo project

This is a demo project to illustrate, how to use tflint, Checkov, OPA, Terrascan, and Terratest to test Terraform project using CodeBuild and CodePipeline AWS services.

Check out [How to use CodePipeline CICD pipeline to test Terraform](https://hands-on.cloud/how-to-use-codepipeline-cicd-pipeline-to-test-terraform/) article for more information.

## Deployment

Modify [Infracost](https://github.com/infracost/infracost) SSM parameter store key name at [buildspec-infracost.yml](buildspec-infracost.yml).

Deploy module as usual:

```shell
terraform init
terraform apply -auto-approve
```

## Tier down

```sh
terraform destroy -auto-approve
```
