  
pipeline {
   agent any

   
   environment {

     
     SERVICE_NAME = "hello_microservice"
     REPOSITORY_TAG="${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }   
   
   stages {
     
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GitHub', url: 'https://github.com/yash-demo/db_project.git'  
            sh 'git submodule update --init --recursive'           
         }
      }

      stage('Set application properties'){

         agent{
              docker {
                 image 'ansible_main_ansible'
                 reuseNode true
              }
         }

          steps{ 
                sh 'ansible-playbook application.yml  '
             
              
          }    
      }

      
      stage('Build Jar') {
          steps {
            sh './gradlew build '
          }
      }

      stage('Run ansible'){

         agent{
              docker {
                 image 'ansible_main_ansible'
                 reuseNode true
              }
         }

          steps{ 
                sh 'ansible-galaxy collection install community.kubernetes'
                sh 'ansible-playbook roles.yml -e "image=$REPOSITORY_TAG" '
             
              
          }    
      } 
   }
}
