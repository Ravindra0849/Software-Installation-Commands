Terraform Interview Questions
=============================

1. What is Terraform?
Answer: Terraform is an open-source infrastructure as code (IaC) tool used for provisioning and managing infrastructure resources.

2. How does Terraform maintain the state of the infrastructure?
Answer: Terraform maintains the state of the infrastructure in a file (by default named terraform.tfstate). This file keeps track of the resources that have been created and their current state.

3. What is the purpose of the terraform init command?
Answer: terraform init initializes a working directory containing Terraform configuration files. It downloads the provider plugins and sets up the backend.

4. Explain the difference between terraform apply and terraform plan.
Answer: terraform plan shows the execution plan without making any changes, while terraform apply executes the plan and makes the necessary changes to the infrastructure.

5. Explain the concept of Terraform workspaces.
Answer: Terraform workspaces allow you to manage multiple environments or configurations from a single set of Terraform configuration files.

6. What is the remote state in Terraform, and why is it important?
Answer: Remote state in Terraform refers to storing the state file in a remote location, like an object storage service. It helps in collaboration and allows multiple users to work on the same infrastructure.

7. Describe how to handle sensitive information (secrets) in Terraform.
Answer: Sensitive information can be handled using Terraform variables, environment variables, or a secret management tool. Avoid hardcoding sensitive data directly in the configuration files.

8. Explain the purpose of provisioners in Terraform.
Answer: Provisioners in Terraform are used to execute scripts on local or remote machines as part of resource creation or destruction. They are typically used for tasks like configuration management or initializing resources.

9. How can you implement conditional logic in Terraform?
Answer: Conditional logic in Terraform can be implemented using the count and for each meta-argument, as well as dynamic block constructs. These allow resources to be conditionally created based on certain conditions.

10. Explain the concept of Infrastructure as Code (IaC)
Answer: IaC is a practice that involves managing and provisioning infrastructure through machine-readable script files rather than physical hardware configuration or interactive configuration tools.


2) what is providers in terraform?
Ans: A provider is a plugin that enable interact with the API. The provider is specified in terraform configuration code.

3) What is the diffrence b/w Terraform and Ansible?
Ans: Terraform and Ansible both are open source tools that can perform orchestration and Configuration tasks. Terraform is primarily used for infrastructure provisioning and Ansible is mainly used for Configuration management.

4) Can you write a code for EC2 and VPC?
Ans: Yes, I will write the code for EC2 and VPC.

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "new_ec2" {
    provider = aws.mumbai
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"
    key_name = "Minikube_Ravi"

    tags = {
        Name = "Ec2_instance"
    }
}

5) Is there any Possibility to create internet gateway via VPC without Subnet?
Ans: Yes, We can create the internet gateway after creation of VPC.

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "my_IGW" {
    vpc_id = aws_vpc.my_vpc.id
}

6) What are the commands you used in Terraform? 
Ans: 
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform destroy
terraform workspace

7) what is terraform statefile?
Ans: Terraform State file store all the information of our infrastructure in the form of Json Format. if any changes done in our infrastructure script, it will do changes in terraform statefile while execution of apply command.

8) Explain some Terraform comands with breif explanation?
Ans: 
terraform init: it will intialise the current repo and install required plugins and dependencies.
terraform validate: it will check the code is correct or not.
terraform fmt: it will generate the code is in correct format.
terraform plan: it will generate the blue print of the code, how many resources are going to be added.
terraform apply: it will execute the script and create the resources in side the cloud.
terraform destroy: it will delete all the resources, which are created inside the cloud.
terraform workspace: it will create the diffrent environments for our requirements.
terraform refresh: it will check any manual modification will be done in cloud level, it will be reflecting in statefile.
terraform taint: it will delete the tainted resource when we are executing the terraform apply command.

9) Can you write a code for multiple Providers?
Ans: Yes, I will write the code for Multiple Providers

provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}

provider "aws" {
    region = "us-east-1"
    alias = "n_virgenia"
}

10) How can you write a code to deploy into multiple region?
Ans: Yes, I will write the code for multiple regions.

provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}

provider "aws" {
    region = "us-east-1"
    alias = "n_virgenia"
}

