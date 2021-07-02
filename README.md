Create Jenkins pipeline to build and deploy microservice-1 to the local cluster using ansible roles.

# microservice-1
This repo holds a sample microservice to be deployed to Kubernetes

To give gradle premission run:
git update-index --chmod=+x gradlew

Congiure Jenkins
1. Manage Jenkins->Congiure system-> environmental variable
Name: ORGANIZATION_NAME value: Your Github organization name
2. Cloud->Add kubernete->Add cluster url and 
3. Manage Jenkins-> Plugins -> Install Gradle plugin
4. Manage Jenkins ->Global tool configuration
Add gradle installer
5. Manage Jenkins-> Manage credentials
Create personal access token in github with user jenkins-user
Add them to jenkins credentials with ID GitHub
6. Create a multibranch  pipeline 
- Add branch source github-> Select user ->add repo url
- Add owner name as organization name and select repo 
- In GitHub itself click add, from the dropdown select Advanced sub-modules behaviours
  - Select Recursively update submodules
  - Select Use credentials from default remote of parent repository
  - Add your submodule repo url (for our project, ansible_roles github repo) 
6. Click save
