pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    CI = true
  }
  stages {
    stage('Build') {
      steps {
        sh './mvnw clean install'
      }
    }
    stage('Upload to Artifactory') {
      agent {
        docker {
          image 'releases-docker.jfrog.io/jfrog/jfrog-cli-v2:latest' 
          reuseNode true
        }
      }
      steps {
        sh 'jfrog rt upload --url http://192.168.1.3:8082/artifactory/ --user ${ARTIFACTORY_CREDS_USR} --password ${ARTIFACTORY_CREDS_PSW} target/demo-0.0.1-SNAPSHOT.jar java-web-app/'
      }
    }
  }
}