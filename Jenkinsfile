pipeline {
	agent any
	
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
		stage('Push Docker image'){
		    steps {
			withCredentials([string(credentialsId: 'swapnil-dockerhub', variable: 'Dockerhub-Credentials')]) {
			
			sh 'docker login --username swapnilhub --password-stdin $Dockerhub-Credentials'

			sh 'docker push swapnilhub/pipelineimage1'
			}
			}}
}}
