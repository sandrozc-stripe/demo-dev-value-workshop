# CLAUDE.md - Stripe Developer Tools Workshop

## Workshop Overview

A hands-on workshop for Stripe prospects and customers demonstrating developer tools including Terraform provider, webhooks, and API integrations. Uses Jupyter notebooks for interactive, walkable demos.

**Target Audience**: Stripe prospects and customers
**Format**: Sequential labs with Jupyter notebooks
**Inspired by**: [AWS Bedrock AgentCore Workshop](https://github.com/aws-samples/sample-amazon-bedrock-agentcore-prototype-to-production)

---

## Repository Structure

### Folder Naming Convention

Labs use numbered prefixes for sequential completion:

```
XX-descriptive-name/
```

- `01-terraform-infrastructure/` - Infrastructure as Code with Stripe
- `02-webhook-integration/` - Event handling with webhooks
- Numbers indicate recommended completion order

### Standard Lab Structure

Every lab MUST contain:

```
XX-lab-name/
├── README.md                    # Overview, prerequisites, learning objectives
├── 01_introduction.ipynb        # Concepts and theory (markdown-heavy)
├── 02_main_exercise.ipynb       # Primary hands-on exercise
├── [03_advanced.ipynb]          # Optional advanced content
└── src/ or terraform/           # Source code files
```

---

## File Naming Conventions

### Jupyter Notebooks

- **Format**: `XX_descriptive_name.ipynb`
- **XX**: Two-digit number (01, 02, 03...)
- **Separator**: Underscores, not hyphens
- **Examples**:
  - `01_introduction.ipynb`
  - `02_create_resources.ipynb`
  - `03_test_and_validate.ipynb`

### Source Code

- **Python**: `snake_case.py` (e.g., `webhook_server.py`)
- **Terraform**: `resource_type.tf` (e.g., `products.tf`, `customers.tf`)
- **Configuration**: `lowercase.ext` (e.g., `.env.example`, `config.yaml`)

---

## Jupyter Notebook Structure

### Required Cell Pattern

Every notebook should follow this structure:

#### 1. Header Cell (Markdown)

```markdown
# Notebook Title

**Lab**: XX-lab-name
**Duration**: ~XX minutes
**Prerequisites**: [List prerequisites]

## Learning Objectives

By the end of this notebook, you will:
- Objective 1
- Objective 2
- Objective 3

---
```

#### 2. Setup Cell (Code)

```python
# Environment setup
import os
from dotenv import load_dotenv
import stripe

load_dotenv()
stripe.api_key = os.environ.get('STRIPE_API_KEY')

# Verify connection
account = stripe.Account.retrieve()
print(f"Connected to Stripe account: {account.id}")
print(f"Mode: {'Test' if 'test' in stripe.api_key else 'Live'}")
```

#### 3. Concept Cells (Markdown)

- Explain concepts BEFORE showing code
- Use diagrams where helpful
- Include links to Stripe documentation

#### 4. Exercise Cells (Code)

- Clear comments explaining each step
- Executable in sequence
- Include expected output in comments

#### 5. Checkpoint Cells (Markdown)

```markdown
### Checkpoint

At this point, you should see:
- [Expected state 1]
- [Expected state 2]

**Dashboard**: Navigate to [Products](https://dashboard.stripe.com/test/products) to view the created resource.
```

#### 6. Summary Cell (Markdown)

```markdown
## Summary

In this notebook, you learned:
- Key takeaway 1
- Key takeaway 2

## Next Steps

Continue to `02_next_notebook.ipynb` to learn about...
```

---

## Creating New Labs

### Step-by-Step Process

1. **Create Lab Folder**
   ```bash
   mkdir XX-new-lab-name
   cd XX-new-lab-name
   ```

2. **Copy Template Structure**
   ```bash
   cp -r ../templates/lab-template/* .
   ```

3. **Update README.md**
   - Set lab title and description
   - Define prerequisites (which labs must be completed first)
   - List learning objectives
   - Estimate duration

4. **Create Notebooks**
   - Start from `../templates/notebook-template.ipynb`
   - Follow the cell pattern defined above
   - Number sequentially: 01, 02, 03...

5. **Add Source Code**
   - Place in `src/` (Python) or `terraform/` (IaC) directory

6. **Test the Lab**
   - Run all notebooks in sequence
   - Verify all code cells execute without errors
   - Test on a fresh environment

### Lab Checklist

Before submitting a new lab, verify:

- [ ] README.md complete with objectives and prerequisites
- [ ] All notebooks run sequentially without errors
- [ ] Environment variables documented in root `.env.example`
- [ ] No hardcoded API keys or secrets
- [ ] Tested with test mode Stripe keys only

---

## Live Demo Guidelines

### Preparation

1. **Clear all outputs** before the demo:
   ```bash
   jupyter nbconvert --clear-output --inplace *.ipynb
   ```

2. **Verify environment**:
   - Test API keys are set
   - All dependencies installed
   - Network connectivity confirmed

3. **Have Stripe Dashboard open** alongside notebooks

### Demo Flow Best Practices

- Start with the conceptual overview (markdown cells)
- Execute code cells one at a time
- Pause after each cell to explain output
- Reference Dashboard to show created resources
- Have backup slides ready for network issues

### Presenter Notes

Add presenter notes as HTML comments in markdown cells:

```markdown
<!-- PRESENTER: Pause here to show the Stripe Dashboard -->
<!-- PRESENTER: Ask audience if they have questions before continuing -->
```

### Reset Script

Each lab should include a `reset.sh` script:

```bash
#!/bin/bash
# Reset lab to initial state
jupyter nbconvert --clear-output --inplace *.ipynb
echo "Lab reset complete"
```

---

## Environment and Dependencies

### Required Environment Variables

```bash
# Required for all labs
STRIPE_API_KEY=sk_test_...        # Stripe secret key (test mode only!)

# Lab-specific
STRIPE_WEBHOOK_SECRET=whsec_...   # For webhook labs
```

### Python Dependencies

All labs share common dependencies (install from root):

```bash
pip install -r requirements.txt
# or with uv:
uv sync
```

**Core packages**:
- `stripe>=14.0.0`
- `python-dotenv>=1.0.0`
- `jupyter>=1.0.0`
- `ipykernel>=6.0.0`
- `flask>=3.0.0`

### Terraform Requirements

- **Version**: >= 1.0.0
- **Provider**: stripe/stripe >= 0.1.3

---

## Stripe Workshop Conventions

### API Key Handling

- **NEVER** commit real API keys
- **ALWAYS** use environment variables
- **ONLY** use test mode keys (`sk_test_`, `pk_test_`)
- Document required keys in `.env.example`

### Resource Naming

When creating Stripe resources in demos:

- **Products**: `Workshop - [Product Name]`
- **Metadata**: Use `workshop-` prefix
- **Descriptions**: Include clear, descriptive text

### Error Handling Pattern

```python
import stripe

try:
    result = stripe.PaymentIntent.create(
        amount=2000,
        currency="usd",
    )
except stripe.error.CardError as e:
    print(f"Card declined: {e.user_message}")
except stripe.error.InvalidRequestError as e:
    print(f"Invalid request: {e}")
except stripe.error.AuthenticationError as e:
    print(f"Authentication failed: {e}")
except stripe.error.StripeError as e:
    print(f"Stripe error: {e}")
```

### Dashboard References

Always link to relevant Dashboard pages:

```markdown
**Dashboard**: View your products at [Products](https://dashboard.stripe.com/test/products)
```

---

## Available Labs

| Lab | Topic | Duration | Prerequisites |
|-----|-------|----------|---------------|
| 01-terraform-infrastructure | Infrastructure as Code with Stripe | 45 min | Terraform installed |
| 02-webhook-integration | Event handling with webhooks | 30 min | Stripe CLI installed |

---

## Commands Reference

### Running a Lab

```bash
# Navigate to lab directory
cd XX-lab-name

# Activate virtual environment
source ../.venv/bin/activate  # or: uv sync

# Start Jupyter
jupyter notebook 01_introduction.ipynb
```

### Terraform Labs

```bash
cd 01-terraform-infrastructure/terraform/
export STRIPE_API_KEY="sk_test_..."
terraform init
terraform plan
terraform apply
```

### Webhook Labs

```bash
# Terminal 1: Start Flask server
cd 02-webhook-integration
flask --app src/server run --port=4242

# Terminal 2: Forward Stripe webhook events
stripe listen --forward-to localhost:4242/webhook

# Terminal 3: Trigger test events
stripe trigger payment_intent.succeeded
```

---

## Troubleshooting

### Common Issues

1. **"Missing STRIPE_API_KEY"**
   - Ensure `.env` file exists with valid key
   - Check `load_dotenv()` is called before accessing env vars

2. **Terraform provider not found**
   - Run `terraform init` in the terraform directory
   - Verify internet connectivity

3. **Webhook signature verification failed**
   - Ensure `STRIPE_WEBHOOK_SECRET` matches the secret from `stripe listen`
   - Use the `whsec_` value shown when running `stripe listen`

4. **Jupyter kernel not found**
   - Install ipykernel: `pip install ipykernel`
   - Register kernel: `python -m ipykernel install --user`
