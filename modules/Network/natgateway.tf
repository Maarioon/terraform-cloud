resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.ig]

  tags = merge(
    var.tags,
    {
      Name            = format("%s-EIP", var.name)
      Environment     = var.environment,
      Owner-Email     = var.owner_email,
      Managed-By      = var.managed_by,
      Billing-Account = var.billing_account
    },
  )
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.ig]

  tags = merge(
    var.tags,
    {
      Name            = format("%s-Nat", var.name)
      Environment     = var.environment,
      Owner-Email     = var.owner_email,
      Managed-By      = var.managed_by,
      Billing-Account = var.billing_account
    },
  )
}