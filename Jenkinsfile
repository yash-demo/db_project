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
     

        stage('Run Ansible'){
           agent{
              docker {
                 image 'ansible_main_ansible'
                 reuseNode true
              }
                 
           }
            steps{
                ansible-playbook demo.yaml
            }
        }
    }
}
