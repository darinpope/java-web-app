pipeline {
  agent { label 'macos' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Checkout') {
      steps {
        sh 'copilot --version'
      }
    }
  }
}