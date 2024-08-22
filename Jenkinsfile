pipeline {
    agent any
    tools {
        maven 'Maven 3.6.3' // The name you provided in the configuration
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
                    def dockerImage = 'shiv512/myusername:latest' // Docker image name
                    docker.build(dockerImage)
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage = 'shiv512/myusername:latest' // Docker image name
                    def dockerRegistry = 'https://index.docker.io/v1/' // Docker Hub registry URL
                    docker.withRegistry(dockerRegistry, 'docker-credentials-id') {
                        docker.image(dockerImage).push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    def dockerImage = 'shiv512/myusername:latest' // Docker image name
                    def kubernetesDeployment = 'bookstore-deployment' // Kubernetes deployment name
                    withKubeConfig([credentialsId: 'kubeconfig-id']) {
                        sh """
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
