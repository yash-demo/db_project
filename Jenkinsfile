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
     
        node('test-node'){
        stage('Run Ansible'){
           container('ansible'){
           
            steps{
                sh 'ansible-playbook -i inventory.yaml demo.yaml'
            }
            }
        }
        }
    }
}
