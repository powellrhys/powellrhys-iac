# powellrhys-iac

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

This repository is your central infrastructure hub, hosting reusable GitHub Actions workflows and Terraform modules that you can share across all your projects. The feature/container_build_template branch introduces a container-build template and highlights existing modules used to deploy foundational Azure resources.

## Repository Structure

```
.
├── .github
│   └── actions/                    # Reusable GitHub Actions actions
│   └── workflows/                  # Reusable GitHub Actions workflows
├── terraform/
│   └── azure/
│       └── app_service/            # Terraform module for app service
│       └── app_service_plan/       # Terraform module for app service plans
│       └── storage_account/        # Terraform module for blob storage
├── infra/
│   └── azure/                      # Entry point to provision common resources
└── README.md                       # (You are here)
```

## Reusable Actions & Workflows

All GitHub Actions workflows live under .github/workflows. They are designed to be reusable and composable:

- `deploy-terraform.yml` - used to deploy common resources to the cloud
- `lint-codebase.yml` - used to lint the yaml codebase within this repository 
- `template-build-and-push-container.yml` - used to build and push containers to dockerhub (not an action as secrets are required within the template)
- `template-plan-apply-terraform.yml` - used to plan and apply terraform config to the cloud

All GitHub Actions actions live under .github/actions. They are designed to be reusable and composable:

- `lint-pyton/action.yml` - used to lint python code
- `lint-yaml/actions.yml` - used to lint yaml code

## Terraform Modules

### Azure

Under terraform/azure, you'll find reusable modules:

- `app_service` - Creates App Service to host one applications.
- `app_service_plan` - Creates App Service Plans to host one or more App Services.
- `storage_account` - Defines Azure Blob Storage accounts for project data storage.
