output "price_id_monthly" {
  value = stripe_price.pro_monthly.id
}
output "price_id_yearly" {
  value = stripe_price.pro_yearly.id
}
output "customer" {
  value = stripe_customer.acme.id
}