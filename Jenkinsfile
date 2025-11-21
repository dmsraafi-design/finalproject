pipeline {
    agent any

    environment {
        IMAGE_NAME = "devsecops-app:latest"
        K8S_DEPLOYMENT = "devsecops-app"
    }

    stages {

        stage('Checkout SCM') {
            steps {
                echo "Checking out source code..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh """
                docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Security Scan') {
            steps {
                echo "Running Trivy scan..."
                sh """
                trivy image --exit-code 1 --severity HIGH,CRITICAL ${IMAGE_NAME} || {
                    echo "High/CRITICAL vulnerabilities found! Failing pipeline."
                    exit 1
                }
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying to Minikube..."
                sh """
                kubectl apply -f helm-chart/templates/deployment.yaml || \
                kubectl create deployment ${K8S_DEPLOYMENT} --image=${IMAGE_NAME}
                kubectl get pods
                """
            }
        }

        stage('Simulate Falco & n8n Alert') {
            steps {
                echo "Simulating Falco runtime detection & n8n automation..."
                // nanti bisa diganti dengan curl ke n8n workflow webhook
                sh """
                echo '{ "alert": "Suspicious activity detected", "pod": "${K8S_DEPLOYMENT}" }'
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
        success {
            echo "Build and deploy succeeded!"
        }
        failure {
            echo "Pipeline failed! Check logs."
        }
    }
}
