pipeline {
    agent any

    environment {
        IMAGE_NAME = "simpleapp"
        IMAGE_TAG  = "1"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Files') {
            steps {
                sh '''
                    echo "Workspace content:"
                    ls -la
                    echo "Searching for Dockerfile:"
                    find . -name Dockerfile
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    echo "Running container..."
                    docker rm -f simpleapp || true
                    docker run -d --name simpleapp -p 8080:8080 ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
