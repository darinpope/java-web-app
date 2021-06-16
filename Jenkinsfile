pipeline {
  agent { label 'macos' }
  environment {
    AWS_CREDS = credentials('darinpope-aws-creds')
    KEYCHAIN_PASSWORD = credentials('darinpope-keychain')
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Unlock keychain') {
      steps {
        sh 'security -v unlock-keychain -p $KEYCHAIN_PASSWORD ~/Library/Keychains/login.keychain-db'
      }
    }    
    stage('Build and deploy') {
      steps {
        sh 'docker context use default'
        sh 'copilot --version'
        sh 'copilot init --app dp-test --name web --type "Request-Driven Web Service" --dockerfile "./Dockerfile" --deploy'
      }
    }
  }
  post {
    always {
        sh 'security -v lock-keychain ~/Library/Keychains/login.keychain-db'
    }
  }
}