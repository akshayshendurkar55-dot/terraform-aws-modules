# VPC Module Example

This example demonstrates how to consume the reusable AWS VPC module from `../../modules/vpc`.

## Architecture & Subnet Layout

- **VPC CIDR:** `10.0.0.0/16`
- **Availability Zones:** 2 AZs (`ap-south-1a`, `ap-south-1b`)
- **Public Subnets:** `10.0.1.0/24` (AZ 1a) and `10.0.2.0/24` (AZ 1b) with `map_public_ip_on_launch = true` and default route (`0.0.0.0/0`) via the Internet Gateway.
- **Private Subnets:** `10.0.11.0/24` (AZ 1a) and `10.0.12.0/24` (AZ 1b) with `map_public_ip_on_launch = false`.

> [!NOTE]
> **NAT Gateway Notice:**
> The private subnets in this module currently do **not** include a NAT Gateway. They are designed to be isolated backend subnets (for databases or internal microservices) with local VPC routing only. This avoids AWS NAT Gateway idle charges (~$32/month per AZ + data processing fees) while maintaining a production-ready subnet layout.

## Running the Example

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
```
