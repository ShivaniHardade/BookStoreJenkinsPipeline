pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-repo-url.git', branch: 'main'
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
                    def app = docker.build("your-image-name:latest")
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                sh '''
                docker stop your-container-name || true
                docker rm your-container-name || true
                docker run -d --name your-container-name -p 8080:8080 your-image-name:latest
                '''
            }
        }
    }
}
