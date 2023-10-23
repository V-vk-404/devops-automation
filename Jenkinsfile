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
        stage('SonarQube Analysis'){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonar-token') {
                          sh 'mvn sonar:sonar'
                       }
                   }  
              }
        }
        stage('SonarQube Qulity Gate'){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
                   }  
              }
        }
         stage('Docker Build Image'){
            steps{
                script{
                    sh 'sudo docker build -t jarvis99/devops-integration .'
                   }  
              }
        }
        stage('Docker Push Image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-passwords', variable: 'docker_password')]) {
                       sh ' sudo  docker login -u jarvis99 -p $docker_password'
                    }
                       sh ' sudo docker push jarvis99/devops-integration'
                   }  
              }
        }
        stage('Create Docker Container'){
            steps{
                script{
                    sh 'sudo docker run -dit --name maven-project -p 80:8080 jarvis99/devops-integration' 
                }
            }
        }
    }
}
