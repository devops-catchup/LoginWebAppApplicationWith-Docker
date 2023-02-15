pipeline {
	agent any
	triggers { 
		pollSCM('H/1 * * * 1-7') 
	}
	parameters {
		choice(name: 'ENVIRONMENT', choices: ['QA', 'SIT'], description: 'Pick Environment value')
	}
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			   sh '/home/swapnil/Documents/jenkins-server/apache-maven-3.6.0/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			
			script {

		            if (ENVIRONMENT == 'QA'){
					sh 'sshpass -p "swapnil" scp target/swapnilkart.war swapnil@172.17.0.3:/home/swapnil/Distros/apache-tomcat-8.5.35/webapps'

					sh 'sshpass -p "swapnil" ssh swapnil@172.17.0.3 "JAVA_HOME=/home/swapnil/Distros/jdk1.8.0_191" "/home/swapnil/Distros/apache-tomcat-8.5.35/bin/startup.sh"'

					echo "Hello ${params.ENVIRONMENT}"
				}
			   else if(ENVIRONMENT == 'SIT'){
					sh 'sshpass -p "swapnil" scp target/swapnilkart.war swapnil@172.17.0.4:/home/swapnil/Distros/apache-tomcat-8.5.35/webapps'

					sh 'sshpass -p "swapnil" ssh swapnil@172.17.0.4 "JAVA_HOME=/home/swapnil/Distros/jdk1.8.0_191" "/home/swapnil/Distros/apache-tomcat-8.5.35/bin/startup.sh"'

					echo "Hello ${params.ENVIRONMENT}"
				}
			  }}}
       		
	}
}
