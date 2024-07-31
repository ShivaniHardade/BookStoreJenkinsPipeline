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
                sh 'mvn clean install'  // Adjust if your build command is different
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with a tag 'bookstorejenkinspipeline:latest'
                    docker.build("bookstorejenkinspipeline:latest")
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh '''
                    docker stop bookstore_container || true
                    docker rm bookstore_container || true
                    '''
                    // Run a new container from the image
                    sh '''
                    docker run -d --name bookstore_container -p 8080:8080 bookstorejenkinspipeline:latest
                    '''
                }
            }
        }
    }
}
