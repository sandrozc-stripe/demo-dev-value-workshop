# Lab 02: Webhook Integration

## Overview

Learn to receive and handle Stripe webhook events. Build a Flask server that processes payment events in real-time with proper signature verification.

## Prerequisites

- Python 3.13+
- [Stripe CLI](https://stripe.com/docs/stripe-cli) installed
- [uv](https://github.com/astral-sh/uv) package manager (recommended) or pip

## Learning Objectives

By completing this lab, you will:

1. Understand webhooks and why they matter
2. Implement webhook signature verification
3. Handle different Stripe event types
4. Test webhooks locally with Stripe CLI

## Duration

Estimated time: 15 minutes

## Contents

| Notebook | Description | Duration |
|----------|-------------|----------|
| `01_webhook_fundamentals.ipynb` | Webhook concepts and event types | 2 min |
| `02_build_server.ipynb` | Building the Flask webhook server | 3 min |
| `03_test_webhooks.ipynb` | Testing with Stripe CLI | 10 min |

## Quick Start

```bash
# Navigate to lab directory
cd 02-webhook-integration

# Install dependencies
uv sync
# or: pip install -r ../requirements.txt

# Start with the introduction
jupyter notebook 01_webhook_fundamentals.ipynb
```

## Running the Webhook Server

You'll need **3 terminals**:

```bash
# Terminal 1: Start the Flask server
source .venv/bin/activate
flask --app src/server run --port=4242

# Terminal 2: Forward Stripe events to your local server
stripe listen --forward-to localhost:4242/webhook

# Terminal 3: Trigger test events
stripe trigger payment_intent.succeeded
```

## Environment Variables

At the root of the repo create a `.env` file with:

```bash
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
```

**Note**: Get the webhook secret from `stripe listen` output when testing locally.

## Events Handled

The server we build handles these event types:
- `payment_intent.succeeded` - Logs successful payment amounts
- `payment_method.attached` - Placeholder for payment method handling

## Troubleshooting

### "Connection refused" Error

Make sure the Flask server is running on port 4242.

### "Signature verification failed" Error

1. Copy the `whsec_xxx` from `stripe listen` output
2. Update `STRIPE_WEBHOOK_SECRET` in your `.env` file
3. Restart the Flask server

### Events not reaching server

Verify `stripe listen` is running and forwarding to the correct port.

## Resources

- [Stripe Webhooks Documentation](https://stripe.com/docs/webhooks)
- [Stripe CLI Documentation](https://stripe.com/docs/cli)
- [Event Types Reference](https://stripe.com/docs/api/events/types)
