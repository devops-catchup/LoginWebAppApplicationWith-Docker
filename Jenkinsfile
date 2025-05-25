pipeline {
    agent any
    tools{
        jdk 'java-17'
        maven 'Maven3.9'
    }
     stages{
        stage("Git Checkout"){
            steps{
                git branch: 'master', changelog: false, poll: false, url: 'https://github.com/devops-catchup/LoginWebAppApplicationWith-Docker.git'
            }
        }
        stage("Compile"){
            steps{
                sh "mvn clean compile"
            }
        }
         stage("Test Cases"){
            steps{
                sh "mvn test"
            }
        }
        stage("Sonarqube Scanner"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'Sonar-token') {
                    sh 'mvn sonar:sonar'   
                    }
                 }
            }
        }
        stage("Build"){
            steps{
                sh " mvn clean install"
            }
        }
       stage("Docker Build and Image Push"){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'Docker-Hub', toolName: 'docker') {
                       sh "docker build -t swapnilhub/loginwebapp123 ."
                       sh "docker push swapnilhub/loginwebapp123:latest"
                    }
                }
            }     
        }
        stage("Deploy using Docker container"){
            steps{
                sh "docker run -d --name loginweb -p 8082:8082 swapnilhub/loginwebapp123:latest"
            }
        } 
         
}
}
