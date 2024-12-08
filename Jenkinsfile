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
        stage ('Login to Dockerhub'){
            steps{
                // USe Dockerhub Credentils to login 
                withCredentials([string (credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')])
                {
                    sh "docker login -u kubepankaj -p ${dockerhubpwd} "
                    echo 'login Successfully'
                }
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    echo "Building Docker Image ${IMAGE_TAG}"
                    sh 'docker build -t ${IMAGE_TAG} . '
                    echo "Successfully built an Image ${IMAGE_TAG}"
                }
            }
        }
        stage('Approve the Image'){
            steps{
                script{
                    //Taking the approval to run which container from the user which Image is to be send to dockerhub.
                    def userInput = input (id: 'userInput', message: 'Approve and provided docker image', parameters: [string(name: 'DOCKER_IMAGE', defaultValue: 'defaultValue', description: 'Enter the docker image')])
                    env.DOCKER_IMAGE = userInput
                }
            }
        }
        stage('Deploy to dockerhub'){
            steps{
                script{
                    echo "Deploiyng Docker image ${env.DOCKER_IMAGE}"
                    sh"docker push ${env.Docker_IMAGE}"
                    //sh "docker run -d ${env.DOCKER_IMAGE}"
                }
            }
        }
    }
}
