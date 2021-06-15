pipeline {
  agent { label 'macos' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Checkout') {
      steps {
        git(branch: 'copilot', url: 'https://github.com/darinpope/java-web-app.git')
        sh 'copilot --version'
      }
    }
  }
}