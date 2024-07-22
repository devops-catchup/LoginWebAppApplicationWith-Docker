pipeline {
	agent{
	label 'slave12'
	}
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh 'JAVA_HOME=/home/grras/slave2/jdk-11.0.20' 
			  sh '/home/grras/slave2/apache-maven-3.9.4/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/grras/slave2/apache-tomcat-9.0.79/webapps'
			}}	
}}
