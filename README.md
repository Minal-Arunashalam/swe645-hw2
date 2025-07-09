# SWE 645 Assignment 2

This is a Java web app packaged as a WAR file and deployed to Kubernetes on AWS EC2 using a Jenkins CI/CD pipeline. demonstration

---

## Live URLs

on S3: [http://hw1-swe645-minal.s3-website.us-east-2.amazonaws.com](http://hw1-swe645-minal.s3-website.us-east-2.amazonaws.com)

on EC2: [http://44.204.26.44/](http://44.204.26.44/)

**Kubernetes deployment:** [http://ec2-54-144-174-126.compute-1.amazonaws.com:31247/StudentSurvey/](http://ec2-54-144-174-126.compute-1.amazonaws.com:31247/StudentSurvey/)

_Demo Video:_ [https://vimeo.com/1099843951?share=copy]([url](https://vimeo.com/1099843951?share=copy))

---

## Overview

This assignment demonstrates:

- Building a Java WAR using Maven
- Containerizing the app with Docker
- Pushing the image to Docker Hub
- Deploying to a Kubernetes cluster managed with Rancher
- Automating the entire workflow with Jenkins on AWS

---

## Tools Used

- **AWS EC2:** Hosts Jenkins and Rancher instances
- **Jenkins:** CI/CD pipeline automation
- **Docker/Docker Hub:** Containerization and Image registry
- **Maven:** Java build tool
- **Kubernetes:** Container orchestration
- **Rancher:** Kubernetes cluster management

---

## Installation & Setup


1. **Initial Setup**
   - make a Git repo and push code, Dockerfile, Maven project files, and Jenkinsfile once it's made.
   - Build Docker image of project and push to Docker Hub.
  
2. **AWS EC2 Setup**
   - Provision EC2 instances to host Jenkins, Rancher, and the Kubernetes cluster. Make sure they are large instances with storage volumes of at least 30 GiB.
   - Make sure inbound traffic from ports 80, 22, 443 (and 8080 for the Jenkins instance) is allowed in the security group.
   - Also make an Elastic IP Address and associate it with the instance that will be running Rancher.

3. **Rancher & Kubernetes**
   - Install Rancher and Docker on one of the EC2 instances to manage the Kubernetes cluster.
   - Create a custom cluster in Rancher. This cluster can be run on the same instance as Rancher if needed.
   - Create a Deployment with 3 Replicas, and give it the container image name of the image pushed to Docker Hub registry. Also add a NodePort.

4. **Jenkins Configuration**
   - Install Jenkins on a new EC2 instance, as well as Docker and kubectl.
   - Add credentials for Docker Hub and Kubernetes (kubeconfig).
   - Create and configure the pipeline using the Jenkins UI and Jenkinsfile.

5. **Final CI/CD Pipeline**
   - Jenkins pipeline automates:
     - Code checkout from GitHub
     - Maven build to generate WAR file
     - Docker image build and push to Docker Hub
     - Kubernetes Deployment image update with `kubectl`
    
  
---

## References

- [AWS EC2](https://aws.amazon.com/ec2/)
- [Jenkins](https://www.jenkins.io/)
- [Docker](https://www.docker.com/)
- [Maven](https://maven.apache.org/)
- [Kubernetes](https://kubernetes.io/)
- [Rancher](https://rancher.com/)
- [Docker Hub](https://hub.docker.com/)
