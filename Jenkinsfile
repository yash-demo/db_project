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
pipeline {
 agent any
  stages {
    stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/pipeline-testing/sample-microservice.git'
         }
      }
    stage('Build') {
         agent {
    kubernetes {
      label 'promo-app'  // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 5  // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yaml'  // path to the pod definition relative to the root of our project 
      defaultContainer 'maven'  // define a default container if more than a few stages use it, will default to jnlp container
    }
  }
      steps {  // no container directive is needed as the maven container is the default
        sh "mvn clean install"   
      }
    }
    stage('Build Docker Image') {
         agent {
    kubernetes {
      label 'promo-app'  // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 5  // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yaml'  // path to the pod definition relative to the root of our project 
      defaultContainer 'maven'  // define a default container if more than a few stages use it, will default to jnlp container
    }
  }
      steps {
        container('docker') {  
          sh "docker build -t vividseats/promo-app:dev ."  // when we run docker in this step, we're running it via a shell on the docker build-pod container, 
          sh "docker push vividseats/promo-app:dev"        // which is just connecting to the host docker deaemon
        }
      }
    }
  }
}
