pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build') {
      steps {
        sh './mvnw clean install site surefire-report:report'
        sh 'tree'
      }
    }
  }
}