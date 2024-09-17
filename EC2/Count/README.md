# **AWS - EC2 instances with count**
This Terraform script deploys 3 EC2 instances using the count function

The naming of the servers uses interpolation to number the tag name.  A +1 is added to the index.count to start the naming from 1 instead of 0.


The following outputs are configured:

- Public Ip</br>
- Public DNS Name</br>
- 
</br>

## Actions Required
Create a terraform.tfvars file and add the following to the file.  Update <insert value> with your required bucket name

bucketname = 
ami                         = "Insert Value"
associate_public_ip_address = "Insert Value"
instance_type               = "Insert Value"


</br>

