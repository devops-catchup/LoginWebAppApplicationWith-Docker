pipeline {
	agent any 
	
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build & compile') {
	           steps {
			  sh '/home/swapnil/Documents/DevOps-Software/apache-maven-3.9.4/bin/mvn install'
	                 }}
		stage('Deployment'){
		   steps {
		sh 'cp target/LoginWebAppApplicationWith-Docker.war /home/swapnil/Documents/DevOps-Software/apache-tomcat-9.0.79/webapps'
			}}
		stage('slack-notification'){
		   steps {
		     slackSend baseUrl: 'https://hooks.slack.com/services/', channel: '#devops-online-slack', color: 'good', message: 'Welcome to Jenkins slack integration for devops slack jobs', teamDomain: 'devops', tokenCredentialId: 'slack'
		     }}	
}}
