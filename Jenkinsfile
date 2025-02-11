pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ShivaniHardade/BookStoreJenkinsPipeline.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                // Stop the Tomcat server
                sh './scripts/stop_server.sh'

                // Copy the WAR file to the Tomcat webapps directory
                sh 'cp target/onlinebookstore.war /path/to/tomcat/webapps/'

                // Start the Tomcat server
                sh './scripts/start_server.sh'
            }
        }
    }
}
