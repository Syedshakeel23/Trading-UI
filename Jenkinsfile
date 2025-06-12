pipeline {
    agent any

    environment {
        IMAGE_NAME = "syed411/trading-ui"
        DOCKER_CREDENTIALS_ID = "dockerhub-creds"
    }

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/Syedshakeel23/Trading-UI.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || true'  // Adjust depending on test config
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh "docker stop trading-ui || true"
                    sh "docker rm trading-ui || true"
                    sh "docker run -d --name trading-ui -p 3000:3000 ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
