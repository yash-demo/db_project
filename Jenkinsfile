pipeline {
   agent any

   environment {
     // You must set the following environment variables
     // ORGANIZATION_NAME
     // YOUR_DOCKERHUB_USERNAME (it doesn't matter if you don't have one)
     
     SERVICE_NAME = "sample-microservice"
     REPOSITORY_TAG="${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }
   
   
   stages {
      
      stage('Deploy') {
          steps {
            sh 'kubectl version'
          }
      }
      
      stage('Deploy1') {
          steps {
            sh 'docker version'
          }
      }
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/CI-CD-pipeline-testing/sample-microservice.git'
         }
      }
     
     
      stage('Build and Push Image') {
         steps {
           sh 'docker build -f Dockerfile -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Deploy to Cluster') {
          steps {
            sh 'kubectl apply -f gradle.yaml'
          }
      }
   }
}
