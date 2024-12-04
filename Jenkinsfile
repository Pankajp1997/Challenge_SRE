pipeline {
    agent any
    environment {
        IMAGE_NAME = 'kubepankaj/flaskr-app'
        IMAGE_TAG = "${IMAGE_NAME}:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Prepare Workspace') {
            steps {
                // Remove the flaskr-app project workspace if it exists
                sh 'rm -rf flaskr-app'
            }
        }
        stage('CheckOut Code'){
            steps{
                sh 'git clone https://github.com/Pankajp1997/Challenge_SRE.git flaskr-app'
            }
        }
        stage('Set Up environment'){
            steps{
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                cd flaskr-app
                pip install -r requirements.txt --break-system-packages --ignore-installed
                pip install -e . --break-system-packages --ignore-installed
                '''
                
            }
        }
        stage('Unit Testing'){
            steps{
                sh '. venv/bin/activate'
                sh 'pytest'
            }
        }
    }
}
