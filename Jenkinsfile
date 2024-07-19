pipeline {
	agent{
	label 'slave-1'
	}
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/grras/slavedir/apache-maven-3.9.4/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/swapnil/Documents/DevOps-Software/apache-tomcat-9.0.79/webapps'
			}}	
}}
