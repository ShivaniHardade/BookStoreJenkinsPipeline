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
        // stage('Build Docker Image') {
        //     steps {
        //         script {
        //             try {
        //                 docker.build("bookstorejenkinspipeline:latest", "--no-cache .")
        //             } catch (Exception e) {
        //                 echo "Docker build failed: ${e.getMessage()}"
        //                 currentBuild.result = 'FAILURE'
        //             }
        //         }
        //     }
        // }
    }
}
