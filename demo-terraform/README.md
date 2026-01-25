# Stripe Terraform Demo

Terraform configuration that creates Stripe resources:

- **Product**: "Pro Plan" with description
- **Prices**: Monthly ($29) and Yearly ($300) recurring prices
- **Customer**: A test customer

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads) installed
2. Stripe API key set as environment variable:
   ```bash
   export STRIPE_API_KEY="sk_test_..."
   ```

## Usage

```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply changes
terraform apply
```

## Outputs

After applying, you'll get the price IDs for use in your integration:
- `price_id_monthly`
- `price_id_yearly`

