# AutomationChallenge
AutomationChallenge
# **Elastic Stack on K8S (Minikube)**

## **Automated provisioning of Elastic Stack on K8S (Backed by Minikube in AWS)**

This repository covers automated provisioning of ElasticStack (*ElasticSearch/Filebeat/Kibana*) on Minikube. The setup includes provisoning an EC2 instance on AWS with Terraform and subsequently deploying *Docker, Minikube, kubectl, git, jq* inside the EC2 instance. CI/CD pipeline from jenkinsfile can then deploy ElasticStack on Minikube and run.



### **Pre-requisites:**
- *Git* should be installed on your local machine
- *Terraform* should be installed on your local machine
- AWS access-key/secret pair
- Execute terraform init, terraform plan , terraform apply
- Install java , jenkins to run the CI/CD pipeline
- Configure github weebhook to integrate with jenkins
- Install Docker,Kubectl,minikube,jq



### **Repository structure**
```
├── README.md
├── elasticstack                            (K8S templates for deployment)
│   ├── elasticsearch.yml
│   ├── filebeat-configmap.yml
│   ├── filebeat-daemonset.yml
│   ├── filebeat-role-binding.yml
│   ├── filebeat-role.yml
│   ├── filebeat-service-account.yml
│   ├── kibana.yml
|
└── minikube-terraform                      (Terraform scripts)
    ├── main.tf
    ├── setup.sh
    └── variables.tf
```



### Basic Workflow:

## Steps

**1) Clone the repository in your local machine**
```
git clone https://github.com/rachelgreene/AutomationChallenge.git
```


**2) Provision an EC2 instance on Terraform**

**Note**: Before triggering terraform, you will have to customize variable values in `minikube-terraform/variables.tf` file, because all defaults may not suit your requirements. Please note that you update your AWS key-pair name and ingress CIDR range to be able to access the instance later.

Once you have all the values in place, please run:
```
cd minikube-terraform; terraform apply;
```

This will start provisioning an EC2 instance with security group definition and corresponding ingress/egress rules

A cloud-init script is configured as part of EC2 instance creation. This takes care of setting up tools like:
- kubectl 
- Docker
- Minikube 
- Other system tools like jq, git etc.

After Terraform run completes:

The public dns endpoint / ip-address will allow access to the EC2 instance. 


**3) Setup Jenkins in local**

Configure github webhook with the push event to integrate github with jenkins.As soon as a github push occurs , jenkins immediately senses it and the CI/CD pipeline starts executing.



**4) Push code from local machine to the repository to enable pipeline execution and test**

git add .
git status 
git commit -m "testing"
git status
git push

Code push will trigger the Jenkins pipeline.Detailed steps can be seen in the console output screen.


**5) Access Kibana on local machine**

In order to run Kibana on local machine:

Check in browser using the url : https://public ip of ek8s-instance:30770



Kibana dashboard can now be accessed on your local machine.





