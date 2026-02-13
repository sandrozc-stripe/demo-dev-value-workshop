# Lab 01: API Testing with Stripe

## Overview

Learn to test your Stripe integration using sandboxes, test cards, and test clocks. Master essential API features like `expand` and `metadata` fields. Simulate successful payments, declined transactions, and subscription lifecycle events without moving real money.

## Prerequisites

- Python 3.13+
- Stripe account with sandbox access

## Learning Objectives

By completing this lab, you will:

1. Understand Stripe sandboxes and their benefits
2. Use test cards to simulate successful and failed payments
3. Implement proper error handling for declined payments
4. Use the `expand` parameter to retrieve related objects efficiently
5. Leverage `metadata` for custom data storage on Stripe objects
6. Use test clocks to simulate subscription lifecycle events

## Duration

Estimated time: 15 minutes

## Contents

| Notebook | Description | Duration |
|----------|-------------|----------|
| `01_introduction.ipynb` | Sandboxes, expand, and metadata | 5 min |
| `02_sandbox_and_test_cards.ipynb` | Test card payments | 5 min |
| `03_test_clocks.ipynb` | Time simulation for subscriptions | 20 min |

## Quick Start

```bash
# Navigate to lab directory
cd 01-api-testing

# Sync depedencies
uv sync

# Activate virtual environment
source .venv/bin/activate
```

## Environment Variables

This lab requires the following in your `.env` file:

```bash
STRIPE_API_KEY=sk_test_...
```

## Test Cards Reference

| Scenario | Card Number | PaymentMethod |
|----------|-------------|---------------|
| Success (Visa) | 4242424242424242 | `pm_card_visa` |
| Success (Mastercard) | 5555555555554444 | `pm_card_mastercard` |
| Declined | 4000000000000002 | `pm_card_visa_chargeDeclined` |
| Insufficient Funds | 4000000000009995 | `pm_card_visa_chargeDeclinedInsufficientFunds` |

## Key API Features

### Expand Parameter

Retrieve related objects in a single API call:

```python
# Without expand: payment_method is just an ID string
payment_intent = stripe.PaymentIntent.retrieve("pi_xxx")

# With expand: payment_method is the full object
payment_intent = stripe.PaymentIntent.retrieve(
    "pi_xxx",
    expand=["payment_method", "customer"]
)
```

### Metadata Field

Store custom key-value data on any Stripe object:

```python
customer = stripe.Customer.create(
    email="user@example.com",
    metadata={
        "internal_id": "usr_12345",
        "plan_tier": "enterprise",
        "signup_source": "marketing_campaign"
    }
)
```

## Troubleshooting

### "Invalid API key" Error

**Symptom**: `AuthenticationError: Invalid API Key provided`

**Solution**: Ensure your `.env` file contains a valid sandbox API key starting with `sk_test_`.

### Test clock not advancing

**Symptom**: Clock status stays in "advancing" state

**Solution**: Test clocks can only advance up to 2 intervals at a time. For monthly subscriptions, advance a maximum of 2 months per call. Wait for clock status to become "ready" before advancing again.

### Customer not found for test clock

**Symptom**: Customer created with test clock doesn't appear in customer list

**Solution**: Customers created with test clocks don't appear in the default customer list. Use the `test_clock` parameter when listing customers, or query directly by customer ID.

### PaymentIntent requires confirmation

**Symptom**: `PaymentIntent status is requires_action`

**Solution**: When using `pm_card_visa` directly, ensure you include `automatic_payment_methods={"enabled": True, "allow_redirects": "never"}` and `confirm=True` in the create call.

## Resources

- [Stripe Testing Documentation](https://docs.stripe.com/testing)
- [Test Cards Reference](https://docs.stripe.com/testing#cards)
- [Test Clocks Guide](https://docs.stripe.com/billing/testing/test-clocks)
- [Sandboxes Overview](https://docs.stripe.com/sandboxes)
- [Expanding Responses](https://docs.stripe.com/expand)
- [Metadata Guide](https://docs.stripe.com/metadata)
