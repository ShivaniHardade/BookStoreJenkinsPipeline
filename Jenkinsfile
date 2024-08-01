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
                bat 'mvn clean install'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                script {
                    def tomcatUrl = 'http://localhost:8081/manager/text'
                    deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', url: tomcatUrl, path: '/onlinebookstore')],
                           war: '**/onlinebookstore.war'
                }
            }
        }
    }
}
