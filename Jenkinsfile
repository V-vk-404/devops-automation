pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    git branch: 'main', url: 'https://github.com/V-vk-404/devops-automation.git'
                   }  
              }
        }
        stage('Maven Build '){
            steps{
                script{
                    sh 'mvn clean install'
                   }  
              }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh 'sudo docker build -t jarvis99/devops-integration .'
                   }  
              }
        }
        stage('Push Docker Image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-passwords', variable: 'docker_password')]) {
                       sh ' sudo  docker login -u jarvis99 -p $docker_password'
                    }
                       sh ' sudo docker push jarvis99/devops-integration'
                   }  
              }
        }
        stage('Deploy To Kubernetes Container'){
            steps{
                script{
                    sh 'kubectl apply -f deploymentservice.yaml' 
                }
            }
        }
    }
}
