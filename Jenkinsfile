pipeline {
    agent any

    environment {
        IMAGE_NAME = 'm1n4l/studentsurvey'
        IMAGE_TAG  = '0.3'
        FULL_IMAGE = "${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Minal-Arunashalam/swe645-hw2.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $FULL_IMAGE .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-pass', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
                sh 'docker push $FULL_IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-id', variable: 'KUBECONFIG_FILE')]) {
                    sh 'mkdir -p $WORKSPACE/.kube'
                    sh 'cp $KUBECONFIG_FILE $WORKSPACE/.kube/config'

                }
                sh 'kubectl get nodes'
                sh "kubectl --kubeconfig=$WORKSPACE/.kube/config set image deployment/hw2deployment container-0=$FULL_IMAGE --namespace=default"
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
