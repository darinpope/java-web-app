pipeline {
  agent { label 'macos' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKER_HUB_CREDS = credentials('darinpope-docker-hub')
    AWS_CREDS = credentials('darinpope-aws-creds')
    KEYCHAIN_PASSWORD = credentials('darinpope-keychain')
  }
  stages {
    stage('Tooling versions') {
      steps {
        sh '''
          docker --version
          docker compose version
        '''
      }
    }
    stage('Unlock keychain') {
      steps {
        sh 'security -v unlock-keychain -p $KEYCHAIN_PASSWORD ~/Library/Keychains/login.keychain-db'
      }
    }
    stage('Build') {
      steps {
        sh 'docker context use default'
        sh 'docker compose build'
        sh 'docker compose push'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker context use myecscontext'
        sh 'docker compose up'
        sh 'docker compose ps --format json'
      }
    }
  }
  post {
    always {
        sh 'security -v lock-keychain ~/Library/Keychains/login.keychain-db'
    }
  }
}
