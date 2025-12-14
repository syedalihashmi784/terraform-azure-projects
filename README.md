

Terraform Azure Projects

This repository contains a collection of Terraform projects built on Microsoft Azure.
The goal of this repository is to demonstrate Infrastructure as Code (IaC) concepts ranging from basic Terraform usage to advanced topics such as remote state management, modularization, and meta-arguments.

Each directory represents a standalone Terraform project and should be initialized and applied independently.


Repository Structure

├── cloud-project/
│
├── Remote-state-file/
│
└── VM-constraints-Meta-Args/


---

Project 1: Terraform Fundamentals (cloud-project)

What Was Built

* Initialized Terraform from scratch
* Deployed Azure Resource Group and Storage Account
* Configured the AzureRM provider
* Authenticated using an Azure Service Principal

What Was Learned

* Declarative Infrastructure as Code principles
* Terraform execution workflow: init, plan, apply, destroy
* Terraform state management and implicit dependencies

Challenges Faced

* Service principal authentication errors
* Temporary hard-coded subscription ID during development
* Debugging state drift when re-running terraform apply

---

Project 2: Terraform Remote State and Modularization (Remote-state-file)

What Was Built

* Split Terraform configuration into logical files:
  variables.tf, locals.tf, outputs.tf, and resource-specific files
* Configured a remote state backend using Azure Storage Account and Blob Container
* Implemented Terraform meta-arguments such as count, for_each, lifecycle rules, and variable validation

What Was Learned

* Importance of remote state for collaboration, locking, and drift prevention
* Terraform variable precedence (CLI > .tfvars > defaults)
* Writing reusable and scalable Terraform configurations

Challenges Faced

* Backend initialization failures due to incorrect container name or permissions
* Missing resource instance key errors when using count
* Managing backend re-initialization and state locking conflicts

---

Project 3: Terraform VM Deployment with Constraints and Meta-Arguments (VM-constraints-Meta-Args)

What Was Built

* Deployed an Azure Virtual Machine with full networking stack (VNET, Subnet, NIC)
* Enforced allowed regions and location validation
* Reused modular Terraform structure for clean scaling

What Was Learned

* Azure VM SKU availability varies by region
* Used Azure CLI to validate SKUs before deployment
* Terraform dependency graph automatically manages resource ordering
* Clean configuration using locals and validation blocks

Challenges Faced

* VM size unavailable in selected region
* Provider features block missing after refactoring files
* Indexing errors when scaling resources using count

---

Setup Instructions

Prerequisites

* Azure account
* Azure CLI installed
* Terraform installed


Provider Configuration
Open providers.tf or main.tf (depending on the project) and set the following values:

subscription_id

Do not commit real credentials. Use environment variables or a terraform.tfvars file when possible.

---

Terraform Commands

Navigate into the desired project directory and run:

terraform init

If reconfiguring a remote backend:

terraform init -reconfigure

Preview changes:

terraform plan

Apply infrastructure:

terraform apply

Destroy resources:

terraform destroy

---

Best Practices Followed

* Remote state management for collaboration
* Modular file structure
* Variable validation and constraints
* Explicit provider configuration
* Clean separation of concerns

---

Why This Project Matters

This repository demonstrates real-world Terraform and Azure experience, including infrastructure automation, scalable design, debugging cloud issues, and applying best practices for Infrastructure as Code.

---

