pipeline {
    agent any

    environment {
        IMAGE_NAME = 'simple-weather-app'
        CONTAINER_NAME = 'simple-weather'
    }

    stages {
        stage('Checkout Repository') {
            steps {
                git url: 'https://github.com/Grandhechaithu/simple-weather.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Clean Existing Containers') {
            steps {
                bat """
                    docker rm -f ${CONTAINER_NAME} || echo "No running container to remove"
                    docker-compose down
                """
            }
        }

        stage('Run with Docker Compose') {
            steps {
                bat "docker-compose up -d"
            }
        }
    }

    post {
        always {
            echo 'Cleaning up old containers...'
            bat "docker-compose down"
        }
    }
}
