pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t darinpope/java-web-app:latest .'
      }
    }
    stage('Scan') {
      steps {
        sh 'trivy darinpope/java-web-app:latest'
      }
    }
  }
}