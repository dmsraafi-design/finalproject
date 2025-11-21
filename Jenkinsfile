pipeline {
    agent any

    environment {
        IMAGE_NAME = 'devsecops-app:latest'
        REGISTRY = 'your-docker-registry' // ganti kalau mau push ke registry
    }

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Running security scan...'
                sh 'echo "Simulated security scan..."'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'echo "Simulated deployment..."'
            }
        }

        stage('Simulate Falco & n8n Alert') {
            steps {
                echo 'Simulating alerts...'
                sh 'echo "Simulated Falco & n8n alert triggered."'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed! Check logs.'
        }
    }
}

