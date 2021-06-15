/* pipeline {
   agent any

   stages {
     
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/pipeline-testing/sample-microservice.git'
         }
      }
      stage('Preparation1') {
         steps {
            sh 'hostname'
            sh 'ifconfig'
         }
      }
      stage('Preparation2') {
         steps {
            sh 'kubectl get pods'
           
         }
      }
     
      stage('Run ansible'){
         agent {
            kubernetes {
               label 'promo-app'  // all your pods will be named with this prefix, followed by a unique id
               idleMinutes 30  // how long the pod will live after no jobs have run on it
               yamlFile 'build-pod.yaml'  // path to the pod definition relative to the root of our project 
               defaultContainer 'jnlp'  // define a default container if more than a few stages use it, will default to jnlp container
             }
          }
          steps{
             container('ansible'){
                sh 'ansible-playbook demo.yaml'
              }
          }    
         
      }
    }
}
*/
/*
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
     
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/CI-CD-pipeline-testing/sample-microservice.git'
         }
      }
      
     stage('Permission') {
          steps {
            sh 'chmod +x ./gradlew'
          }
      }
      stage('Build Jar') {
          steps {
            sh './gradlew build'
          }
      }
      stage('Build Image') {
         steps {
           sh 'docker build -f Dockerfile -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Deploy to Cluster') {
          steps {
            sh 'kubectl apply -f gradle.yaml'
             sh 'kubectl set image deployments/gradle-deployment gradle-deployment=${REPOSITORY_TAG} -n jenkins'
          }
      }
   }
}
*/
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
     
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/CI-CD-pipeline-testing/sample-microservice.git'
         }
      }
      
     stage('Permission') {
          steps {
            sh 'kubectl get pods'
          }
      }
      stage('Build Jar') {
          steps {
            sh 'docker images'
          }
      }
      
   }
}
