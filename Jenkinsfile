pipeline {
   agent any

   stages {
     
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/pipeline-testing/sample-microservice.git'
         }
      }
     

        stage('Run Ansible'){
            steps{
                sh 'docker images'
            }
        }
    }
}
