pipeline {
    agent any
    tools {
        maven 'Maven 3.6.3' // The name you provided in the configuration
    }
    environment {
        DOCKER_IMAGE = "bookstorejenkinspipeline:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ShivaniHardade/BookStoreJenkinsPipeline.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install' // Ensure Maven is installed on the Jenkins node
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        docker.build("${DOCKER_IMAGE}", "--no-cache .")
                    } catch (Exception e) {
                        echo "Docker build failed: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
        stage('Deploy Application') {
            steps {
                script {
                    try {
                        docker.image("${DOCKER_IMAGE}").run('-d -p 8081:8080')
                    } catch (Exception e) {
                        echo "Docker run failed: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
    post {
        failure {
            echo 'The build failed.'
            // Additional failure handling can be added here
        }
        success {
            echo 'The build succeeded.'
            // Additional success handling can be added here
        }
    }
}
