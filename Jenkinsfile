pipeline {
  agent { label 'macos' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKER_HUB_CREDS = credentials('darinpope-docker-hub')
    AWS_CREDS = credentials('darinpope-aws-creds')
  }
  stages {
    stage('Select context') {
      steps {
        sh 'docker context use darinpope-ecs-context'
      }
    }
  }
}