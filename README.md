# Project 2 — S3 Static Website

Deployed a personal portfolio site to AWS S3 with public access policies 
and static website hosting — all infrastructure provisioned with Terraform.

**Live Site:** http://teng-lee-portfolio.s3-website-us-east-1.amazonaws.com

---

## What This Project Does

- Creates an S3 bucket on AWS
- Enables static website hosting
- Configures public access policy so anyone can visit the site
- Outputs the live URL after deployment

---

## Infrastructure

| File | Purpose |
|---|---|
| `main.tf` | S3 bucket, website hosting, public access policy |
| `variables.tf` | Bucket name variable |
| `outputs.tf` | Website URL output |
| `index.html` | Portfolio page content |

---

## How It Works

S3 normally keeps all files private by default. To host a public 
website I had to do three things in order:

1. Create the bucket
2. Remove the public access block that AWS enables by default
3. Attach a bucket policy that grants read access to everyone

The order matters — attaching the policy before removing the 
access block will fail. Terraform handles this automatically 
using `depends_on`.

## What I Learned

- S3 bucket policies use JSON to define who can access what
- AWS blocks public access by default and requires explicit opt-in
- Terraform `depends_on` controls the order resources are created
- Static website hosting and object storage are two different S3 modes
- Infrastructure as Code means the entire setup is reproducible 
  by running three commands

---

## Services & Tools

- **AWS:** S3
- **IaC:** Terraform
- **CLI:** AWS CLI
- **OS:** Ubuntu 24.04

---

## How To Deploy

```bash
terraform init
terraform plan
terraform apply
aws s3 cp index.html s3://teng-lee-portfolio/index.html
```

---

## Author

Teng Lee | CS Student
[github.com/TGLEE4](https://github.com/TGLEE4)
