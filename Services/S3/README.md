# **AWS - S3 Deployment**
This Terraform script deploys a S3 bucket with the following configurations:

- Public Access Enabled</br>
- Versioning enabled</br>
- Lifecycle policy for versioning for 30, 60 and 90 days to various storage tiers</br>
- Lifecycle policy for the bucket for 30, 60 and 90 days to various storage tiers</br>
- Seperate policy.tf file for configuring bucket policies</br>
</br>
The following outputs are configured:

- Bucket Name</br>
- Bucket Domain Name</br>
- Bucket ARN</br>
- Bucket Region
</br>

## Actions Required
Create a terraform.tfvars file and add the following to the file.  Update <insert value> with your required bucket name

bucketname = "Insert Value"

</br>
![alt text](/images/s3.png)</br>
