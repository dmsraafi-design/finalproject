pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/dmsraafi-design/finalproject.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t payaman-app:latest .'
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh 'trivy image --exit-code 0 payaman-app:latest'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh """
                    docker login -u $USER -p $PASS
                    docker tag payaman-app:latest $USER/payaman-app:latest
                    docker push $USER/payaman-app:latest
                    """
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}

