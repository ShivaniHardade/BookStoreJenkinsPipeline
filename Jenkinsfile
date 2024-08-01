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
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: 'http://localhost:8081')], contextPath: '/bookstore', war: '**/onlinebookstore.war'
            }
        }
    }
}
