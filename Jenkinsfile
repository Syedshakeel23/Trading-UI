pipeline {
    agent any
    tools {
        nodejs "NodeJS 18"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Syedshakeel23/Trading-UI'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying Application..."'
            }
        }
    }
}
