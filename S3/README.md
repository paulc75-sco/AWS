# **AWS - S3 Bucket Deployment**

This Terraform script deploys a single S3 bucket with the following configuration:

- Public Access Enabled</br>
- Versioning enabled</br>
- Lifecycle policy for versioning for 30, 60 and 90 days to various storage tiers</br>
- Lifecycle policy for the bucket for 30, 60 and 90 days to various storage tiers</br>
- Seperate policy.tf file for configuring bucket policies</br>
</br>
The following outputs are configured:

- Buzcket Name</br>
- Bucket Domain Name</br>
- Bucket ARN</br>

![alt text](/images/s3.png)</br>


