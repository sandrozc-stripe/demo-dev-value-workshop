resource "stripe_product" "pro_plan" {
  name        = "Pro Plan"
  description = "Professional tier with advanced features"
}

resource "stripe_price" "pro_monthly" {
  product     = stripe_product.pro_plan.id
  currency    = "usd"
  unit_amount = 2900
recurring {
    interval = "month"
  }
}

resource "stripe_price" "pro_yearly" {
  product     = stripe_product.pro_plan.id
  currency    = "usd"
  unit_amount = 30000
recurring {
    interval = "year"
  }
}