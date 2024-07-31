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
                sh 'mvn clean install'  // Adjust the build command as per your project's requirements
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("bookstorejenkinspipeline:latest")
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                sh '''
                docker stop bookstore_container || true
                docker rm bookstore_container || true
                docker run -d --name bookstore_container -p 8080:8080 bookstorejenkinspipeline:latest
                '''
            }
        }
    }
}
