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
           agent{
              docker {
                 image 'ansible_main_ansible'
                 reuseNode true
              }
                 
           }
            steps{
                sh 'ansible-playbook demo.yaml'
            }
        }
    }
}
