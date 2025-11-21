pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out source code..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Simulating build process..."
            }
        }

        stage('Security Scan') {
            steps {
                echo "Running security scan..."
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy simulation..."
            }
        }
    }
}
