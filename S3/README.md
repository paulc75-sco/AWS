# **AWS - DynamoDB Deployment**
This Terraform script deploys a DynamoDB with a single table and secondary index:

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

![alt text](/images/ddb.png)</br>
