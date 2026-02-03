# Stripe Developer Tools Workshop

A hands-on workshop demonstrating Stripe's developer tools for building and managing payment integrations.

## Overview

This workshop provides interactive Jupyter notebooks that guide you through essential Stripe developer tools:

| Lab | Topic | Duration | Description |
|-----|-------|----------|-------------|
| [01-terraform-infrastructure](./01-terraform-infrastructure/) | Infrastructure as Code | 45 min | Manage Stripe resources with Terraform |
| [02-webhook-integration](./02-webhook-integration/) | Event Handling | 30 min | Build a webhook server for Stripe events |

## Prerequisites

### Required Tools

- **Python 3.13+** - For running notebooks and webhook server
- **Terraform 1.0+** - For Lab 01
- **Stripe CLI** - For Lab 02 webhook testing
- **Jupyter Notebook** - For interactive exercises

### Stripe Account

1. Sign up for a [Stripe account](https://dashboard.stripe.com/register)
2. Get your **test mode** API keys from the [Dashboard](https://dashboard.stripe.com/test/apikeys)

## Quick Start

```bash
# Clone the repository
git clone <repo-url>
cd stripe-developer-tools-workshop

# Create environment file
cp .env.example .env
# Edit .env with your Stripe API keys

# Install Python dependencies
pip install -r requirements.txt
# or with uv:
uv sync

# Start with Lab 01
cd 01-terraform-infrastructure
jupyter notebook 01_introduction.ipynb
```

## Workshop Structure

Each lab follows a consistent pattern:

```
XX-lab-name/
├── README.md                    # Lab overview and setup
├── 01_introduction.ipynb        # Concepts and theory
├── 02_main_exercise.ipynb       # Hands-on practice
└── src/ or terraform/           # Source code
```

### Notebook Flow

1. **Introduction notebook** - Learn the concepts
2. **Exercise notebook(s)** - Apply hands-on
3. **Checkpoints** - Verify your progress
4. **Summary** - Review key takeaways

## Environment Setup

### Environment Variables

Create a `.env` file in the root directory:

```bash
# Required for all labs
STRIPE_API_KEY=sk_test_...

# Required for Lab 02 (Webhooks)
STRIPE_WEBHOOK_SECRET=whsec_...
```

### Installing Dependencies

```bash
# Option 1: pip
pip install stripe python-dotenv jupyter flask

# Option 2: uv (recommended)
uv sync
```

## Running the Workshop

### For Self-Paced Learning

1. Start with Lab 01, complete all notebooks in order
2. Each lab builds on concepts from previous labs
3. Follow checkpoints to verify your progress

### For Live Demos

1. Clear notebook outputs before presenting:
   ```bash
   jupyter nbconvert --clear-output --inplace **/*.ipynb
   ```
2. Have Stripe Dashboard open alongside notebooks
3. Use presenter notes (HTML comments) for talking points
4. Follow the three-terminal setup for webhook demos

## Adding New Labs

See [CLAUDE.md](./CLAUDE.md) for conventions and guidelines on creating new labs.

Use the templates in `templates/` as starting points:
- `templates/lab-template/` - Full lab structure
- `templates/notebook-template.ipynb` - Notebook template

## Resources

- [Stripe Documentation](https://stripe.com/docs)
- [Stripe API Reference](https://stripe.com/docs/api)
- [Stripe CLI Documentation](https://stripe.com/docs/cli)
- [Stripe Terraform Provider](https://registry.terraform.io/providers/stripe/stripe/latest/docs)

## Support

For issues with this workshop, please open an issue in this repository.

For Stripe-specific questions, visit:
- [Stripe Support](https://support.stripe.com/)
- [Stripe Discord](https://discord.gg/stripe)
