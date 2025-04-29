pipeline {
    agent any

    environment {
        IMAGE_NAME = 'simple-weather-app'
        CONTAINER_NAME = 'weather-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Grandhechaithu/simple-weather.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Run with Docker Compose') {
            steps {
                bat 'docker-compose down'
                bat 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up old containers...'
            bat 'docker-compose down'
        }
    }
}
