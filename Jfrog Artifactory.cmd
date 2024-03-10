sudo apt update

sudo apt install default-jdk -y

sudo wget -qO - https://api.bintray.com/orgs/jfrog/keys/gpg/public.key | sudo apt-key add - 

sudo add-apt-repository "deb [arch=amd64] https://jfrog.bintray.com/artifactory-debs $(lsb_release -cs) main"

sudo apt-get update

sudo apt install jfrog-artifactory-oss -y