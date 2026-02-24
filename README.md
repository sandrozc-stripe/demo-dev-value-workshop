# Stripe Developer Tools Workshop

A hands-on workshop demonstrating Stripe's developer tools for building and managing payment integrations.

## Overview

This workshop provides interactive Jupyter notebooks that guide you through essential Stripe developer tools:

| Lab | Topic | Duration | Description |
|-----|-------|----------|-------------|
| [01-api-testing](./01-api-testing/) | API Testing | 15 min | Test Stripe integrations with sandboxes, test cards, and test clocks |
| [02-webhook-integration](./02-webhook-integration/) | Event Handling | 15 min | Build a webhook server for Stripe events |
| [03-terraform-infrastructure](./03-terraform-infrastructure/) | Infrastructure as Code | 10 min | Manage Stripe resources with Terraform |


## Prerequisites

### Required Tools

- **Python 3.13+** - For running notebooks and webhook server
- **Stripe CLI** - For Lab 02 webhook testing
- **Terraform 1.0+** - For Lab 03
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

# Start with Lab 01
cd 01-api-testing

# Install Python dependencies
uv sync
source ./.venv/bin/activate
```


## Environment Setup

### Environment Variables

Create a `.env` file in the root directory:

```bash
# Required for all labs
STRIPE_API_KEY=sk_test_...

# Required for Lab 02 (Webhooks)
STRIPE_WEBHOOK_SECRET=whsec_...
```



## Resources

- [Stripe Documentation](https://stripe.com/docs)
- [Stripe API Reference](https://stripe.com/docs/api)
- [Stripe CLI Documentation](https://stripe.com/docs/cli)
- [Stripe Terraform Provider](https://registry.terraform.io/providers/stripe/stripe/latest/docs)
- [Stripe MCP](https://docs.stripe.com/mcp): Allows AI assistants (Claude, ChatGPT, Cursor...) to interact directly with your Stripe account. You can manage Stripe resources and consult documentation without leaving your development environment.
- [Webhooks](https://docs.stripe.com/webhooks): Real-time event notifications sent to your infrastructure for successful payments, disputes, or other triggers. For example, this allows you to automate sending emails to customers following a specific Stripe event you are monitoring.
- [Workflows](https://docs.stripe.com/workflows): A no-code automation tool within the Dashboard to create business logic similar to webhooks, but in a managed way. No deployment required.
- [Expand Fields](https://docs.stripe.com/expand): Allows you to retrieve related objects in a single API call instead of multiple requests. Useful for reducing latency and simplifying code.
- [Workbench](https://docs.stripe.com/workbench/overview): Available directly within the Stripe Dashboard, this is a browser-based toolkit for developers. It allows you to monitor and search through all API calls and events. You get full visibility into what’s happening in the Stripe account, and it even includes an integrated CLI.

## Support

For issues with this workshop, please open an issue in this repository.

For Stripe-specific questions, visit:
- [Stripe Support](https://support.stripe.com/)
- [Stripe Discord](https://discord.gg/stripe)
