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
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = 'shiv512/myusername:latest'
                    docker.build(dockerImage, "--no-cache .")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage = 'shiv512/myusername:latest'
                    def dockerRegistry = 'https://index.docker.io'
                    docker.withRegistry(dockerRegistry, 'docker-credentials-id') {
                        docker.image(dockerImage).push('latest')
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