resource "aws_vpc" "my_vpc" {
    provider = aws.mumbai
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "n_virgenia_vpc" {
    provider = aws.n_virgenia
    cidr_block = "172.31.0.0/16"
}

11) To create a Multiple Environments in terraform what is the command?
Ans: 
terraform workspace list: it shows the list of workspaces.
terraform workspace new dev: it will create the new workspace as "dev".
terraform workspace show: it will shows the current branch name.


12) Before terraform apply command i need to take approvals from concern team manager how can you write the code for  that?
Ans: While Executing this script form Jenkins, I will send the approval mail to the concern team/manager, it will give the approval it will execute the script, otherwise it will abort the job.

13) Already infrastructure is created by using cloud formation in AWS cloud, but Statefile is no there. How can you create a terraform statefile without disturb the infrastructure?
Ans: in Terraform, there is a command terraform import, it will import already existing infrastructure and create the statefile also.

14) how can we take backup of statefile?
Ans: for the backup of statefile, i will move the statefile into S3 bucket, while executing the script.

15) how can you lock the statefile?
Ans: By using the Dynamo DB, i will lock my statefile.

16)  Incase statefile is deleted what will happen to the infrastructure? and  how can we retrive the statefile back?
Ans: if the statefile is deleted, nothing will happen to infrastructure. we need to retrive the statefile back, there is a command in terraform as terraform import.

Ex: terraform import aws_vpc.example <provide vpc id>  it will retrive the vpc back into statefile.

17) what is terraform module?
Ans: Terraform module is a set of terraform configuration files. these files are kept in another directories.

18) write a terraform file for ec2 creation in diffrent regions by using modules?
Ans: 
provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}

provider "aws" {
    region = "us-east-1"
    alias = "n_virgenia"
}


resource "aws_instance" "new_ec2" {
    provider = aws.mumbai
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"
    key_name = "Minikube_Ravi"

    tags = {
        Name = "Ec2_instance"
    }
}


resource "aws_instance" "new_ec2" {
    provider = aws.n_virgenia
    ami = "ami-0767046d1677be5aO"
    instance_type = "t2.micro"
    key_name = "Virgenia"

    tags = {
        Name = "Ec2_instance"
    }
}

19) while we are using two providers in one terraform file, there some conflict occurs how to handle that error?
Ans: I will provide alias names for two providers.
provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}

provider "aws" {
    region = "us-east-1"
    alias = "n_virgenia"
}

20) What is Terraform Refresh Command?
Ans: terraform refresh: it will check any manual modification will be done in cloud level, it will be reflecting in statefile.

21) What is Terraform Taint Command?
Ans: terraform taint: it will delete the tainted resource when we are executing the terraform apply command.

22) I need to create 2 ec2 instances using terraform after that i need to create another 2ec2 instances how did terraform know already 2 ec2 instances are created?
Ans: First i will create 2 instances with count=2, after the instances are successfully created, i will change the count=4, terraform always checks the statefile and create remaining 2 instances.

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "new_ec2" {
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"
    key_name = "Minikube_Ravi"
    count = 2  # Change to 4, it will create another 2 ec2 instances.

    tags = {
        Name = "instances-${count.index}"
    }
}

23) In Terraform i need to create an instances with 5diffrent names, what names i have provided that much instances i need to create without using count in terraform, how can you write the code?
Ans: the script will be:

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "new_ec2" {
    ami = "ami-0767046d1677be5aO"
    instance_type = "t2.micro"
    key_name = "mumbai"
    count = length(var.instances)

    tags = {
        Name = var.instances[count.index]
    }
}

variable "instances" {
    type = list(string)
    description = "Provide multiple instances names"
    default = [ "Ramu", "Ravi", "Sita", "Gita", "chaithu", "ramya" ]
}

24) what is tf file,what is the purpose of tf file?
Ans: in Terraform .tf is used to define infrastructure code. this file is having provider, resources, variable and other elements that terraform uses to provide and manage infrastructure.

25) why we are using terraform init and what it will do?
Ans: terraform init: it will intialise the current repo and install required plugins and dependencies.

26) What is Provisioners?
Ans: Provisioners are used to model specific actions on local machines or on a remote machines in order to prepare servers.
There are 3types of provisioner. 1) File  Provisioners 2) Local-exec Provisioners 3) Remote-exec Provisioners
1) File Provisioners: It is used to copy files from local machine to remote machine.
2) Local-exec: It is used for execute any commands in the local machine using terraform we need local provisioner.
3) Remote-exec: It is used to execute any script on the remote machine using terraform we need remote provisioner.
