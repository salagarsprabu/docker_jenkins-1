pipeline {
   agent any
   environment {
       registry = "9912720749/jenkins-demo"
       registryCredential= 'dockerhub'
       dockerImage=''
   }

   stages {
      stage('SCM checkout') {
         steps {
            git 'https://github.com/devopstraining1990/docker_tomcat.git'
         }
      }
      stage('Build Docker Image') {
         steps {
            script{
               dockerImage= docker.build registry + ":$BUILD_NUMBER"
            }
         }
      }
      stage('Deploy Image') {
         steps {
            script{
               docker.withRegistry('https://registry.hub.docker.com',registryCredential ){
                   dockerImage.push()
               }
            }
         }
      }
      stage('Remove Image') {
         steps {
            sh "docker rmi $registry:$BUILD_NUMBER"
         }
      }
   }
}
