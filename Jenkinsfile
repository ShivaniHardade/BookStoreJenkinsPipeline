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
                    def dockerImage = 'bookstorejenkinspipeline:latest'
                    docker.build(dockerImage, "--no-cache .")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage = 'bookstorejenkinspipeline:latest'
                    def dockerRegistry = 'https://index.docker.io/v1/'
                    docker.withRegistry(dockerRegistry, 'docker-credentials-id') {
                        docker.image(dockerImage).push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    def dockerImage = 'bookstorejenkinspipeline:latest'
                    def kubernetesDeployment = 'bookstore-deployment'
                    withKubeConfig([credentialsId: 'kubeconfig-id']) {
                        bat """
                            kubectl set image deployment/${kubernetesDeployment} bookstore=${dockerImage}
                        """
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
