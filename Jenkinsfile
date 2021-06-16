pipeline {
  agent { label 'macos' }
  environment {
    AWS_CREDS = credentials('darinpope-aws-creds')
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build and deploy') {
      steps {
        sh 'copilot init --app dp-test --name web --type 'Request-Driven Web Service' --dockerfile './Dockerfile' --deploy'
      }
    }
  }
}