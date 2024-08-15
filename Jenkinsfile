pipeline {
    agent any
    tools {
        maven 'Maven 3.6.3' // The name you provided in the configuration
    }
    environment {
        DOCKER_IMAGE = "bookstore:latest"
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
                        sh "docker build --no-cache -t ${DOCKER_IMAGE} ."
                    } catch (Exception e) {
                        echo "Docker build failed: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
    post {
        failure {
            echo 'The build failed.'
            
        }
        success {
            echo 'The build succeeded.'
            
        }
    }
}
