pipeline {
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
