
# Script for Uploading Log files in to AWS S3 Bucket
#=====================================================

#!/bin/bash

i=0

while [$i -lt 11]    # -lt is  Lessthan or Equal to

do

date >> file	# Here iam Executing the date Command and upload that output into file1 only. 
				# if you need diffrent files then give as "date > file$i"

aws s3 cp file s3://<Bucket-name>

sleep 1		# it is waiting for 1sec

i=$(( $i +1 ))  # i will will be increases here

done

#*************************************************************************************************************************************


# Create a User in Linux and Assign the Random Password for the User:
#====================================================================

# Check if the Username is Exist or Not
# If Exist show an message and Not here create an User
# Set random password and change the password first Logon 
# Finally  the user is Successfully created

	#!/bin/bash
	
	# while [true]; do   # it is used for creating infinate user 
	
	read -p "Enter the Valid Username: " USERNAME    
	
	if [ -z $USERNAME ]; then
	
		echo " Not a Valid Username $USERNAME " 	# we could not provide any username it shows not valid here
		
	else
		echo " The Username is $USERNAME "
		
		EX_USER=$(cat /etc/passwd | cut -d ":" -f 1 | grep -w $USERNAME)    # Cut is used for to cut the data inthe column wise, "-d" is Delimiter and "-f" is Field.
		
		if [ $USERNAME = $EX_USER ]; then
		
			echo " user $USERNAME already Exist, Please try another Name "
			
		else 
			echo " Created a user: $USERNAME "
			
			SPEC=$(echo '!@#$%^&*()_+=-' | fold -w1 | shuf | head -1)  #Here the give symbols convert into columnwise and "shuf" is used for shuffle the symbols.
			
			PASSWORD=${USERNAME}${SPEC}${RANDOM}${SPEC}
			
			useradd -m $USERNAME
			
			chown $USERNAME:$USERNAME /home/$USERNAME
			
			echo " $USERNAME:$PASSWORD " | sudo chpasswd
			
			echo " user: $USERNAME and Password: $PASSWORD Successfully Created ...."
			
			passwd -e $USERNAME    # After user login the key will expire and ask for password change
		fi
	fi
	#done
	
	format check up "ctrl+shift+p"
	
*******************************************************************************************************************************************

Jenkins Pipeline Tigger From Python Code
================================
import jenkins
from jenkins import JenkinsException

def trigger_jenkins_job_build(server_url, username, password, job_name):
    try:
        # Connect to Jenkins server
        server = jenkins.Jenkins(server_url, username=username, password=password)

        # Check if the job exists
        if server.job_exists(job_name):
            # Trigger a build for the job
            server.build_job(job_name)
            print(f"Build triggered for job '{job_name}'.")
        else:
            print(f"Error: Job '{job_name}' does not exist.")

    except JenkinsException as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    # Jenkins server details
    jenkins_server_url = "your_jenkins_server_url"
    jenkins_username = "your_jenkins_username"
    jenkins_password = "your_jenkins_server_password"

    # Job details
    job_name = "your_job_name"

    # Trigger Jenkins job build
    trigger_jenkins_job_build(jenkins_server_url, jenkins_username, jenkins_password, job_name)

##########################################################################################################

Sed Uses:
=========

Creating any Script like "vim download.sh"

	#!/bin/bash

	wget terrform download link old version  ==> 0.12.10  
	wget packer download link old version ==> 1.5.0


execute the  script as ./download.sh

Here we are updating the version of Terraform and packer using "sed" command, the command will be

	sed -i 's/0.12.10/0.12.28/g'; 's/1.5.0/1.6.0/g' download.sh
	

Install Nginx and Access it from the browser 

We need to change the output of nginx server from welcome nginx to customosied then use the command using sed.

	sed -i 's/nginx!/Welcome to Customised Inginx/g' var/www/html/index.nginx-debain.html

To add the New line in the output of nginx line is

	sed '<Line Number> i <h1> Content provide here </h1>' -i var/www/html/index.nginx-debain.html
	
	EX: sed '15 i <h1> Welcome to New World of Nginx Webserver </h1>' -i var/www/html/index.nginx-debain.html
	
For Multiple Changes in the file we can use the Command as 

	sed  's/nginx!/Welcome to Customised Inginx/g; '15 i <h1> Welcome to New World of Nginx Webserver </h1>' -i var/www/html/index.nginx-debain.html

*******************************************************************************************************************************************

tr==> Translate
===============

It is used for changing the charecters in the file. 

tr vs sed:
---------
"tr" is used for changing the charecters in the file. but "sed" is used for changing at multiple lines and words.


Example of tr:
--------------

	echo "1,2,3,4,5,6,7,8,9,0" | tr "," " " 
	
Execute it will changes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	echo "1,2,3,4,5,6,7,8,9,0" | tr "," "-"

Execute it will changes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*******************************************************************************************************************************************

tmux ==> terminal multiplexer:
------------------------------

it is used for to split the terminal while the checking logs of execution of file.

execute 
	tmux ==> click on enter ==> here below we see green line ==> click ctrl+b ctrl+% ==> ctrl+b ctrl '
	
	come back to first terminal ==> "ctrl+b+shift+ <left arrow>"
	
to delete all terminals ==> execute "exit"

*******************************************************************************************************************************************

Creation of EBS Volumes in AWS Account using Bash Scripting
------------------------------------------------------------

==> first create an user in AWS account and Also create  access_key and secret_key

==> In Linux Server where you are executing the bash script, there we need to install aws-cli for that the commands will below

	sudo apt update
	
	sudo apt install -y aws-cli
	
	aws --version
	
	aws configure
	
	provide access_key
	
	provide secret_key
	
	region for your choice
	
	json or text format select one
	
then create a bash script using for loops:

	#!/bin/bash

	echo $*

	for VOL in $*

	do

	echo "creating the volumes in aws ......"

	aws ec2 create-volume --volume-type gp2 --size $VOL --availability-zone ap-south-1 

	done
	
Then Execute this it will create the volumes in AWS

*******************************************************************************************************************************************


Create bash script for download different versions of Terraform

	touch version

	vim version
	
	0.12.24
	0.12.25
	0.12.26
	0.12.27
	0.12.28

create a bash script file and call this version file in bash script
	
	vim terraform-install.sh
	
	#!/bin/bash
	
	for ver in $(cat version)
	
	PACKAGE=$(echo "https://releases.hashicrop.com/terrform/0.12.28/terrform_0.12.28_linux_amd64.zip" | sed 's/0.12.28/'"{$ver}"'/g'
	
	wget $PACKAGE
	
	ls -al | grep -i terraform
	
	sleep 5	
	
	done
	
Execute the Script it will download 5 diffrent versions of Terraform.

*******************************************************************************************************************************************