# Stripe Webhooks Demo

A Flask server that receives and handles Stripe webhook events.

## Prerequisites

1. [Stripe CLI](https://stripe.com/docs/stripe-cli) installed
2. [uv](https://github.com/astral-sh/uv) package manager

## Setup

```bash
# Create virtual environment and install dependencies
uv sync

# Activate virtual environment
source .venv/bin/activate

# Create .env file with your keys
echo 'STRIPE_SECRET_KEY=sk_test_...' >> .env
echo 'STRIPE_WEBHOOK_SECRET=whsec_...' >> .env
```

> **Tip**: Get your webhook secret by running `stripe listen` — it will display the signing secret.

## Running

You'll need **3 terminals**:

```bash
# Terminal 1: Start the Flask server
flask --app server run --port=4242

# Terminal 2: Forward Stripe events to your local server
stripe listen --forward-to localhost:4242/webhook

# Terminal 3: Trigger test events
stripe trigger payment_intent.succeeded
```

## Events handled
- payment_intent.succeeded
- payment_method.attached