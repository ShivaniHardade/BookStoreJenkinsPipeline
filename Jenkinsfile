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
                bat 'mvn clean install'  // Use 'bat' for Windows batch commands
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
                    bat '''
                    docker stop bookstore_container || echo "No container to stop"
                    docker rm bookstore_container || echo "No container to remove"
                    '''
                    // Run a new container from the image
                    bat '''
                    docker run -d --name bookstore_container -p 8080:8080 bookstorejenkinspipeline:latest
                    '''
                }
            }
        }
    }
}
