# Lab 01: Infrastructure as Code with Stripe

## Overview

Learn to manage Stripe resources using Terraform, the popular Infrastructure as Code tool. Create products, prices, and customers through declarative configuration files.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) 1.0+ installed
- Stripe test mode API key

## Learning Objectives

By completing this lab, you will:

1. Understand Infrastructure as Code concepts and benefits
2. Configure the Stripe Terraform Provider
3. Create and manage Stripe resources (Products, Prices, Customers)
4. Use Terraform state to track resources

## Duration

Estimated time: 45 minutes

## Contents

| Notebook | Description | Duration |
|----------|-------------|----------|
| `01_introduction.ipynb` | IaC concepts and Stripe provider overview | 15 min |
| `02_create_resources.ipynb` | Hands-on resource creation | 30 min |

## Quick Start

```bash
# Navigate to lab directory
cd 01-terraform-infrastructure

# Start with the introduction
jupyter notebook 01_introduction.ipynb
```

## Terraform Commands Reference

```bash
cd terraform/

# Set your API key
export STRIPE_API_KEY="sk_test_..."

# Initialize provider
terraform init

# Preview changes
terraform plan

# Apply configuration
terraform apply

# View outputs
terraform output

# Destroy resources (cleanup)
terraform destroy
```

## Resources Created

This lab creates the following Stripe resources:

- **Product**: "Pro Plan" with description
- **Prices**: Monthly ($29) and Yearly ($300) recurring prices
- **Customer**: A test customer

## Outputs

After applying, you'll get price IDs for use in your integration:
- `price_id_monthly`
- `price_id_yearly`

## Troubleshooting

### "Provider not found" Error

Run `terraform init` in the `terraform/` directory.

### "Authentication failed" Error

Verify your `STRIPE_API_KEY` environment variable is set correctly.

### Resources already exist

If resources were created previously, Terraform will detect and manage them. Use `terraform import` to import existing resources.

## Resources

- [Stripe Terraform Provider Docs](https://registry.terraform.io/providers/stripe/stripe/latest/docs)
- [Terraform Getting Started](https://learn.hashicorp.com/terraform)
