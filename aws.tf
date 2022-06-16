resource "aws_budgets_budget" "website" {
  name         = "monthly-website-budget"
  budget_type  = "COST"
  limit_amount = "0.00"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"
}
