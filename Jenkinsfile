pipeline {
	agent{
	label 'slave1'
	}
	parameters {
		choice(name: 'ENVIRONMENT', choices: ['QA','UAT'], description: 'Pick Environment value')
	}
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/guru/slaveDD2/apache-maven-3.9.0/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/guru/slaveDD2/apache-tomcat-9.0.72/webapps'
			}}
		stage('Docker build'){
		    steps {
			sh 'docker build -t swapnilhub/pipelineimage11.1.2 .'
			}}
		stage('Docker Login'){
		    steps {
		withCredentials([string(credentialsId: 'swapnilhub', variable: 'docker-swapnilhub')]){
    		sh 'docker login -u swapnilhub -p${docker-swapnilhub}'                 
			echo 'Login Completed'
			}
			
			}}
		stage('Push Image to Docker Hub') {         
    		    steps{                            
 			sh 'docker push swapnilhub/pipelineimage11.1.2:$BUILD_NUMBER'           
			echo 'Push Image Completed'       
    			}}
		
}}
