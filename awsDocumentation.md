# Deploying 2 tier Sparta app in AWS
- [Deploying 2 tier Sparta app in AWS](#deploying-2-tier-sparta-app-in-aws)
- [Creating the VMs](#creating-the-vms)
  - [Security groups](#security-groups)
- [Accessing the VMs](#accessing-the-vms)
- [Running the app](#running-the-app)


# Creating the VMs
To create both the app and database VMS:
1. Navigate to the EC2 menu
2. Press launch instance
3. Ubuntu 24.04
4. t3.micro
5. Add public SSH key

## Security groups
For both VMs create a new security group then click edit for more precise control. Name the security group appropriately and allow the following traffic:

For the app VM:
* SSH
* HTTP

For the database VM:
* SSH
* Custom TCP, port 27017

# Accessing the VMs
To SSH into a VM instance use the following command:
```
ssh -i [private-key] ubuntu@[instance-public-dns]
```

# Running the app
1. On the databse VM, copy over the database deployment script and run it.
2. On the app VM, copy over the app deployment script, making sure to use the database's private IP in the DB_HOST environment variable, then run the script.
3. Access the webapp through the app VM's public IP (no need to specify port 3000). Adding /posts to the URL should go to the seeded post page.