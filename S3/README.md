# **AWS - S3 Bucket Deployment*

This Terraform script deploys a single S3 bucket with the following configuration:

-Public Access Enabled
-Versioning enabled
-Lifecycle policy for versioning for 30, 60 and 90 days to various storage tiers
-Lifecycle policy for the bucket for 30, 60 and 90 days to various storage tiers
-Seperate policy.tf file for configuring bucket policies

The following outputs are configured:

-BUcket Name
-Bucket Domain Name
-Bucket ARN


