resource "aws_budgets_budget" "website" {
  name         = "monthly-website-budget"
  budget_type  = "COST"
  limit_amount = "10.00"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"
}
