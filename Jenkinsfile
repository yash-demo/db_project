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
      
      stage('check1') {
          steps {
            sh 'kubectl version'
          }
      }
      
      stage('check2') {
          steps {
            sh 'docker images'
          }
      }
      
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/CI-CD-pipeline-testing/sample-microservice.git'
         }
      }
      stage('Deploy to Cluster1') {
          steps {
             powershell """
             minikube docker-env | Invoke-Expression
             """
          }
      }
     stage('step1') {
          steps {
            sh 'chmod +x ./gradlew'
          }
      }
      stage('step2') {
          steps {
            sh './gradlew build'
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
