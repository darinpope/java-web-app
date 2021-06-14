pipeline {
  agent { label 'macos' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKER_HUB_CREDS = credentials('darinpope-docker-hub')
  }
  stages {
    stage('Login') {
      steps {
        sh 'echo $DOCKER_HUB_CREDS_PSW | docker login --username=$DOCKER_HUB_CREDS_USR --password-stdin'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}