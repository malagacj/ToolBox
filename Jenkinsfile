pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the project'
                sh 'echo "Hello from Jenkins Pipeline"'
                sh 'pwd'
                sh 'ls -la'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests'
                sh 'echo "Running some basic tests"'
                // Add your test commands here
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying the application'
                // Add deployment steps if needed
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
