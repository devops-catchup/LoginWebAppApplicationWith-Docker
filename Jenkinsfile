pipeline {
	agent any

	environment {     
    		DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
  		}  
	
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/swapnil/Documents/DevOps-softwares/apache-maven-3.9.0/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			
			sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/swapnil/Documents/DevOps-softwares/apache-tomcat-9.0.72/webapps'
			}}
		stage('Docker build'){
		    steps {
			
			sh 'docker build -t swapnilhub/pipelineimage11 .'
			}}
		stage('Docker Login'){
		    steps {
			withCredentials([usernameColonPassword(credentialsId: 'dockerhubcredentials', variable: 'dockerhub_crede')]) {
    		sh 'docker login -u swapnilhub -p${dockerhub_crede}'                 
			echo 'Login Completed'
			}
			
			}}
		stage('Push Image to Docker Hub') {         
    		    steps{                            
 			sh 'sudo docker push swapnilhub/pipelineimage11:$BUILD_NUMBER'           
			echo 'Push Image Completed'       
    			}}  
}}
