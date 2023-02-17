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
			  sh '/home/swapnil/Documents/GRRAS/apache-maven-3.6.0/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			
			sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/swapnil/Documents/GRRAS/apache-tomcat-8.5.35/webapps'
			}}
		stage('Docker build'){
		    steps {
			
			sh 'docker build -t swapnilhub/pipelineimage1 .'
			}}
		stage('Docker Login'){
		    steps {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
			echo 'Login Completed'
			}}
}}
