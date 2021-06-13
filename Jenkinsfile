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
            
            sh 'which ansible'
         }
      }
      
        stage('Run Ansible'){
            steps{
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'host.inv', playbook: 'apache.yml'
            }
        }
    }
}
